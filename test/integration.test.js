const begin = require('../routes/beginTransaction').test
const process = require('../routes/processTransaction').test
const refund = require('../routes/refundTransaction').test
const {students, events, users, stripeTokens} = require('./data')
const db = require('../db')
let {payments} = require('./data')

module.exports = {
    describe:'Integration',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, obj.test(expect, obj))
            })
        })
    },
    data:[{
            describe:'pass, begin valid transaction',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, obj) => {
                return async () => {
                    const data = await begin(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe("200.00")
                }
            }
        },{
            describe:'pass, process valid transaction',
            data:{user:users.parent, token:stripeTokens.valid},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe('Payment and registration successful')
                }
            }
        },{
            describe:'pass, begin valid refund transaction',
            data:{"promoCode":"","students":[students.refund_one],"addons":[],"event":events.valid,"user":users.refund},
            test: (expect, obj) => {
                return async () => {
                    const data = await begin(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe("200.00")
                }
            }
        },{
            describe:'pass, process valid refund transaction',
            data:{user:users.refund, token:stripeTokens.valid},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    payments.refund_one = data.paymentId
                    return expect(data[Object.keys(data)[0]]).toBe('Payment and registration successful')
                }
            }
        },{
            describe:'pass, begin valid refund with unregister transaction',
            data:{"promoCode":"","students":[students.refund_two],"addons":[],"event":events.valid,"user":users.refund},
            test: (expect, obj) => {
                return async () => {
                    const data = await begin(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe("200.00")
                }
            }
        },{
            describe:'pass, process valid refund with unregister transaction',
            data:{user:users.refund, token:stripeTokens.valid},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    payments.refund_two = data.paymentId
                    return expect(data[Object.keys(data)[0]]).toBe('Payment and registration successful')
                }
            }
        },{
            describe:'pass, begin reject refund transaction',
            data:{"promoCode":"","students":[students.refund_three],"addons":[],"event":events.valid,"user":users.refund},
            test: (expect, obj) => {
                return async () => {
                    const data = await begin(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe("200.00")
                }
            }
        },{
            describe:'pass, process reject refund  transaction',
            data:{user:users.refund, token:stripeTokens.valid},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    payments.refund_three= data.paymentId
                    return expect(data[Object.keys(data)[0]]).toBe('Payment and registration successful')
                }
            }
        },{
            describe:'pass, begin fail refund transaction',
            data:{"promoCode":"","students":[students.refund_four],"addons":[],"event":events.valid,"user":users.refund},
            test: (expect, obj) => {
                return async () => {
                    const data = await begin(obj.data)
                    return expect(data[Object.keys(data)[0]]).toBe("200.00")
                }
            }
        },{
            describe:'pass, process fail refund transaction',
            data:{user:users.refund, token:stripeTokens.fail_refund},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    payments.refund_four= data.paymentId
                    return expect(data[Object.keys(data)[0]]).toBe('Payment and registration successful')
                }
            }
        },{
            describe:'populate mock refund requests',
            data:{...payments},
            test: (expect, obj) => {
                return async () => {
                    await db.createRefundRequest(users.refund, 'successful, no unregister', payments.refund_one)
                    await db.createRefundRequest(users.refund, 'successful, unregister', payments.refund_two)
                    await db.createRefundRequest(users.refund, 'successful, no refund granted', payments.refund_three)
                    await db.createRefundRequest(users.refund, 'successful, stripe declined', payments.refund_four)
                    return expect(1).toBe(1)
                }
            }
        },{
            describe:'pass, process refund one',
            data:{unregister:false, amount:10},
            test: (expect, obj) => {
                return async () => {
                    const data = await refund({paymentId:payments.refund_one, ...obj.data})
                    return expect(data[Object.keys(data)[0]]).toBe('refund successful')
                }
            }
        },{
            describe:'pass, process refund two',
            data:{unregister:true, amount:10},
            test: (expect, obj) => {
                return async () => {
                    const data = await refund({paymentId:payments.refund_two, ...obj.data})
                    return expect(data[Object.keys(data)[0]]).toBe('refund successful')
                }
            }
        },{
            describe:'pass, process refund four',
            data:{unregister:false, amount:10},
            test: (expect, obj) => {
                return async () => {
                    const data = await refund({paymentId:payments.refund_four, ...obj.data})
                    return expect(data[Object.keys(data)[0]]).toBe('refund successful')
                }
            }
        }
    ]
}
