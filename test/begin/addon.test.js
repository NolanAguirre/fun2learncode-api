const begin = require('../../routes/beginTransaction').test;
const {students, events, users, addons} = require('../data')




module.exports = () => {
    describe('Add on', () => {
        test('Valid', async () => {
            const data = await begin({"students":[students.valid],"addons":[addons.valid],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('220.00')
        })
        test('Valid 2 students', async () => {
            const data = await begin({"students":[students.valid, students.override_prereq],"addons":[addons.valid],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('440.00')
        })
        test('Valid multiple add ons', async () => {
            const data = await begin({"students":[students.valid],"addons":[addons.valid, addons.other],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('250.00')
        })
        test('Invalid add on', async () => {
            const data = await begin({"students":[students.valid],"addons":[addons.invalid],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Error with addon selection.')
        })
        test('Invalid partial invalid add on', async () => {
            const data = await begin({"students":[students.valid],"addons":[addons.invalid, addons.valud],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Error with addon selection.')
        })
    })
}
