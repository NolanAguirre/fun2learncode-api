const express = require('express');
const app = express();
const cookieSession = require('cookie-session')
require('dotenv').config()
const cors = require('cors')
const {postgraphile} = require("postgraphile");
const PostGraphileConnectionFilterPlugin = require("postgraphile-plugin-connection-filter");
const db = require('./db')
const bodyParser = require('body-parser')
const jwt = require('jwt-simple');
const mailer = require('./mailer')
const transaction = require('./transaction')


const getJWTToken = (role, id, expires_at) => (
    jwt.encode({
        aud: "postgraphile",
        role,
        id,
        expires_at
    }, process.env.JWT_SECRET)
);

const populateJWT = (req, res, next) => {
    if (req.session.authToken) {
        req.headers.authorization = 'Bearer ' + req.session.authToken
    }
    next();
};

const cookieOptions = {
    name: 'session',
    keys: ['secretKeyOne', 'secreteKeyTwo', 'secreteKeyThree'],
    maxAge: 24 * 60 * 60 * 1000, // 24 hours
    sameSite: true
    //secure: true,
    //httpOnly: true
}

const formatSnapshot = (info, charge) => {
    return {
        activity:info.activity,
        dateGroup:info.dateGroup,
        dates:info.dates,
        addons:info.addons,
        students:info.students,
        payment:{
            total: charge.amount,
            chargedTo: charge.source.last4
            //promoCode
        }
    }
}

app.use(cors({
    origin: 'http://localhost:3000',
    credentials: true
}));
app.use(cookieSession(cookieOptions))
app.use(bodyParser.json())
app.use('/graphql', populateJWT);
app.use('/graphiql', populateJWT);
app.use(postgraphile(process.env.DATABASE_URL, "ftlc", {
    dynamicJson: true,
    graphiql: true,
    appendPlugins: [PostGraphileConnectionFilterPlugin],
    pgDefaultRole: "ftlc_anonymous",
    jwtPgTypeIdentifier: "ftlc.jwt_token",
    jwtSecret: process.env.JWT_SECRET
}));

app.post('/authenticate', (req, res) => {
    if (req.body && req.body.email && req.body.password) {
        db.authenticate(req.body.email, req.body.password).then((data) => {
            if (data.role && data.id && data.expires_at) {
                req.session.authToken = getJWTToken(data.role, data.id, data.expires_at);
                res.end()
            }else{
                res.json({error:'Email or Password was incorrect'})
            }
        })
    } else {
        res.json({
            error: 'Email or password was not given'
        })
    }
});

app.post('/logout', (req, res) => {
    req.session = null;
    res.end();
});

app.post('/store', transaction.begin)

app.post('/charge', transaction.process)

app.post('/refund', transaction.refund)

app.post('/recover', (req, res) => {
    const email = req.body.email
    if(email && email.match('^.+@.+\..+$')){
        db.genTemporaryToken(email).then((data)=>{
            if(data.length === 2){
                const token = data[0].first_name;
                const name = data[1].first_name;
                if(token !== 'no user'){
                    mailer.resetPassword(email, name, token)
                }
            }
        }).catch((error)=>{
            console.log(error)
        })
        res.json({message:`An email has been sent to ${email} with furthur instructions.`})
    }else{
        res.json({error:'No valid email was provided.'})
    }
})

app.post('/newsletter', (req, res) => {

})

app.listen(3005);
console.log('Listening on http://localhost:3005');
