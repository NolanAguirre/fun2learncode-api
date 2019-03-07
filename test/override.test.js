const begin = require('../routes/beginTransaction').test;
const info = require('./info')
module.exports = {
    describe:'Override test',
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
            describe:'valid, override price',
            data:{"promoCode":"","students":[info.students.override_price],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("10.00")}
        },{
            describe:'valid, override prerequisite',
            data:{"promoCode":"","students":[info.students.override_prereq],"addons":[],"event":info.events.has_prereq,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("200.00")}
        },{
            describe:'valid, override date and price on accident',
            data:{"promoCode":"","students":[info.students.override_date],"addons":[],"event":info.events.closed,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("100.00")}
        },{
            describe:'valid, override price and normal price',
            data:{"promoCode":"","students":[info.students.override_price, info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("210.00")}
        },{
            describe:'invalid event, registration closed, only one override date',
            data:{"promoCode":"","students":[info.students.valid, info.students.override_date],"addons":[],"event":info.events.closed,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('No valid event found.')}
        },{
            describe:'does not override price, override old',
            data:{"promoCode":"","students":[info.students.override_price],"addons":[],"event":info.events.fail_override_price,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('200.00')}
        }
    ]
}
