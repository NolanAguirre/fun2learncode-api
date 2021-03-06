const express = require('express')
const app = express()
const cookieSession = require('cookie-session')
require('dotenv').config()
const cors = require('cors')
const bodyParser = require('body-parser')
const jwt = require('jwt-simple')
const { postgraphile } = require('postgraphile')
const SchemaExtension = require('./SchemaExtension')
const SchemaWrapper = require('./SchemaWrapper')
const PostGraphileConnectionFilterPlugin = require('postgraphile-plugin-connection-filter')
const routes = {
    authenticate: require('./routes/authenticate').production,
    recover: require('./routes/recover').production,
    webhook: require('./routes/webhook').production
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
  if (req.session && req.session.authToken && req.body) {
    try {
      const decrypt = jwt.decode(req.session.authToken, process.env.JWT_SECRET)
      if ((req.body.user && decrypt.id === req.body.user) || decrypt.role === 'ftlc_owner') {
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

const whitelist = ['https://api.stripe.com', 'https://checkout.stripe.com', 'https://js.stripe.com', 'https://m.stripe.com', 'https://q.stripe.com']
const corsOptions = {
  origin: function (origin, callback) {
      console.log(origin)
    if (whitelist.indexOf(origin) !== -1 || !origin) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  }
}

const excludeMiddleware = (path, middleware) => {
    return (req, res, next) => {
        if(req.path === path){
            next()
        }else{
            middleware(req, res, next)
        }
    }
}

app.use(excludeMiddleware('/webhook', cors({origin: process.env.CLIENT_URL, credentials: true})))
app.use(excludeMiddleware('/webhook', bodyParser.json()))
app.use('/webhook', cors(corsOptions))
app.use('/webhook', bodyParser.raw({type: '*/*'}))
app.use(cookieSession(cookieOptions))
app.use('/graphql', populateJWT)
app.use('/graphiql', populateJWT)
app.use(postgraphile(process.env.DATABASE_URL, 'ftlc', {
  dynamicJson: true,
  graphiql: true,
  appendPlugins: [PostGraphileConnectionFilterPlugin, SchemaExtension, SchemaWrapper],
  pgDefaultRole: 'ftlc_anonymous',
  jwtPgTypeIdentifier: 'ftlc.jwt_token',
  jwtSecret: process.env.JWT_SECRET
}))

app.post('/authenticate', routes.authenticate)

app.post('/logout', (req, res) => {
  req.session = null
  res.end()
})

app.post('/recover', routes.recover)

app.post('/webhook', routes.webhook)

app.listen(process.env.PORT || 3005)
console.log('Listening on http://localhost:3005')
