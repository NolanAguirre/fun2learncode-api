const jwt = require('jwt-simple')
require('dotenv').config()

const getJWTToken = (role, id, expiresAt) => (
  jwt.encode({
    aud: 'postgraphile',
    role,
    id,
    expires_at: expiresAt
  }, process.env.JWT_SECRET)
)

const authenticate = ({email, password}) => {
    if(email && password){
        db.authenticate(email, password).then((data) => {
       if (data.role && data.id && data.expires_at) {
               return {'Cookie': getJWTToken(data.role, data.id, data.expires_at)}
           } else {
               return { error: 'Email or Password was incorrect.' }
           }
         })
       }
   }else{
       return { error: 'Email or Password was not provided.' }
   }
}

module.exports = (req, res) => {
    if(process.env.PRODUCTION){
        const auth = authenticate(res.body.email, res.body.password)
        return {statusCode:200, body:auth}
    }else{
        const auth = authenticate(res.body.email, res.body.password)
        if(auth.Cookie){
            req.session.authToken = auth.Cookie
            res.end()
        }else{
            res.json(...auth)
        }
    }
}
