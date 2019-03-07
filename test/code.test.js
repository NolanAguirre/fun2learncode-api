const begin = require('../routes/beginTransaction').test;
const info = require('./info')
module.exports = {
    describe:'Promo Code test',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await begin(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data:[
        {
            describe:'valid promo code not percent',
            data:{"promoCode":info.codes.valid,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("190.00")}
        },{
            describe:'valid promo code percent',
            data:{"promoCode":info.codes.percent,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('180.00')}
        },{
            describe:'valid promo code two kids',
            data:{"promoCode":info.codes.valid,"students":[info.students.valid, info.students.override_prereq],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('380.00')}
        },{
            describe:'valid promo code category',
            data:{"promoCode":info.codes.camps,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('190.00')}
        },{
            describe:'valid promo code event',
            data:{"promoCode":info.codes.event,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('190.00')}
        },{
            describe:'valid promo code user',
            data:{"promoCode":info.codes.user,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('190.00')}
        },{
            describe:'valid promo code with override pricing',
            data:{"promoCode":info.codes.percent,"students":[info.students.override_price],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("9.00")}
        },{
            describe:'valid promo code with override pricing, total is 0',
            data:{"promoCode":info.codes.user,"students":[info.students.override_price],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('0.00')}
        },{
            describe:'valid promo code total is below 0',
            data:{"promoCode":info.codes.big,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('0.00')}
        },{
            describe:'invalid promo code incorrect code',
            data:{"promoCode":"novalid","students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code closed',
            data:{"promoCode":info.codes.closed,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code for different category',
            data:{"promoCode":info.codes.labs,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code for different event',
            data:{"promoCode":info.codes.otherEvent,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code for other used',
            data:{"promoCode":info.codes.otherUser,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code no more uses',
            data:{"promoCode":info.codes.used,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        },{
            describe:'invalid promo code disabled',
            data:{"promoCode":info.codes.disabled,"students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Promo code is not valid.')}
        }
    ]
}
