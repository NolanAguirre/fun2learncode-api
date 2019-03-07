const begin = require('../routes/beginTransaction').test;
const info = require('./info')
module.exports = {
    describe:'Addon test',
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
            describe:'valid addon selection',
            data:{"promoCode":"","students":[info.students.valid],"addons":[info.addons.valid],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('220.00')}
        },{
            describe:'valid addon selection 2 students',
            data:{"promoCode":"","students":[info.students.valid, info.students.override_prereq],"addons":[info.addons.valid],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('440.00')}
        },{
            describe:'valid 2 addon',
            data:{"promoCode":"","students":[info.students.valid],"addons":[info.addons.valid, info.addons.other],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe('250.00')}
        },{
            describe:'invalid addon selection',
            data:{"promoCode":"","students":[info.students.valid],"addons":[info.addons.invalid],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with addon selection.')}
        },{
            describe:'invalid addon selection, one valid one invalid',
            data:{"promoCode":"","students":[info.students.valid],"addons":[info.addons.invalid, info.addons.valud],"event":info.events.valid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('Error with addon selection.')}
        }
    ]
}
