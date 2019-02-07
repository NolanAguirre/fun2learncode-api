const jwt = require('jwt-simple');
const db = require('./db')
const mailer = require('./')
const stripe = require("stripe")(process.env.STRIPE_TOKEN);
function validateAuthToken(session, user) {
    if (session && session.authToken) {
        try {
            const decrypt = jwt.decode(session.authToken, process.env.JWT_SECRET)
            if (decrypt.id === user) {
                return true
            }
        } catch (error) {
            return false
        }
    }
    return false
}

function calculatePrice(students, addons, promoCode, price){
    let total = 0;
    students.forEach((student)=>{
        let t = student.price || price
        if(promoCode){
            if(promoCode.percent){
                t *= ((100 - promoCode.effect)/100)
            }else{
                t -= promoCode.effect
            }
        }
        if(t < 0){
            t = 0
        }
        addons.forEach((addon)=>{
            t += addon.price
        })
        total += t;
    })
    return total.toFixed(2);
}

module.exports = {
    begin: async (req, res) => { //TODO update promo code to be use by student
        const {
            promoCode,
            addons,
            event,
            students,
            user,
            address
        } = req.body
        if(user && event && students && students.length > 0){
           if (validateAuthToken(req.session, user)) {
                try{
                    const processing = await db.transactionIsProcessing(user)
                    if(processing){
                        res.json({error:'A transaction is being process, try again.'})
                        return
                    }
                }catch(error){
                    res.json({error:'Something went wrong.'})
                    return;
                }
                let info;
                try{
                    info = await db.getRegistrationData({...req.body}, new Date().toISOString())
                }catch(error){
                    res.json({error:'Something went wrong while processing the data.'})
                    return;
                }
                let {
                    _students,
                    _promoCode,
                    _event,
                    _addons,
                    _overrides,
                    ..._studentCheck
                } = info
                if(_event === null){
                    res.json({error:'Error with event selection.'})
                    return
                }
                if(!_promoCode && promoCode != ""){
                    res.json({error:'Promo code is not valid.'})
                    return
                }
                if(students.length !== _students.length){
                    res.json({error:'Error with student selection.'})
                    return
                }
                if(_addons.length !== addons.length){
                    res.json({error:'Error with addon selection.'})
                    return
                }
                _students.forEach((student) => {
                    _overrides.forEach((override)=>{
                        if(student.id === override.student){
                            if(override.modified_price >= 0){
                                student.price = override.modified_price
                            }
                            _studentCheck[student.id].check_prerequisite = true;
                        }
                    })
                })
                for(let k in _studentCheck){
                    let v = _studentCheck[k];
                    if(!v.check_time || !v.check_registration || !v.check_prerequisite){
                        res.json({error:'Error with student selection'})
                        return;
                    }
                }
                const price = calculatePrice(_students, _addons, _promoCode, _event.price);
                try{
                    await db.storeTransaction(user, {_students, _promoCode, _event, _addons, _overrides, total:price});
                } catch(error){
                    res.json({error:'Error occured while storing transaction data.'})
                    return
                }
                res.json({total:price});
            } else {
                res.json({error: 'Unathorized.'})
            }
        }else{
            res.json({error:'Not enough information provided.'})
        }

    },
    process: async (req, res) => {
        const {
            user,
            token
        } = req.body
        if(user && token){
            let transaction;
            if (validateAuthToken(req.session, user)) {
                try{
                    transaction = await db.startTransaction(user)
                }catch(error){
                    console.log(error)
                    res.json({error:'Transaction currently being processed, please wait.'})
                    return;
                }
                const charge = await stripe.charges.create({
                        amount: transaction.total * 100,
                        currency: 'usd',
                        description: 'fun2learncode event charge',
                        source: token,
                        statement_descriptor: 'Fun2LearnCode Event'
                    }).then(data => data)
                    .catch((err) => {
                        console.log(err)
                        return {
                            paid: false
                        }
                    });
                if (charge.paid) {
                    db.storePayment(user, transaction, charge).then((data) => {
                        db.createEventRegistration(user, transaction._students, transaction._event.id, data).then(() => {
                            res.json({
                                message: 'Payment and registration successful',
                                students: transaction._students.map(student=>student.id)
                            })
                        }).catch((error) => {
                            console.log(error)
                            res.json({error:'Fatal error, request refund.'})
                        }).catch((error)=>{
                            console.log(error)
                            res.json({error:'Fatal error, request refund'})
                        })
                    })
                } else {
                    res.json({
                        error: 'Card declined'
                    })
                }
                db.endTransaction(user)
            }
        }
    },
    refund: async (req, res) => {
        const {
            user,
            reason,
            paymentId,
            amount,
            unregister
        } = req.body
        if (req.session && req.session.authToken) {
            try{
                const decrypt = jwt.decode(req.session.authToken, process.env.JWT_SECRET)
                if (decrypt.role === 'ftlc_owner') {
                    if(!user || !paymentId || !reason){
                        res.json({error:'not enough information provided.'})
                        return;
                    }
                    let payment;
                    try{
                        payment = await db.getPayment(paymentId)
                    }catch(error){
                        res.json({error:'Could not find payment with given id'})
                        return;
                    }
                    try {
                        const refund = await stripe.refunds.create({
                            charge: payment.charge.id,
                            amount: amount * 100,
                        });
                        if (refund.status === 'succeeded') {
                            try {
                                await db.processRefund(payment, refund, unregister, reason)
                                //send mailer
                                res.json({complete:'refund successful'})
                            } catch (error) {
                                res.json({error:'refund processed, but failed to update database records.'})
                            }
                        } else {
                            res.json({error: 'the refund attempted and failed', stripeError:refund.failure_reason})
                        }
                    }catch(error){
                        res.json({error:'something happened with stripe', stripeError:error})
                    }
                }else{
                    res.json({error: 'Not authorized...'})
                }
            }catch(error){
                res.json({error: 'Not authorized..'})
            }
        }else {
            res.json({error: 'Not authorized.'})
        }
    }
}
