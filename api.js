const express = require('express')
const app = express()
const cookieSession = require('cookie-session')
require('dotenv').config()
const cors = require('cors')
const db = require('./db')
const bodyParser = require('body-parser')
const jwt = require('jwt-simple')
const mailer = require('./mailer')
const begin = require('./beginTransaction')
const processTransaction = require('./processTransaction')
const refund = require('./refundTransaction')
const graphql = require('./graphql')
const authenticate = require('./authenticate')

const getJWTToken = (role, id, expiresAt) => (
  jwt.encode({
    aud: 'postgraphile',
    role,
    id,
    expires_at: expiresAt
  }, process.env.JWT_SECRET)
)

const populateJWT = (req, res, next) => {
  if (req.session.authToken) {
    req.headers.authorization = 'Bearer ' + req.session.authToken
  }
  next()
}

const cookieOptions = {
  name: 'session',
  keys: ['secretKeyOne', 'secreteKeyTwo', 'secreteKeyThree'],
  maxAge: 24 * 60 * 60 * 1000, // 24 hours
  sameSite: true
  // secure: true,
  // httpOnly: true
}

const validateAuthToken =  (req, res, next) => {
  if (req.session && req.session.authToken && req.body && req.body.user) {
    try {
      const decrypt = jwt.decode(session.authToken, process.env.JWT_SECRET)
      if (decrypt.id === user) {
        next()
      }
    } catch (error) {
      res.json({error:'Not authorized.'})
    }
  }
  res.json({error:'Not authorized.'})
}


app.use(cors({origin: 'http://localhost:3000', credentials: true}))
app.use(cookieSession(cookieOptions))
app.use(bodyParser.json())
app.use('/graphql', populateJWT)
app.use('/graphiql', populateJWT)
// app.use(postgraphile(process.env.DATABASE_URL, 'ftlc', {
//   dynamicJson: true,
//   graphiql: true,
//   appendPlugins: [PostGraphileConnectionFilterPlugin],
//   pgDefaultRole: 'ftlc_anonymous',
//   jwtPgTypeIdentifier: 'ftlc.jwt_token',
//   jwtSecret: process.env.JWT_SECRET
// }))
app.use('/payment', validateAuthToken)

app.post('/graphql', (req,res) =>{
    const foo = graphql(`{
        allStudents{
            nodes{
                id
            }
        }
    }`, null, null, null).then((data)=>{
        console.log(data)
        res.json({...data})
    })
})
app.post('/authenticate', authenticate)

app.post('/logout', (req, res) => {
  req.session = null
  res.end()
})

app.post('/payment/begin', begin.begin)

app.post('/payment/process', processTransaction.processTransaction )

app.post('/payment/refund', refund.refund)

app.post('/recover', (req, res) => {
  const email = req.body.email
  if (email && email.match('^.+@.+\\..+$')) {
    db.genTemporaryToken(email).then((data) => {
      if (data.length === 2) {
        const token = data[0].first_name
        const name = data[1].first_name
        if (token !== 'no user') {
          mailer.resetPassword(email, name, token)
        }
      }
    }).catch((error) => {
      console.log(error)
    })
    res.json({
      message: `An email has been sent to ${email} with furthur instructions.`
    })
  } else {
    res.json({
      error: 'No valid email was provided.'
    })
  }
})

app.post('/mailing', (req, res) => {

})

app.listen(3005)
console.log('Listening on http://localhost:3005')
