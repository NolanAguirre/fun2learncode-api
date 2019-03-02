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
  return mailer.send({
    from: 'no_reply@fun2learncode.com', // sender address
    to: email, // list of receivers
    subject: 'Password reset', // Subject line
    html: ResetPasswordTemplate(name, `http://localhost:3000/reset/${encodeURIComponent(token)}`)// plain text body
})
}

// mailer.refundReply = (email, granted, reason) => {
//     let template = granted?RefundGranted:RefundDenied(reason)
//     return mailer.send({
//         from:'no_reply@fun2learncode.com',
//         to: email,
//         subject 'Refund request',
//         html: template
//     }, (info, error)=>{})
// }

mailer.refundRequest = () => {}

mailer.newsLetter = (emails, body) => {}

mailer.send = (options) => { // {from, to, subject, body}, cb(error, info)
  return transporter.sendMail(options)
}

module.exports = mailer
