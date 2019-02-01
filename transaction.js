const jwt = require('jwt-simple');
const db = require('./db')

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
                t *= ((100 - promoCode.efffect)/100)
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
    begin: async (req, res) => { //TODO make this better
        const {
            promoCode,
            addons,
            dateGroup,
            students,
            user
        } = req.body
        if(user && dateGroup && students && students.length > 0){
        //    if (validateAuthToken(req.session, user)) {
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
                    Students,
                    PromoCode,
                    DateGroup,
                    Addons,
                    Overrides,
                    ...validStudents
                } = info
                if(DateGroup === null){
                    res.json({error:'Error with event selection.'})
                    return
                }
                if(!PromoCode && promoCode != ""){
                    res.json({error:'Promo code is not valid.'})
                    return
                }
                if(students.length !== Students.length){
                    res.json({error:'Error with student selection.'})
                    return
                }
                if(Addons.length !== addons.length){
                    res.json({error:'Error with addon selection.'})
                    return
                }
                Students.forEach((student) => {
                    Overrides.forEach((override)=>{
                        if(student.id === override.student){
                            if(override.modified_price >= 0){
                                student.price = override.modified_price
                            }
                            validStudent[student.id].check_prerequisites = true;
                        }
                    })
                })
                for(let k in validStudents){
                    let v = validStudents[k];
                    if(v.check_time || v.check_registration || !v.check_prerequisites){
                        res.json({error:'Error with student selection'})
                        return;
                    }
                }
                const price = calculatePrice(Students, addons, PromoCode, DateGroup.price);
                try{
                    await db.storeTransaction(user, {Students, PromoCode, DateGroup, Addons, Overrides, Total:price});
                } catch(error){
                    res.json({error:'Error occured while storing transaction data.'})
                    return
                }
                res.json({total:price});
            // } else {
            //     res.json({error: 'Unathorized.'})
            // }
        }else{
            res.json({error:'Not enough information provided.'})
        }

    }
}
