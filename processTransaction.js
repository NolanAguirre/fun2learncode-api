const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('./db')

const processTransaction  = (req, res) => {
    test(req.body, res.session, res.json)
}

const test = async (body, session, cb) => {
  const {
    user,
    token
  } = body
  if (user) {
    let transaction
      try {
        transaction = await db.startTransaction(user)
      } catch (error) {
        console.log(error)
        cb({ error: 'Transaction currently being processed, please wait.' })
        return
      }
      let charge;
      if(transaction.total < 1){
          charge = {paid:true, message:'Total was less than 1 USD, no stripe charge generated.'}
      }else if(token){
          charge = await stripe.charges.create({
            amount: transaction.total * 100,
            currency: 'usd',
            description: 'fun2learncode Event charge',
            source: token,
            statement_descriptor: 'Fun2LearnCode Event'
          }).then(data => data)
            .catch((err) => {
              console.log(err)
              return {
                paid: false
              }
            })
      }else{
          cb({ error: 'Credit card information not entered.' })
          db.endTransaction(user)
          return
      }

      if (charge.paid) {
        db.storePayment(user, transaction, charge).then((data) => {
          db.createEventRegistration(user, transaction._students, transaction._event.id, data).then(() => {
            cb({
              message: 'Payment and registration successful',
              students: transaction._students.map(student => student.id)
            })
          }).catch((error) => {
            console.log(error)
            cb({ error: 'Fatal error occured when registering for events, request refund.' })
          })
        }).catch((error) => {
          console.log(error)
          cb({ error: 'Fatal error occured when storing payment information, request refund.' })
        })
      } else {
        cb({error: 'Card declined'})
      }
      db.endTransaction(user)
    }
  }


  module.exports = {
      processTransaction ,
      processTest: test,
  }
