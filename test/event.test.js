const begin = require('../routes/beginTransaction').test;
const info = require('./info')

module.exports = {
    describe:'General event test',
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
            describe:'valid, regular everything',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("200.00")}
        },{
            describe:'valid addon, promo code',
            data:{"promoCode":info.codes.valid,"students":[info.students.valid, info.students.override_prereq],"addons":[info.addons.valid],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('420.00')}
        },{
            describe:'valid addon, promo code and price override',
            data:{"promoCode":info.codes.valid,"students":[info.students.valid, info.students.override_price],"addons":[info.addons.valid],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('230.00')}
        },{
            describe:'invalid event, registration closed',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.closed,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('No valid event found.')}
        }
    ]
}
