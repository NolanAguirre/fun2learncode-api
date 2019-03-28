const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')
const express = require('express')
const router = express.Router()
// these don't use object spreads for args because they will be used for internal
const createCustomer = async (id) => {
    try{
        const user = await db.getStripeUser(id)
        if(!user.stripe_id){
            return await stripe.customers.create({
                description: 'Customer',
                email: user.email,
                metadata:{
                    user_id:user.id
                }
            }).then(async (customer) => {
                if(customer.id){
                    await db.storeStripeUser(user.id, customer.id)
                    return {message:'Stripe customer account created and stored.'}
                }
            })
        }else{
            return {error:'Stripe customer account already exisits.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const deleteCustomer = async (id) => {
    try{
        const user = await db.getStripeUser(id)
        if(user.stripe_id){
            await stripe.customers.del(user.stripe_id)
            return {message:'Stripe customer account successfully deleted.'}
        }else{
            return {error:'No stripe customer account on record.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const getUserCards = async (userId, stripe_id) => {
    try{
        const user = stripe_id || (await db.getStripeUser(userId)).stripe_id
        return await stripe.customers.listCards(user)
    }catch(error){
        return {error:error.message}
    }
}

const cardByInfo = async (stripe_id, cardInfo) => {
    return (await getUserCards(null, stripe_id)).data.filter((card)=>{
        return card.last4 === cardInfo.last4 &&
            card.brand === cardInfo.brand &&
            card.exp_month === cardInfo.exp_month &&
            card.exp_year === cardInfo.exp_year
        })
}

const addCard = async (userId, {id, card}) => {
    try{
        const user = await db.getStripeUser(userId)
        if(user.stripe_id){
            const cards = await cardByInfo(user.stripe_id, card)
            if(cards.length === 0){
                await stripe.customers.createSource(user.stripe_id,{ source: id }) //on invalid card info it says Your card was declined.
                return {message:'Card successfully added.'}
            }
            return {error:'Provided card has the same last 4 digits, brand, and experation date as a stored card, operation aborted.'}
        }else{
            return {error:'No stripe customer account on record.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const deleteCard = async (id, cardInfo) => {
    try{
        const user = await db.getStripeUser(id)
        if(user.stripe_id){
            const cards =  await cardByInfo(user.stripe_id, cardInfo)
            if(cards.length === 1){
                await stripe.customers.deleteCard(user.stripe_id, cards[0].id)
                return {message:'Card successfully deleted.'}
            }else if(cards.length === 0){
                return {error:'No card found.'}
            }else{
                return {error:'Duplicate card detected.'} // this should never happen as duplicates are check before they are added
            }
        }else{
            return {error:'No stripe customer account on record.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const setDefault = async (id, cardInfo) => {
    try{
        const user = await db.getStripeUser(id)
        if(user.stripe_id){
            const cards = await cardByInfo(user.stripe_id, cardInfo)
                if(cards.length === 1){
                    await stripe.customers.update(user.stripe_id, {default_source:cards[0].id})
                    return {message:'Default payment method updated.'}
                }else if(cards.length === 0){
                    return {error:'No card found.'}
                }else{
                    return {error:'Duplicate card detected.'} // this should never happen as duplicates are check before they are added
                }
        } else {
            return {error:'No stripe customer account on record.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const chargeCard = async (id, token, total) => {
    try{
        return stripe.charges.create({
            amount: total * 100,
            currency: 'usd',
            description: 'Fun 2 Learn Code Event',
            metadata:{user:id},
            source: token,
            statement_descriptor: 'Fun 2 Learn Code Event'
        }).catch((error)=>{throw new Error('Stripe error while processing card.' + error.message)})
    }catch(error){
        return {error:error.message}
    }
}


const chargeCustomer = async (id, cardInfo, total) => {
    try{
        const user = await db.getStripeUser(id)
        if(user.stripe_id){
            const cards = await cardByInfo(user.stripe_id, cardInfo)
            if(cards.length === 1){
                return stripe.charges.create({
                    amount: total * 100,
                    currency: 'usd',
                    description: 'Fun 2 Learn Code Event',
                    metadata:{user:id},
                    source: cards[0].id,
                    customer: user.stripe_id,
                    statement_descriptor: 'Fun 2 Learn Code Event'
                }).catch((error)=>{throw new Error('Stripe error while processing card.' + error.message)})
            }else if(cards.length === 0){
                return {error:'No card found.'}
            }else{
                return {error:'Duplicate card detected.'} // this should never happen as duplicates are check before they are added
            }
        }
    }catch(error){
        return {error:error.message}
    }
}


const cardRouteFormatter = (cards) => {
    return cards.data.map((card)=>{
        return {
            last4:card.last4,
            brand:card.brand,
            exp_month:card.exp_month,
            exp_year:card.exp_year
        }
    })
}

if(!process.env.TEST){
    router.post('/create-customer', async (req, res) => {
        res.json(await createCustomer(req.body.user))
    })

    router.post('/add-card', async (req, res) => {
        if(req.body.token && req.body.token.id && req.body.token.card){
            res.json(await addCard(req.body.user, req.body.token))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/delete-card', async (req, res) => {
        if(req.body.cardInfo){
            res.json(await deleteCard(req.body.user, req.body.cardInfo))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/set-default', async (req, res) => {
        if(req.body.cardInfo){
            res.json(await setDefault(req.body.user, req.body.cardInfo))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/user-info', async (req, res) => {
        res.json(await getUserCards(req.body.user))
    })
}


module.exports = {
    production: router,
    test:{
        createCustomer,
        addCard,
        deleteCard,
        setDefault,
        chargeCard,
        chargeCustomer,
        getUserCards,
        cardRouteFormatter
    }
}
