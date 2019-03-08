require('dotenv').config()
const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')

const refund = async ({user, refundUser, reason, paymentId, amount, unregister}) => {
    try{
        const payment = await db.getPayment(paymentId)
        const charge = await stripe.refunds.create({ charge: payment.charge.id, amount: amount * 100 }).catch(()=>{
            throw new Error('Stripe error during refund.' + error.message)
        }) // testing use {status:'succeeded'}
        const refund = db.processRefund(payment, refund, unregister, reason)
    }catch(error){
        console.log(error)
        return {error:error.message}
    }
  }
module.exports = {
    production:async (req, res) => {
        if(req.body.role === 'ftlc_owner' && req.body.reason && req.body.paymentId && req.body.unregister >= 0){
            res.json(await refund(req.body))
        }else{
            res.json({error:'Not enough information provided.'})
        }
    },
    test: refund,
}
