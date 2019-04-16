const nodemailer = require('nodemailer')
const ResetPasswordTemplate = require('./emailTemplates/recoverEmail')
const confirmation = require('./emailTemplates/confirmation')
const accountAction = require('./emailTemplates/accountAction')
const eventRequestUpdate = require('./emailTemplates/eventRequestUpdate')
const mailingQueue = require('./mailingQueue')
require('dotenv').config()
const transporter = nodemailer.createTransport({
  host: 'imap.dreamhost.com',
  port: 465,
  secure: true,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASSWORD
  }
})

mailingQueue.config(
    {
        priorities:[
            {key:4, usage:99}, //usage is emails allowed to be used by
            {key:3, usage:90},
            {key:2, usage:80},
            {key:1, usage:80},
            {key:0, usage:50}
        ],
        total:99,
        filterRate: 300000,//filter times every 5 minutes 300000
        emailRefreshRate: 3660000, //email limit is 100 per hour 3660000
        cb: (data)=>{transporter.sendMail(data)}
    }
)


var mailer = {}

mailer.resetPassword = (email, name, token) => {
  mailingQueue.add({
    from: 'no_reply@fun2learncode.com', // sender address
    to: email, // list of receivers
    subject: 'Password reset', // Subject line
    html: ResetPasswordTemplate(name, `${process.env.CLIENT_URL}/reset/${encodeURIComponent(token)}`)// plain text body
    }, 4)
}

mailer.confirmation = (email, data) => {
    console.log(data)
    mailingQueue.add({
        from:'no_reply@fun2learcode.com',
        to:email,
        subject:'Confirmation Email',
        html:confirmation(data)
    }, 2)
}

mailer.failedRefund = (email, refundData) => {
    mailingQueue.add({
        from: 'no_reply@fun2learncode.com',
        to: email,
        subject:'Refund failed',
        html:`<div>${JSON.stringify(refundData)}</div>`
    },1)
}


mailer.eventRequest = (email, status, token, name) => {
    mailingQueue.add({
        from:'no_reply@fun2learncode.com',
        to:email,
        subject:'Event request update',
        html: eventRequestUpdate(status, token, name)
    }, 1)
}

mailer.accountAction = (email, user) => {
    mailingQueue.add({
      from: 'no_reply@fun2learncode.com', // sender address
      to: email, // list of receivers
      subject: 'Account Action required', // Subject line
      html: accountAction(user, user)// plain text body
  }, 3)
}

module.exports = mailer
