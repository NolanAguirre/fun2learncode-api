const express = require('express');
const app = express();
require('dotenv').config()
const jwt = require('express-jwt');
const cors = require('cors');
const {postgraphile} = require("postgraphile");
const PostGraphileConnectionFilterPlugin = require("postgraphile-plugin-connection-filter");

app.use(cors());

app.use(postgraphile(process.env.DATABASE_URL, "ftlc", {
    dynamicJson: true,
    enableCors: true,
    graphiql: true,
    appendPlugins: [PostGraphileConnectionFilterPlugin]
}));

app.listen(3005);
console.log('Listening on http://localhost:3005');
