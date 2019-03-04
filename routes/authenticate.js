require('dotenv').config()
const db = require('../db')
const jwt = require('jwt-simple')

const getJWTToken = (role, id, expiresAt) => jwt.encode({ aud: 'postgraphile', role, id , expires_at: expiresAt }, process.env.JWT_SECRET)

const authenticate = async ({email, password}, req) => {
    await db.authenticate(email, password).then((data) => {
        if (data.role && data.id && data.expires_at) {
           req.session.authToken = getJWTToken(data.role, data.id, data.expires_at);
           return{message:'login complete'}
        }
           return { error: 'Email or Password was incorrect.' }
    }).catch((error)=>{
        return {error: error.message}
    })
}



module.exports = {
    production:async (req, res) => {
        if(req.body && req.body.email && req.body.password){
            res.json(await authenticate(req.body, req))
        }else{
            res.json({ error: 'Email or Password was not provided.' })
        }
    },
    test:authenticate
}
