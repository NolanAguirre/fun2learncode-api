const stripe = require('../../routes/stripe').test
const {users, stripeTokens, cards} = require('../data')
// these don't use object spreads for args because they will be used for internal
module.exports = () => {
    describe('Stripe', () => {
        describe('Creating customers', () => {
            test('create customer', async () => {
                const data = await stripe.createCustomer(users.parent)
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account created and stored.')
            })
            test('create customer two', async () => {
                const data = await stripe.createCustomer(users.other)
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account created and stored.')
            })
            test('duplicate account', async () => {
                const data = await stripe.createCustomer(users.parent)
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account already exisits.')
            })
            test('no user account', async () => { // no user with given id tested once, same logic is in each method
                const data = await stripe.createCustomer(users.no_user)
                return expect(data[Object.keys(data)[0]]).toBe('Cannot find user with given id.')
            })
        })
        describe('Adding cards', () => {
            test('successful card add', async () => {
                const data = await stripe.addCard(users.parent, {id:stripeTokens.valid, card:cards.valid})
                return expect(data[Object.keys(data)[0]]).toBe('Card successfully added.')
            })
            test('successful second card add', async () => {
                const data = await stripe.addCard(users.parent, {id:stripeTokens.valid_two, card:cards.valid_two})
                return expect(data[Object.keys(data)[0]]).toBe('Card successfully added.')
            })
            test('successful card add for user two', async () => {
                const data = await stripe.addCard(users.other, {id:stripeTokens.valid, card:cards.valid})
                return expect(data[Object.keys(data)[0]]).toBe('Card successfully added.')
            })
            test('failed card add, matching info', async () => {
                const data = await stripe.addCard(users.parent, {id:stripeTokens.valid, card:cards.valid})
                return expect(data[Object.keys(data)[0]]).toBe('Provided card has the same last 4 digits, brand, and experation date as a stored card, operation aborted.')
            })
            test('no stripe customer id found', async () => { //no stripe id tested once, same logic is in each method
                const data = await stripe.addCard(users.refund, {id:stripeTokens.valid, card:cards.valid})
                return expect(data[Object.keys(data)[0]]).toBe('No stripe customer account on record.')
            })
            test('invalid card information', async () => {
                const data = await stripe.addCard(users.parent, {id:stripeTokens.fail[0], card:cards.fail}) //mock
                return expect(data[Object.keys(data)[0]]).toBe('Your card was declined.')
            })
        })
        describe('Update default', () => {
            test('successful default update', async () => {
                const data = await stripe.setDefault(users.parent, cards.valid_two)
                return expect(data[Object.keys(data)[0]]).toBe('Default payment method updated.')
            })
        })
        describe('Deleteing cards', ( )=> {
            test('successful card delete', async () => {
                const data = await stripe.deleteCard(users.parent, cards.valid)
                return expect(data[Object.keys(data)[0]]).toBe('Card successfully deleted.')
            })
            test('card not found', async () => {
                const data = await stripe.deleteCard(users.other, cards.valid_two)
                return expect(data[Object.keys(data)[0]]).toBe('No card found.')
            })
        })
        describe('Charge via token', () => {
            test('successful default update', async () => {
                const data = await stripe.chargeCard(users.parent, stripeTokens.valid, 100)
                return data.paid
            })
        })
        describe('Charge via customer', () => {
            test('successful default update', async () => {
                const data = await stripe.chargeCustomer(users.parent, cards.valid_two, 100)
                return data.paid
            })
        })
        describe('Get user data', () => {
            test('successful default update', async () => {
                const data = stripe.cardRouteFormatter(await stripe.getUserCards(users.parent))
                return expect(data).toEqual([cards.valid_two])
            })
        })
    })
}
