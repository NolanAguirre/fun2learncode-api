require('dotenv').config()
const db = require('../db')

const calculatePrice = (students, addons, promoCode, price) => {
    let total = 0
    students.forEach((student) => {
        let t = student.price || price
        if (promoCode) {
            if (promoCode.percent) {
                t *= ((100 - promoCode.effect) / 100)
            } else {
                t -= promoCode.effect
            }
        }
        if (t < 0) {
            t = 0
        }
        addons.forEach((addon) => {
            t += addon.price
        })
        total += t
    })
    return (total < 1) ? 0 : total.toFixed(2)
}

const begin = async ({promoCode, addons, event, students, user}) => {
    try{
        await db.transactionIsProcessing(user.id)
        const info = await db.getRegistrationData({promoCode, addons, event, students, user}, new Date().toISOString())
        let {
            _students,
            _promoCode,
            _event,
            _addons,
            _overrides,
            _activity,
            ..._studentCheck
        } = info
        if (_event === null) {
            return{error: 'Error with event selection.'}
        }
        if (!_promoCode && promoCode) {
            return{error: 'Promo code is not valid.'}
        }
        if (students.length !== _students.length) {
            return{error: 'Error with student selection.'}
        }
        if (_addons.length !== addons.length) {
            return{error: 'Error with addon selection.'}
        }
        _students.forEach((student) => {
            _overrides.forEach((override) => {
                if (student.id === override.student) {
                    if (override.modified_price >= 0) {
                        student.price = override.modified_price
                    }
                }
            })
        })
        for (let k in _studentCheck) {
            let v = _studentCheck[k]
            if (!v.check_time || !v.check_registration || !v.check_prerequisite || !v.check_waiver) {
                return{
                    error: 'Error with student selection'
                }
                return
            }
        }
        const price = calculatePrice(_students, _addons, _promoCode, _event.price)
        await db.storeTransaction(user, {_students,_promoCode,_event,_addons,_overrides,_activity,total: price})
        return {total:price}
    }catch(error){
        console.log(error)
        return {error:error.message}
    }
}

module.exports = {
    production: (req, res) => {
        if(req.body.event && req.body.students && req.body.students.length){
            res.json(begin(req.body))
        }else{
            res.json({error:'Not enough information provided.'})
        }
    },
    test: begin
}
