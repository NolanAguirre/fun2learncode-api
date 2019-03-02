const { Pool } = require('pg');
const { graphql } = require('graphql');
const { withPostGraphileContext } = require('postgraphile');
const { createPostGraphileSchema } = require('postgraphile')
const PostGraphileConnectionFilterPlugin = require('postgraphile-plugin-connection-filter')


const pool = new Pool({
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password:process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  ssl: true,
  max: 20, // set pool max size to 20
  min: 4, // set min pool size to 4
  idleTimeoutMillis: 1000, // close idle clients after 1 second
  connectionTimeoutMillis: 1000, // return an error after 1 second if connection could not be established
})

let schema = '';

module.exports = async function Query(query, variables, jwtToken) {
       if(!schema){
           schema = await createPostGraphileSchema(process.env.DATABASE_URL, 'ftlc', {
                 dynamicJson: true,
                 graphiql: true,
                 appendPlugins: [PostGraphileConnectionFilterPlugin],
                 pgDefaultRole: 'ftlc_anonymous',
                 jwtPgTypeIdentifier: 'ftlc.jwt_token',
                 jwtSecret: process.env.JWT_SECRET
              }
          ).then(s=>s)
      }
     return await withPostGraphileContext(
       {
         pgPool: pool,
         jwtToken: jwtToken,
         jwtSecret: process.env.JWT_SECRET,
         pgDefaultRole: 'ftlc_anonymous'
       },
       async context => {
         return await graphql(
           schema,
           query,
           null,
           { ...context }, // You can add more to context if you like
           variables,
           null
         );
       }
     );
   }
