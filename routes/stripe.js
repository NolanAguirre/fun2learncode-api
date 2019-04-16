const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')
const express = require('express')
const router = express.Router()

const stripCard = (card) => {
    return {
        last4:card.last4,
        exp_year: card.exp_year,
        exp_month: card.exp_month,
        brand:card.brand,
        id:card.id
    }
}
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
        if(user){
            return(await stripe.customers.listCards(user)).data.map(card=>stripCard(card))
        }else{
            return {error:'No stripe customer account on record.'}
        }
    }catch(error){
        return {error:error.message}
    }
}

const cardByInfo = async (stripe_id, cardInfo) => {
    return (await getUserCards(null, stripe_id)).filter((card)=>{
        return card.last4 === cardInfo.last4 &&
            card.brand === cardInfo.brand &&
            card.exp_month === cardInfo.exp_month &&
            card.exp_year === cardInfo.exp_year
        })
}

const addCard = async (userId, token, cardInfo) => {
    const user = await db.getStripeUser(userId)
    if(user.stripe_id){
        const cards = await cardByInfo(user.stripe_id, cardInfo)
        if(cards.length === 0){
            const newCard = await stripe.customers.createSource(user.stripe_id,{ source: token }) //on invalid card info it says Your card was declined.
            return stripCard(newCard)
        }
        throw new Error('Provided card has the same last 4 digits, brand, and experation date as a stored card, operation aborted.')
    }else{
        throw new Error('No stripe customer account on record.')
    }
}

const deleteCard = async (id, cardInfo) => {
    const user = await db.getStripeUser(id)
    if(user.stripe_id){
        const cards =  await cardByInfo(user.stripe_id, cardInfo)
        if(cards.length === 1){
            await stripe.customers.deleteCard(user.stripe_id, cards[0].id)
            return stripCard(cards[0])
        }else if(cards.length === 0){
            throw new Error('No card found.')
        }else{
            throw new Error('Duplicate card detected.') // this should never happen as duplicates are check before they are added
        }
    }else{
        throw new Error('No stripe customer account on record.')
    }
}

const chargeCard = async (id, token, total) => {
    try{
        return await stripe.charges.create({
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
            console.log(cards)
            if(cards.length === 1){
                return await stripe.charges.create({
                    amount: total * 100,
                    currency: 'usd',
                    description: 'Fun 2 Learn Code Event',
                    metadata:{user:id},
                    source: cards[0].id,
                    customer: user.stripe_id,
                    statement_descriptor: 'Fun 2 Learn Code Event'
                }).catch((error)=>{throw new Error('Stripe error while processing customer card.' + error.message)})
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
    return cards.map((card)=>{
        return {
            last4:card.last4,
            brand:card.brand,
            exp_month:card.exp_month,
            exp_year:card.exp_year
        }
    })
}


module.exports = {
    production: {
        addCard,
        deleteCard,
        getUserCards,
        createCustomer
    },
    test:{
        createCustomer,
        addCard,
        deleteCard,
        chargeCard,
        chargeCustomer,
        getUserCards,
        cardRouteFormatter
    }
}
