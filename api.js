const express = require('express')
const app = express()
const cookieSession = require('cookie-session')
require('dotenv').config()
const cors = require('cors')
const bodyParser = require('body-parser')
const jwt = require('jwt-simple')
const { postgraphile } = require('postgraphile')
const PostGraphileConnectionFilterPlugin = require('postgraphile-plugin-connection-filter')

const routes = {
    mailing: require('./routes/mailing').production,
    begin: require('./routes/beginTransaction').production,
    process: require('./routes/processTransaction').production,
    refund: require('./routes/refundTransaction').production,
    authenticate: require('./routes/authenticate').production,
    recover: require('./routes/recover').production
}

const populateJWT = (req, res, next) => {
  if (req.session.authToken) {
    req.headers.authorization = 'Bearer ' + req.session.authToken
  }
  next()
}

const cookieOptions = {
  name: 'session',
  keys: ['secretKeyOne', 'secreteKeyTwo', 'secreteKeyThree'],
  maxAge: 24 * 60 * 60 * 1000
}

const validateAuthToken =  (req, res, next) => {
  if (req.session && req.session.authToken && req.body && req.body.user) {
    try {
      const decrypt = jwt.decode(req.session.authToken, process.env.JWT_SECRET)
      if (decrypt.id === req.body.user) {
          req.body.role = decrypt.role
          next()
      }
    } catch (error) {
      res.json({error:'Not authorized.'})
    }
    }else{
        res.json({error:'Not authorized.'})
    }
}


app.use(cors({origin: process.env.CLIENT_URL, credentials: true}))
app.use(cookieSession(cookieOptions))
app.use(bodyParser.json())
app.use('/graphql', populateJWT)
app.use('/graphiql', populateJWT)
app.use(postgraphile(process.env.DATABASE_URL, 'ftlc', {
  dynamicJson: true,
  graphiql: true,
  appendPlugins: [PostGraphileConnectionFilterPlugin],
  pgDefaultRole: 'ftlc_anonymous',
  jwtPgTypeIdentifier: 'ftlc.jwt_token',
  jwtSecret: process.env.JWT_SECRET
}))

app.use('/payment', validateAuthToken)
app.use('/mailing', validateAuthToken)

app.post('/authenticate', routes.authenticate)

app.post('/logout', (req, res) => {
  req.session = null
  res.end()
})

app.post('/payment/begin', routes.begin)

app.post('/payment/process', routes.process)

app.post('/payment/refund', routes.refund)

app.post('/recover', routes.recover)

app.post('/mailing', routes.mailing)

app.listen(process.env.PORT || 3005)
console.log('Listening on http://localhost:3005')
