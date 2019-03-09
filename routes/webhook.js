const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('../db')
const mailer = require('../mailer')

const webhook = async (body) => {
    const refund = body.data.object
    try{
        const myRefund = await db.storeRefund(refund, refund.metadata.payment)
        await mailer.failedRefund('nolanaguirretesting@gmail.com', myRefund)
    }catch(error){
        console.log(error)
    }
  }
module.exports = {
    production: (req, res) => {
        const sig = req.headers["stripe-signature"];
        try {
          const event = stripe.webhooks.constructEvent(req.body, sig, process.env.WEBHOOK_SECRET)
          webhook(event);
      }catch (error) {
          console.log(error.message)
          res.status(400).end()
        }
      res.json({received: true})
    },
    test: webhook
}
