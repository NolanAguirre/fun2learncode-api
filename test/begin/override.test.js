const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')
module.exports = {
    describe:'Registration Override',
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
            describe:'pass, override price',
            data:{"promoCode":"","students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("10.00")}
        },{
            describe:'pass, override prerequisite',
            data:{"promoCode":"","students":[students.override_prereq],"addons":[],"event":events.has_prereq,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("200.00")}
        },{
            describe:'pass, override registration dates',
            data:{"promoCode":"","students":[students.override_date],"addons":[],"event":events.closed,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("200.00")}
        },{
            describe:'pass, override price and normal price',
            data:{"promoCode":"","students":[students.override_price, students.valid],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("210.00")}
        },{
            describe:'pass, override invalid', //expect total price of event
            data:{"promoCode":"","students":[students.override_price],"addons":[],"event":events.fail_override_price,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('200.00')}
        },{
            describe:'fail, event registration closed, only one override date', //fail due to no override and event closed is in event.test.js
            data:{"promoCode":"","students":[students.valid, students.override_date],"addons":[],"event":events.closed,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('No valid event found.')}
        }
    ]
}
