const begin = require('../../routes/beginTransaction').test;
const {students, events, users, codes} = require('../data')

module.exports = () => {
    describe('Promo code', () => {
        test('Valid, flat reduction', async () => {
            const data = await begin({"promoCode":codes.valid,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("190.00")
        })
        test('Valid, percent reduction', async () => {
            const data = await begin({"promoCode":codes.percent,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("180.00")
        })
        test('Valid, flat multiple students', async () => {
            const data = await begin({"promoCode":codes.valid,"students":[students.valid, students.override_prereq],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("380.00")
        })
        test('Valid, flat category', async () => {
            const data = await begin({"promoCode":codes.camps,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("190.00")
        })
        test('Valid, flat event', async () => {
            const data = await begin({"promoCode":codes.event,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("190.00")
        })
        test('Valid, flat user', async () => {
            const data = await begin({"promoCode":codes.user,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("190.00")
        })
        test('Valid, promo code brings total less than 0', async () => {
            const data = await begin({"promoCode":codes.big,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe("0.00")
        })
        test('Invalid, wrong code', async () => {
            const data = await begin({"promoCode":"novalid","students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, code closed', async () => {
            const data = await begin({"promoCode":codes.closed,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, wrong categroy', async () => {
            const data = await begin({"promoCode":codes.labs,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, wrong event', async () => {
            const data = await begin({"promoCode":codes.otherEvent,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, wrong user', async () => {
            const data = await begin({"promoCode":codes.otherUser,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, no more uses', async () => {
            const data = await begin({"promoCode":codes.used,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        test('Invalid, disabled', async () => {
            const data = await begin({"promoCode":codes.disabled,"students":[students.valid],"addons":[],"event":events.valid,"user":users.parent})
            return expect(data[Object.keys(data)[0]]).toBe('Promo code is not valid.')
        })
        //TODO add and operation test, and add promo code use check, one use per user.
    })
}
