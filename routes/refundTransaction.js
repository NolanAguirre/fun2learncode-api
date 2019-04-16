require('dotenv').config()
const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')
const mailer = require('../mailer')
//TODO test this better
const refund = async ({grantedReason, paymentId, amount, unregister, grant}) => {
    const {
            charge,
            snapshot,
            user_id
        } = await db.getPayment(paymentId)
        const user = await db.getUser(user_id)
        let storeRefund = {
            amount:0,
            status:'rejected'
        }
        let refundId
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
                refundId = await db.updateRefund(paymentId, grantedReason, user_id, 'accepted', 'Made without request.', storeRefund)
            }else{
                storeRefund.message = 'Payment of less than 1 dollar cannot be refunded.'
                refundId = await db.updateRefund(paymentId, grantedReason, user_id, 'cancled','Made without request.', storeRefund)
            }
        }else{
            refundId = await db.updateRefund(paymentId, grantedReason, user_id, 'declined', 'Made without request.', storeRefund)
        }
        if(unregister){
            await db.unregister(snapshot._event.id, snapshot._students)
        }
        mailer.accountAction(user.email, {message:'refund action taken, check order history on event that the refund was requested on.'})
        if(process.env.TEST){
            return {complete:true}
        }
        return refundId
  }
module.exports = {
    production: refund,
    test: async (args) => {
        try{
            return await refund(args)
        }catch (error){
            return {error:error.message}
        }
    },
}
