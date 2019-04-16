const stripe = require('../../routes/stripe').test
const {users, stripeTokens, cards} = require('../data')
// these don't use object spreads for args because they will be used for internal

const catchError = async (func) => {
    try{
        return await func()
    }catch(error){
        return {error:error.message}
    }
}

module.exports = () => {
    describe('Stripe', () => {
        describe('Creating customers', () => {
            test('create customer', async () => {
                const data = await catchError(async()=>{return await stripe.createCustomer(users.parent)})
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account created and stored.')
            })
            test('create customer two', async () => {
                const data = await catchError(async()=>{return await stripe.createCustomer(users.other)})
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account created and stored.')
            })
            test('duplicate account', async () => {
                const data = await catchError(async()=>{return await stripe.createCustomer(users.parent)})
                return expect(data[Object.keys(data)[0]]).toBe('Stripe customer account already exisits.')
            })
            test('no user account', async () => { // no user with given id tested once, same logic is in each method
                const data = await catchError(async()=>{return await stripe.createCustomer(users.no_user)})
                return expect(data[Object.keys(data)[0]]).toBe('Cannot find user with given id.')
            })
        })
        describe('Adding cards', () => {
            test('successful card add', async () => {
                const data = await catchError(async()=>{return await stripe.addCard(users.parent, stripeTokens.valid, cards.valid)})
                const {
                    id,
                    ...cardInfo
                } = data
                return expect(cardInfo).toEqual(cards.valid)
            })
            test('successful second card add', async () => {
                const data = await catchError(async()=>{return await stripe.addCard(users.parent, stripeTokens.valid_two, cards.valid_two)})
                const {
                    id,
                    ...cardInfo
                } = data
                return expect(cardInfo).toEqual(cards.valid_two)
            })
            test('successful card add for user two', async () => {
                const data = await catchError(async()=>{return await stripe.addCard(users.other, stripeTokens.valid, cards.valid)})
                const {
                    id,
                    ...cardInfo
                } = data
                return expect(cardInfo).toEqual(cards.valid)
            })
            test('failed card add, matching info', async () => {
                const data = await catchError(async()=>{return await stripe.addCard(users.parent, stripeTokens.valid, cards.valid)})
                return expect(data[Object.keys(data)[0]]).toBe('Provided card has the same last 4 digits, brand, and experation date as a stored card, operation aborted.')
            })
            test('no stripe customer id found', async () => { //no stripe id tested once, same logic is in each method
                const data = await catchError(async()=>{return await stripe.addCard(users.refund, stripeTokens.valid, cards.valid)})
                return expect(data[Object.keys(data)[0]]).toBe('No stripe customer account on record.')
            })
            test('invalid card information', async () => {
                const data = await catchError(async()=>{return await stripe.addCard(users.parent, stripeTokens.fail[0], cards.fail)})
                return expect(data[Object.keys(data)[0]]).toBe('Your card was declined.')
            })
        })
        describe('Deleteing cards', ( )=> {
            test('successful card delete', async () => {
                const data = await catchError(async()=>{return await stripe.deleteCard(users.parent, cards.valid)})
                const {
                    id,
                    ...cardInfo
                } = data
                return expect(cardInfo).toEqual(cards.valid)
            })
            test('card not found', async () => {
                const data = await catchError(async()=>{return await stripe.deleteCard(users.other, cards.valid_two)})
                return expect(data[Object.keys(data)[0]]).toBe('No card found.')
            })
        })
        describe('Charge via token', () => {
            test('successful change via token', async () => {
                const data = await catchError(async()=>{return await stripe.chargeCard(users.parent, stripeTokens.valid, 100)})
                return data.paid
            })
        })
        describe('Charge via customer', () => {
            test('successful charge via customer', async () => {
                const data = await catchError(async()=>{return await stripe.chargeCustomer(users.parent, cards.valid_two, 100)})
                return data.paid
            })
        })
        describe('Get user data', () => {
            test('successful got user data', async () => {
                const data = stripe.cardRouteFormatter(await stripe.getUserCards(users.parent))
                return expect(data).toEqual([cards.valid_two])
            })
        })
    })
}
