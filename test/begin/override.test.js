const begin = require('../../routes/beginTransaction').test;
const {students, events, users} = require('../data')
module.exports = () => {
    describe('Override', () => {
        test('Valid, override price',  async () => {
            const data = await begin({"students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("10.00")
        })
        test('Valid, override prereq',  async () => {
            const data = await begin({"students":[students.override_prereq],"addons":[],"event":events.has_prereq,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("200.00")
        })
        test('Valid, override registration date',  async () => {
            const data = await begin({"students":[students.override_date],"addons":[],"event":events.closed,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("200.00")
        })
        test('Valid, override price and normal price',  async () => {
            const data = await begin({"students":[students.override_price, students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("210.00")
        })
        test('Invalid, override price and normal price',  async () => {
            const data = await begin({"students":[students.override_price],"addons":[],"event":events.fail_override_price,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("200.00")
        })
        test('Invalid, override price and normal price',  async () => {
            const data = await begin({"students":[students.valid, students.override_date],"addons":[],"event":events.closed,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('No valid event found.')
        })
    })
}
