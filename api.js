const express = require('express');
const app = express();
const cookieSession = require('cookie-session')
require('dotenv').config()
const cors = require('cors')
const {
    postgraphile
} = require("postgraphile");
const PostGraphileConnectionFilterPlugin = require("postgraphile-plugin-connection-filter");
const db = require('./db')
const bodyParser = require('body-parser')
const jwt = require('jwt-simple');
const stripe = require("stripe")(process.env.STRIPE_TOKEN);

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

app.post('/authenticate', function(req, res) {
    if (req.body && req.body.email && req.body.password) {
        db.authenticate(req.body.email, req.body.password).then((data) => {
            if (data.role && data.id && data.expires_at) {
                console.log('working')
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

app.post('/payment', async (req, res) => {
    let info = await db.getRegistrationData(req.body.students, req.body.addons, req.body.dateGroup, req.body.event, req.body.promoCode, new Date().toISOString()) //add promo cod
    if (info.event && info.dateGroup) {
        if (true) { //capacity check
            if (info.addons.length === req.body.addons.length) {
                let studentsMeetPrereqs = true;
                req.body.students.forEach((student) => {
                    studentsMeetPrereqs = studentsMeetPrereqs && info[student]
                })
                if (studentsMeetPrereqs) {
                    let total = 0;
                    req.body.students.forEach((student) => {
                        let adjustedPrice
                        if (req.body.students.length > 1 && !req.body.promoCode) {
                            adjustedPrice = info.dateGroup.price * .9
                        } else {
                            adjustedPrice = info.dateGroup.price
                        }
                        total += adjustedPrice
                        info.addons.forEach((addon) => {
                            total += addon.price
                        })
                    })
                    if(req.body.students.length < 2 && req.body.promoCode){
                        //promocode info here
                    }
                    let name = `${req.body.user.first_name} ${req.body.user.last_name}`
                    const charge = await stripe.charges.create({
                      amount: total * 100,
                      currency: 'usd',
                      description: 'example charge',
                      source: req.body.stripeToken,
                      statement_descriptor: 'Fun2LearnCode Event'
                      //metadata: less than 500 chars
                    }).then(data=>data)
                    .catch((err)=>{
                        console.log(err)
                     return {paid:false}
                    });
                    if(charge.paid){
                        db.storePayment(req.body.user, info).then((data)=>{
                            db.createEventRegistration(req.body.user, info, data).then(() => {
                                res.json({message:'Payment and registration successful'})
                            }).catch((error)=>{
                                res.json({error:'Student already registered for this event'})
                            })
                        })
                    }else{
                        res.json({error:'Card declined'})
                    }
                } else {
                    res.json({error: 'One or more students does not meet the prerequisites for the event'})
                }
            } else {
                res.json({error: 'A selected add on is not avaliable for the event'})
            }
        } else {
            res.json({error: 'There are not enough seats left for the event'})
        }
    } else {
        res.json({error: 'Registration for the event is not avaliable at this time'})
    }
})

app.listen(3005);
console.log('Listening on http://localhost:3005');
