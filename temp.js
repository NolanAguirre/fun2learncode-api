const { Pool } = require('pg');
const { graphql } = require('graphql');
const { withPostGraphileContext } = require('postgraphile');

const myPgPool = new Pool({ ... });

export async function performQuery(
  query,
  variables,
  jwtToken,
  operationName
) {
  return await withPostGraphileContext(
    {
      pgPool: myPgPool,
      jwtToken: jwtToken,
      jwtSecret: "...",
      pgDefaultRole: "..."
    },
    async context => {
      // Execute your GraphQL query in this function with the provided
      // `context` object, which should NOT be used outside of this
      // function.
      return await graphql(
        schema, // The schema from `createPostGraphileSchema`
        query,
        null,
        { ...context }, // You can add more to context if you like
        variables,
        operationName
      );
    }
  );
}
