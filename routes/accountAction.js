const db = require('../db')
const mailer = require('../mailer')

const accountAction = async ({user}) => {
    try{
        const temp = await db.getUser(user)
        mailer.accountAction(process.env.ADMIN_EMAIL, {message:`User has requested an event, or a refund, please check the website for more details. User:<br />${JSON.stringify(temp)}`})
        return {message:'Email sent.'}
    }catch(error){
        console.log(error)
    }
  }
module.exports = {
    production: async (req, res) => {
        if(req.body && req.body.user){
            const data = await accountAction(req.body)
            res.json(data)
        }else{
            res.json({ error: 'No valid user found, email not sent.' })
        }
    },
    test: accountAction
}
