const db = require('../db')
const mailer = require('../mailer')
const {chargeCard, chargeCustomer} = require('./stripe').test

const processTransaction = async ({user, paymentItem}) => {
    try{
        const transaction = await db.startTransaction(user)
        let charge;
        if(transaction.total < 1){
            charge = {paid:true, message:'Total was less than 1 USD, no stripe charge generated.'}
        }else{
            if(paymentItem.id){ //if payment item is a stripe token
                charge = await chargeCard(user, paymentItem.id, transaction.total)
            }else{
                charge = await chargeCustomer(user, paymentItem.cardInfo, transaction.total)
            }
        }
        const storedCharge = {
            id: charge.id,
            amount: charge.amount
        }
        if (charge.paid) {
            const paymentId = await db.storePayment(user, transaction, storedCharge)
            await db.createEventRegistration(user, transaction._students, transaction._event.id, paymentId)
            await db.endTransaction(user)
            const emailData = await db.getEmailData(transaction._event.id)
            mailer.confirmation(transaction._user.email, {
                students:transaction._students,
                reciptURL:charge.receipt_url,
                activity:transaction._activity,
                eventPrice:transaction._event.price,
                overrides:transaction._overrides,
                addons:transaction._addons,
                orderId:paymentId,
                promoCode:transaction._promoCode,
                total:transaction.total,
                brand:charge.source.brand,
                lastFour:charge.source.last4,
                ...emailData
            })
            if(process.env.TEST){
                return {message: 'Payment and registration successful', paymentId}
            }
            return{message: 'Payment and registration successful'}
        }else{ // this should never tigger
            throw new Error('Stripe processed payment but total was not paid.')
        }
    }catch(error){
        try{
            await db.endTransaction(user)
            return {error:error.message}
        }catch(megaError){
            console.log(megaError)
            return{error:'mega error occured, account locked from transactions, contact website owner.'}
        }
  }
}

module.exports = {
 production: async (req, res) => {
         if(req.body.paymentItem){
             res.json(await processTransaction(req.body))
         }else{
             res.json({error:'Not enough information provided.'})
         }
     },
     test:processTransaction
  }
