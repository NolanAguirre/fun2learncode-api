const begin = require('../../routes/beginTransaction').test;
const {students, events, users, codes, addons}= require('../data')

module.exports = {
    describe:'General Event, and cross feature',
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
            describe:'pass, regular everything',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("200.00")}
        },{
            describe:'pass, with addon and promo code',
            data:{"promoCode":codes.valid,"students":[students.valid, students.override_prereq],"addons":[addons.valid],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('420.00')}
        },{
            describe:'pass, with addon, promo code and price override',
            data:{"promoCode":codes.valid,"students":[students.valid, students.override_price],"addons":[addons.valid],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('230.00')}
        },{
            describe:'pass, with promo code and override pricing, total is 0',
            data:{"promoCode":codes.user,"students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('0.00')}
        },{
            describe:'pass, promo code and override pricing',
            data:{"promoCode":codes.percent,"students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("9.00")}
        },{
            describe:'fail, event registration closed',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.closed,"user":users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('No valid event found.')}
        }
    ]
}
