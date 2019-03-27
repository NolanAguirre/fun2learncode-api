const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')

module.exports = () => {
    describe('Student', () => {
        test('Valid student with prereq', async () => {
            const data = await begin({"students":[students.registered],"addons":[],"event":events.has_prereq,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('200.00')
        })
        test('Invalid no waiver', async () => {
            const data = await begin({"students":[students.no_waiver],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')
        })
        test('Invalid student is not parent', async () => {
            const data = await begin({"students":[students.valid],"addons":[],"event":events.valid,"user":users.other})
            return expect(data[Object.keys(data)[0]]).toBe('User attempted to register student who is not their own.')
        })
        test('Invalid student fails prereq', async () => {
            const data = await begin({"students":[students.valid],"addons":[],"event":events.has_prereq,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')
        })
        test('Invalid student already registered', async () => {
            const data = await begin({"students":[students.registered],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Error with student selection.')
        })

    })
}
