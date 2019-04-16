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
                charge = await chargeCard(user, paymentItem.token, transaction.total)
            }else{
                charge = await chargeCustomer(user, paymentItem.input, transaction.total)
            }
        }
        const storedCharge = {
            id: charge.id,
            amount: charge.amount
        }
        if (charge.paid) {
            const payment = await db.storePayment(user, transaction, storedCharge)
            await db.createEventRegistration(user, transaction._students, transaction._event.id, payment)
            await db.endTransaction(user)
            const emailData = await db.getEmailData(transaction._event.id)
            mailer.confirmation(transaction._user.email, {
                students:transaction._students,
                reciptURL:charge.receipt_url,
                activity:transaction._activity,
                eventPrice:transaction._event.price,
                overrides:transaction._overrides,
                addons:transaction._addons,
                orderId:payment,
                promoCode:transaction._promoCode,
                total:transaction.total,
                brand:charge.source.brand,
                lastFour:charge.source.last4,
                ...emailData
            })
            if(process.env.TEST){
                return {complete:true, paymentId}
            }
            return payment
        }else{
            throw new Error('Stripe processed payment but total was not paid.')
        }
    }catch(error){
        try{
            await db.endTransaction(user)
            throw new Error(error.message)
        }catch(megaError){
            console.log(megaError)
            throw new Error('mega error occured, account locked from transactions, contact website owner.')
        }
  }
}

module.exports = {
 production: processTransaction,
 test: async (args) => {
     try{
         return await processTransaction(args)
     }catch(error){
         return {error:error.message}
     }
 }
}
