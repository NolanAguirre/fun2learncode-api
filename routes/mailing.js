const db = require('../db')
const mailer = require('../mailer')

const mailing = async ({html}) => {
    try{
        const mailingList = (await db.getMailingList()).map(data=>data.email)
        await mailer.newsLetter(mailingList, html)
        return {message:'news letter sent'}
    } catch(error){
        console.log(error)
        return {error: error.message}
    }
  }
module.exports = {
    production:async (req, res) => {
        if(req.body && req.body.html && body.role === 'ftlc_owner'){
            res.json(await mailing(req.body))
        }else{
            res.json({error:'Not authorized.'})
        }
    },
    test: mailing
}
