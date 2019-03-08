const begin = require('../routes/beginTransaction').test;
const info = require('./info')

//TEST NEEDED FOR SECOND PERSON TO REGISTER FOR PRIVATE EVENT
module.exports = {
    describe:'Private Event test',
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
            describe:'valid, private event hash',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.private_hash,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("450.00")}
        },{
            describe:'valid, paid private event hash',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.private_hash_paid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.total).toBe("0.00")}
        },{
            describe:'invalid, private event hash not paid',
            data:{"promoCode":"","students":[info.students.not_parent],"addons":[],"event":info.events.private_hash,"user":info.users.other},
            test: (expect, data)=>{return expect(data.error).toBe("No valid event found.")}
        },{
            describe:'invalid event, private event by id',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.private,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe('No valid event found.')}
        },{
            describe:'invalid, private event via id, paid',
            data:{"promoCode":"","students":[info.students.valid],"addons":[],"event":info.events.private_paid,"user":info.users.parent},
            test: (expect, data)=>{return expect(data.error).toBe("No valid event found.")}
        },{
            describe:'invalid, private event via hash, correct user, student not paid for',
            data:{"promoCode":"","students":[info.students.two_b],"addons":[],"event":info.events.private_hash_cheat,"user":info.users.other},
            test: (expect, data)=>{return expect(data.error).toBe("User attempted to register for free private event.")}
        }
    ]
}
