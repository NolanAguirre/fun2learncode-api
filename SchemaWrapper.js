const { makeWrapResolversPlugin, gql } = require("graphile-utils");
const mailer = require('./mailer.js')
const db = require('./db')
const stripe = require('./routes/stripe').production
const WrappedSchema = makeWrapResolversPlugin({
  Mutation:{
      createRefundRequest:{
          async resolve(resolver, parent, args, context, _resolveInfo) {
           const refundRequest = await resolver()
           try{
               const user = await db.getUser(context.jwtClaims.id)
               mailer.accountAction(process.env.ADMIN_EMAIL, {message:`User ${user.first_name} ${user.last_name} has requested a refund.`})
           }catch(error){
               //do nothing
           }
           return refundRequest
         }
     },
     createEventRequest:{
         async resolve(resolver, parent, args, context, _resolveInfo) {
          const eventRequest = await resolver()
          try{
              const user = await db.getUser(context.jwtClaims.id)
              mailer.accountAction(process.env.ADMIN_EMAIL, {message:`User ${user.first_name} ${user.last_name} has requested a private event.`})
          }catch(error){
              //do nothing
          }
          return eventRequest
        }
    },
    registerUser:{
        async resolve(resolver, parent, args, context, _resolveInfo) {
         const user = await resolver()
         stripe.createCustomer(user.data['@user'].id)
         return user
       }
   },
   updateEventRequestById:{
       async resolve(resolver, parent, args, context, _resolveInfo) {
        const resolverData = await resolver()
        try{
            const eventRequest = resolverData.data['@eventRequest']
            const user = await db.getUser(eventRequest.userId)
            mailer.eventRequest(user.email, eventRequest.status, eventRequest.accessToken, user.first_name)
        }catch(error){
            //do nothing
        }
        return resolverData
      }
   }
  }
})

module.exports = WrappedSchema
