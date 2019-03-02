const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const db = require('./db')

const refund = (req, res) => {
    test(req.body, res.session, res.json)
}

const test = async (body, session, cb) => {
  const {
    user,
    reason,
    paymentId,
    amount,
    unregister
  } = body
   try {
      const decrypt = jwt.decode(req.session.authToken, process.env.JWT_SECRET)
      if (decrypt.role === 'ftlc_owner') {
        if (!user || !paymentId || !reason) {
          cb({ error: 'not enough information provided.' })
          return
        }
        let payment
        try {
          payment = await db.getPayment(paymentId)
        } catch (error) {
          cb({ error: 'Could not find payment with given id' })
          return
        }
        try {
          // const refund = await stripe.refunds.create({
          //   charge: payment.charge.id,
          //   amount: amount * 100
          // }) TODO remove for production
          const refund = {status:'succeeded'}
          if (refund.status === 'succeeded') {
            try {
              await db.processRefund(payment, refund, unregister, reason)
              // send mailer
              cb({ complete: 'refund successful' })
            } catch (error) {
              cb({ error: 'refund processed, but failed to update database records.' })
            }
          } else {
            cb({ error: 'the refund attempted and failed', stripeError: refund.failure_reason })
          }
        } catch (error) {
          cb({ error: 'something happened with stripe', stripeError: error })
        }
      } else {
        cb({ error: 'Not authorized...' })
      }
    } catch (error) {
      cb({ error: 'Not authorized..' })
    }
  } 

module.exports = {
    refund,
    refundTest: test,
}
