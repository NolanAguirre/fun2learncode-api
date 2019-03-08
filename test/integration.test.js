const begin = require('../routes/beginTransaction').test
const process = require('../routes/processTransaction').test
const refund = require('../routes/refundTransaction').test
const {students, events, users, stripeTokens} = require('./data')

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
                    return expect(data.total).toBe("200.00")
                }
            }
        },{
            describe:'pass, process valid transaction',
            data:{user:users.parent, token:stripeTokens.valid},
            test: (expect, obj) => {
                return async () => {
                    const data = await process(obj.data)
                    return expect(data.message).toBe('Payment and registration successful')
                }
            }
        }
    ]
}
