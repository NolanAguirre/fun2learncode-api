const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')

module.exports = {
    describe:'Private Event',
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
            describe:'pass, private event hash, requestee',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.private_hash,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("450.00")}
        },{
            describe:'pass, private event hash, paid, anyone',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.private_hash_paid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("0.00")}
        },{
            describe:'fail, private event hash, not paid, anyone',
            data:{"promoCode":"","students":[students.not_parent],"addons":[],"event":events.private_hash,"user":users.other},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("No valid event found.")}
        },{
            describe:'fail, private event id, not paid, requestee',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.private,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('No valid event found.')}
        },{
            describe:'fail, private event via id, paid, requestee',
            data:{"promoCode":"","students":[students.valid],"addons":[],"event":events.private_paid,"user":users.parent},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("No valid event found.")}
        },{
            describe:'fail, private event via hash, correct user, student not paid for',
            data:{"promoCode":"","students":[students.two_b],"addons":[],"event":events.private_hash_cheat,"user":users.other},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe("User attempted to register for free private event.")}
        }
    ]
}
