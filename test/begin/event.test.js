const begin = require('../../routes/beginTransaction').test;
const {students, events, users, codes, addons}= require('../data')

module.exports = () => {
    describe('General event and cross feature', () => {
        test('Valid regular', async ()=>{
            const data = await begin({"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("200.00")
        })
        test('Valid, addon and promo code', async ()=>{
            const data = await begin({"promoCode":codes.valid,"students":[students.valid, students.override_prereq],"addons":[addons.valid],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("420.00")
        })
        test('Valid addon promo code and override price', async ()=>{
            const data = await begin({"promoCode":codes.valid,"students":[students.valid, students.override_price],"addons":[addons.valid],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("230.00")
        })
        test('Valid promo code and override price, total is 0', async ()=>{
            const data = await begin({"promoCode":codes.user,"students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("0.00")
        })
        test('Valid promo code and override price', async ()=>{
            const data = await begin({"promoCode":codes.percent,"students":[students.override_price],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("9.00")
        })
        test('Invalid closed', async ()=>{
            const data = await begin({"students":[students.valid],"addons":[],"event":events.closed,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('No valid event found.')
        })
    })
}
