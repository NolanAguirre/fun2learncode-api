const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')



module.exports = () => {
    describe('Private event', () => {
        describe('By Hash', () => {
            describe('Requestee', () => { // valid paid is handled by regular event registration
                test('Valid not paid', async () => {
                    const data = await begin({"students":[students.valid],"addons":[],"event":events.private_hash,"user":users.parent})
                    return expect(data[Object.keys(data)[0]]).toBe('450.00')
                })
                test('Invalid no-cost', async () => {
                    const data = await begin({"students":[students.two_b],"addons":[],"event":events.private_hash_cheat,"user":users.other})
                    return expect(data[Object.keys(data)[0]]).toBe("User attempted to register for free private event.")
                })
            })
            describe('Anyone', () => {
                test('Valid paid', async () => {
                    const data = await begin({"students":[students.valid],"addons":[],"event":events.private_hash_paid,"user":users.parent})
                    return expect(data[Object.keys(data)[0]]).toBe('0.00')
                })
                test('Invalid not paid', async () => {
                    const data = await begin({"students":[students.not_parent],"addons":[],"event":events.private_hash,"user":users.other})
                    return expect(data[Object.keys(data)[0]]).toBe("No valid event found.")
                })
            })


        })
        describe('By ID', () =>{
            test('Invalid not paid, requestee', async () => {
                const data = await begin({"students":[students.valid],"addons":[],"event":events.private,"user":users.parent})
                return expect(data[Object.keys(data)[0]]).toBe("No valid event found.")
            })
            test('Invalid paid, anyone', async () => {
                const data = await begin({"promoCode":"","students":[students.valid],"addons":[],"event":events.private_paid,"user":users.parent})
                return expect(data[Object.keys(data)[0]]).toBe("No valid event found.")
            })
        })
    })
}
