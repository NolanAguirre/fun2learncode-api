require('dotenv').config()
const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')

const refund = async ({user, refundUser, reason, paymentId, amount, unregister}) => {
    try{
        const payment = await db.getPayment(paymentId)
        let refund
        if(payment.charge.id){
            if(payment.charge.amount < amount * 100){
                amount = payment.charge.amount
            }
            refund = await stripe.refunds.create({ charge: payment.charge.id, amount: amount * 100, metadata:{payment:paymentId}}).catch((error)=>{
                throw new Error('Stripe error during refund.' + error.message)
            })
            if(refund.status === 'failed'){
                return {error:'Stripe error during refund.' + refund.failure_reason}
            }
        }else{
            refund = {message:'Payment of less than 1 dollar cannot be refunded.'}
        }
        await db.processRefund(payment, refund, unregister, reason)
        return {message:'refund successful'}

    }catch(error){
        console.log(error)
        return {error: "unknown error" + error.message}
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
