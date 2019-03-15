const db = require('../db')

const accountAction = async ({user}) => {
    try{
        const temp = db.getUser(user)
        mailer.accountAction(process.env.ADMIN_EMAIL, temp)
    }catch(error){
        console.log(error)
    }
  }
module.exports = {
    production: (req, res) => {

    },
    test: accountAction
}
