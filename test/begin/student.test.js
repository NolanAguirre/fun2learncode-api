const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')
module.exports = {
    describe:'Student',
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
            describe:'pass, valid student with prereq', //fails waiver in this case
            data:{"promoCode":"","students":[students.registered],"addons":[],"event":events.has_prereq,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('200.00')}
        },{
            describe:'fail, invalid student no student waiver', //fails waiver in this case
            data:{"promoCode":"","students":[students.no_waiver],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')}
        },{
            describe:'fail, valid student user is not parent',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.valid,"user":users.other},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('User attempted to register student who is not their own.')}
        },{
            describe:'fail, invalid student does not meet prerequisite',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.has_prereq,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')}
        },{
            describe:'fail, invalid student, already registered',
            data:{"promoCode":"","students":[students.registered],"addons":[],"event":events.valid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')}
        }
    ]
}
