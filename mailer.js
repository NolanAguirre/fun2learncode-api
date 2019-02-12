const nodemailer = require('nodemailer')
const ResetPasswordTemplate = require('./emailTemplates/recoverEmail')
const transporter = nodemailer.createTransport({
  host: 'imap.dreamhost.com',
  port: 465,
  secure: true,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASSWORD
  }
})

var mailer = {}
mailer.resetPassword = (email, name, token) => {
  mailer.send({
    from: 'no_reply@fun2learncode.com', // sender address
    to: email, // list of receivers
    subject: 'Password reset', // Subject line
    html: ResetPasswordTemplate(name, `http://localhost:3000/reset/${encodeURIComponent(token)}`)// plain text body
  }, (info, error) => { console.log(error) })
}

// mailer.refundReply = (email, granted, reason) => {
//     let template = granted?RefundGranted:RefundDenied(reason)
//     mailer.send({
//         from:'no_reply@fun2learncode.com',
//         to: email,
//         subject 'Refund request',
//         html: template
//     }, (info, error)=>{})
// }

mailer.send = (options, callback) => { // {from, to, subject, body}, cb(error, info)
  transporter.sendMail(options, callback)
}

module.exports = mailer
