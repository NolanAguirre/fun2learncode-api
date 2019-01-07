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

const getJWTToken = (role, id, expires_at) => (
    jwt.encode({
        aud: "postgraphile",
        role,
        id,
        expires_at
    }, process.env.JWT_SECRET)
);

const populateJWT = (req, res, next) => {
    console.log(req.session)
    if (req.session.authToken) {
        console.log('secure request made')
        req.headers.authorization = 'Bearer ' + req.session.authToken
    }
    next();
};

const cookieOptions = {
    name: 'session',
    keys: ['secretKeyOne', 'secreteKeyTwo', 'secreteKeyThree'],
    maxAge: 24 * 60 * 60 * 1000, // 24 hours
    sameSite:true
    //secure: true,
    //httpOnly: true
}

app.use(cors({origin:'http://localhost:3000', credentials:true}));
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
                req.session.authToken = getJWTToken(data.role, data.id, data.expires_at);
                res.end()
            }
        })
    } else {
        res.json({
            'error': 'Username or password was not given'
        })
    }
});

app.listen(3005);
console.log('Listening on http://localhost:3005');
