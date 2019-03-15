require('dotenv').config()
const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')
//TODO make this work without granting
const refund = async ({grantedReason, paymentId, amount, unregister, grant}) => {
    try{
        const {
            charge,
            snapshot,
            user_id
        } = await db.getPayment(paymentId)
        let storeRefund = {
            amount:0,
            status:'rejected'
        }
        if(grant){
            if(charge.id){ //if payment charge is from stripe
                if(charge.amount < amount * 100){
                    amount = charge.amount/100
                }
                const refund = await stripe.refunds.create({ charge:charge.id, amount: amount * 100, metadata:{payment:paymentId}}).catch((error)=>{
                    throw new Error('Stripe error during refund.' + error.message)
                })
                storeRefund = {
                    id:refund.id,
                    amount:refund.amount,
                    charge:refund.charge,
                    status:refund.status
                }
                await db.updateRefund(paymentId, grantedReason, user_id, 'accepted', 'Made without request.', storeRefund)
            }else{
                storeRefund.message = 'Payment of less than 1 dollar cannot be refunded.'
                await db.updateRefund(paymentId, grantedReason, user_id, 'cancled','Made without request.', storeRefund)
            }
        }else{
            await db.updateRefund(paymentId, grantedReason, user_id, 'declined', 'Made without request.', storeRefund)
        }
        if(unregister){
            await db.unregister(snapshot._event.id, snapshot._students)
        }
        return {message:'refund successful'}

    }catch(error){
        console.log(error)
        return {error: "unknown error" + error.message}
    }
  }
module.exports = {
    production:async (req, res) => {
        if(req.body.role === 'ftlc_owner' && req.body.grantReason && req.body.paymentId){
            res.json(await refund(req.body))
        }else{
            res.json({error:'Not enough information provided.'})
        }
    },
    test: refund,
}
