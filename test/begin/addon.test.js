const begin = require('../../routes/beginTransaction').test;
const {students, events, users, addons} = require('../data')
module.exports = {
    describe:'Add on',
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
    data:[{
            describe:'pass, valid addon',
            data:{"promoCode":"","students":[students.valid],"addons":[addons.valid],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('220.00')}
        },{
            describe:'pass, valid addon, 2 students ',
            data:{"promoCode":"","students":[students.valid, students.override_prereq],"addons":[addons.valid],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('440.00')}
        },{
            describe:'pass, multiple addons',
            data:{"promoCode":"","students":[students.valid],"addons":[addons.valid, addons.other],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('250.00')}
        },{
            describe:'fail, invalid addon',
            data:{"promoCode":"","students":[students.valid],"addons":[addons.invalid],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with addon selection.')}
        },{
            describe:'fail, multiple addons, one invalid',
            data:{"promoCode":"","students":[students.valid],"addons":[addons.invalid, addons.valud],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with addon selection.')}
        }
    ]
}
