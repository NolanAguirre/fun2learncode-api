const begin = require('../../routes/beginTransaction').test;
const {students, events, users, codes} = require('../data')
module.exports = {
    describe:'Promo Code',
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
            describe:'pass, promo code flat reduction',
            data:{"promoCode":codes.valid,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("190.00")}
        },{
            describe:'pass, promo code percent reduction',
            data:{"promoCode":codes.percent,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('180.00')}
        },{
            describe:'pass, promo code, multiple students',
            data:{"promoCode":codes.valid,"students":[students.valid, students.override_prereq],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('380.00')}
        },{
            describe:'pass, promo code for category',
            data:{"promoCode":codes.camps,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('190.00')}
        },{
            describe:'pass, promo code for event',
            data:{"promoCode":codes.event,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('190.00')}
        },{
            describe:'pass, promo code for user',
            data:{"promoCode":codes.user,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('190.00')}
        },{
            describe:'pass, promo code brings total below 0',
            data:{"promoCode":codes.big,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('0.00')}
        },{
            describe:'fail, invalid promo code',
            data:{"promoCode":"novalid","students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code closed',
            data:{"promoCode":codes.closed,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code for category',
            data:{"promoCode":codes.labs,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code for event',
            data:{"promoCode":codes.otherEvent,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code for user',
            data:{"promoCode":codes.otherUser,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code has no more uses',
            data:{"promoCode":codes.used,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        },{
            describe:'fail, promo code disabled',
            data:{"promoCode":codes.disabled,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')}
        }
    ]
}
