const db = require('../db')


const recover = async ({email}) => {
    try{
        const data = await db.genTemporaryToken(email)
        if (data.length === 2) {
          const token = data[0].first_name // this is the token, need to fix query
          const name = data[1].first_name
          if (token !== 'no user') {
            await mailer.resetPassword(email, name, token)
            res.json({message: `An email has been sent to ${email} with furthur instructions.`})
          }
        }
    } catch(error){
        console.log(error)
        return {error: error.message}
    }
  }
module.exports = {
    production:async (req, res) => {
        if(req.body && req.body.email && req.body.email.match('^.+@.+\\..+$')){
            res.json(await recover(req.body))
        }else{
            res.json({error:'No valid email provided.'})
        }
    },
    test: recover,
}
