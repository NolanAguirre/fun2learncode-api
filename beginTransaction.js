const db = require('./db')

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

const begin = (req, res) => {
    test(req.body, res.session, res.json)
}

const test = async (body, session, cb) => {
    const {
        promoCode,
        addons,
        event,
        students,
        user
    } = body
    if (user && event && students && students.length > 0) {
        if (validateAuthToken(session, user)) {
            try {
                const processing = await db.transactionIsProcessing(user)
                if (processing) {
                    cb({
                        error: 'A transaction is being process, try again later.'
                    })
                    return
                }
            } catch (error) {
                cb({
                    error: 'Something went wrong.'
                })
                return
            }
            let info
            try {
                info = await db.getRegistrationData({
                    ...body
                }, new Date().toISOString())
            } catch (error) {
                console.log(error)
                cb({
                    error: 'Something went wrong while processing the data.'
                })
                return
            }
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
                cb({
                    error: 'Error with event selection.'
                })
                return
            }
            if (!_promoCode && promoCode !== '') {
                cb({
                    error: 'Promo code is not valid.'
                })
                return
            }
            if (students.length !== _students.length) {
                cb({
                    error: 'Error with student selection.'
                })
                return
            }
            if (_addons.length !== addons.length) {
                cb({
                    error: 'Error with addon selection.'
                })
                return
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
                    cb({
                        error: 'Error with student selection'
                    })
                    return
                }
            }
            const price = calculatePrice(_students, _addons, _promoCode, _event.price)
            try {
                await db.storeTransaction(user, {
                    _students,
                    _promoCode,
                    _event,
                    _addons,
                    _overrides,
                    _activity,
                    total: price
                })
            } catch (error) {
                cb({
                    error: 'Error occured while storing transaction data.'
                })
                return
            }
            cb({
                total: price
            })
        } else {
            cb({
                error: 'Unathorized.'
            })
        }
    } else {
        cb({
            error: 'Not enough information provided.'
        })
    }
}

module.exports = {
    begin,
    beginTest: test,
}
