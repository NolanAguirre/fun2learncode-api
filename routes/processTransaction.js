require('dotenv').config()
const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')

const processTransaction = async ({user, token}) => {
    try{
        const transaction = await db.startTransaction(user)
        let charge;
        if(process.env.TEST){
            if(transaction.total < 1){
                charge = {paid:true, message:'Total was less than 1 USD, no stripe charge generated.'}
            }else{
                charge = {paid:true, total:transaction.total*100, message:'this is a charge token that was made in testing'}
            }
        }else{
            if(transaction.total < 1){
                charge = {paid:true, message:'Total was less than 1 USD, no stripe charge generated.'}
            }else{
                charge = await stripe.charges.create({
                  amount: transaction.total * 100,
                  currency: 'usd',
                  description: 'fun2learncode Event charge',
                  source: token,
                  statement_descriptor: 'Fun2LearnCode Event'
              }).catch((error)=>{console.log(error); throw new Error('Stripe error while processing card.' + error.message)})
            }
        }
        if (charge.paid) {
            const paymentId = await db.storePayment(user, data.transaction, data.charge)
            await db.createEventRegistration(user, transaction._students, transaction._event.id, paymentId)
            return{
              message: 'Payment and registration successful',
              students: transaction._students.map(student => student.id)
            }
        }else{ // this should never tigger
            throw new Error('Stripe processed payment but total was not paid.')
        }
    }catch(error){
        console.log(error)
        return {error:error.message}
    }
    db.endTransaction(user)
  }

module.exports = {
 production: (req, res) => {
         if(req.body.token){
             res.json(processTransaction(req.body))
         }else{
             res.json({error:'Not enough information provided.'})
         }
     },
     test:processTransaction
  }
