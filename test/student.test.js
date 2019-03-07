const begin = require('../routes/beginTransaction').test;
const info = require('./info')
module.exports = {
    describe:'students test',
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
            describe:'valid student, passes prereq', //fails waiver in this case
            data:{"promoCode":"","students":[info.students.registered],"addons":[],"event":info.events.has_prereq,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('200.00')}
        },{
            describe:'invalid student, fails a check', //fails waiver in this case
            data:{"promoCode":"","students":[info.students.no_waiver],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with student selection.')}
        },{
            describe:'invalid student, not parent',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.valid,"user":info.users.other},
            test: (expect, data)=>{return expect(data.error).toBe('User attempted to register student who is not their own.')}
        },{
            describe:'invalid student, no prerequisite',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.has_prereq,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with student selection.')}
        },{
            describe:'invalid student, already registered',
            data:{"promoCode":"","students":[info.students.registered],"addons":[],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with student selection.')}
        }
    ]
}
