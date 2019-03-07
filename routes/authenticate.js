const db = require('../db')
const jwt = require('jwt-simple')

const getJWTToken = (role, id, expiresAt) => jwt.encode({ aud: 'postgraphile', role, id , expires_at: expiresAt }, process.env.JWT_SECRET)

const authenticate = async ({email, password}) => {
    return await db.authenticate(email, password).then((data) => {
        if (data.role && data.id && data.expires_at) {
           return {auth:getJWTToken(data.role, data.id, data.expires_at)}
        }
           return { error: 'Email or Password was incorrect.' }
    }).catch((error)=>{
        return {error: error.message}
    })
}



module.exports = {
    production:async (req, res) => {
        if(req.body && req.body.email && req.body.email.match('^.+@.+\\..+$') && req.body.password){
            const data = await authenticate(req.body)
            if(data.auth){
                req.session.authToken = data.auth
                res.end()
            }else{
                res.json(data)
            }
        }else{
            res.json({ error: 'Email or Password was not provided.' })
        }
    },
    test:authenticate
}
