const jwt = require('jwt-simple')

const getJWTToken = (role, id, expiresAt) => jwt.encode({ aud: 'postgraphile', role, id , expires_at: expiresAt }, process.env.JWT_SECRET)

const authenticate = async ({email, password}) => {
    await db.authenticate(email, password).then((data) => {
        if (data.role && data.id && data.expires_at) {
           return {'Cookie': getJWTToken(data.role, data.id, data.expires_at)}
        }
           return { error: 'Email or Password was incorrect.' }
    }).catch((error)=>{
        return {error: error.message}
    })
}



module.exports = {
    production:(req, res) => {
        if(req.body & req.body.email && req.body.password){
            return res.json(authenticate(req.body))
        }else{
            res.json({ error: 'Email or Password was not provided.' })
        }
    },
    test:authenticate
}
