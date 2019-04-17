const { makeExtendSchemaPlugin, gql } = require("graphile-utils")

const routes = {
    begin: require('./routes/beginTransaction').production,
    process: require('./routes/processTransaction').production,
    refund: require('./routes/refundTransaction').production,
    stripe: require('./routes/stripe').production,
    newsLetter: require('./routes/newsLetter').production
}
// context.jwtClaims:
// {
//   aud: 'postgraphile',
//   role: 'ftlc_user',
//   id: '702651ae-0036-448e-bd7c-b9e6489bf822',
//   expires_at: 1556045060
// }



const SchemaExtension = makeExtendSchemaPlugin(build => ({
  typeDefs: gql`
    input CreditCardInput{
        last4:String!
        exp_month:Int!
        exp_year:Int!
        brand:String!
    }
    type CreditCard{
        last4:String!
        exp_month:Int!
        exp_year:Int!
        brand:String!
        id:String!
    }
    extend type Query{
        allCreditCards:[CreditCard]
    }
    extend type Mutation {
      subscribToMailingList(email:String!):Boolean!
      accountAction:Boolean!
      beginTransaction(event:UUID!, students:[UUID]!, addons:[UUID], promoCode:String):Int!
      processTransaction(input:CreditCardInput, token:String):UUID!
      refundTransaction(grantedReason:String!, paymentId:UUID!, amount:Float!, unregister:Boolean!, grant:Boolean!):UUID!
      addCreditCard(input:CreditCardInput!, token:String!):CreditCard!
      deleteCreditCard(input:CreditCardInput!):CreditCard!
    }
  `,
  resolvers: {
    Query:{
        allCreditCards: async (parent, args, context, resolveInfo) => {
            if(context.jwtClaims.id){
                return await routes.stripe.getUserCards(context.jwtClaims.id)
            }else{
                throw new Error('Not authorized.')
            }
        },
    },
    Mutation: {
      subscribToMailingList: async (parent, args, context, resolveInfo) => {
        return await routes.newsLetter(args.email)
      },
      beginTransaction: async (parent, args, context, resolveInfo) => {
          if(context.jwtClaims.id){
              return await routes.begin({user:context.jwtClaims.id, ...args})
          }else{
              throw new Error('Not authorized.')
          }
         console.log(context.jwtClaims.user)
      },
      processTransaction: async (parent, args, context, resolveInfo) => {
          if(context.jwtClaims.id){
               return await routes.process({user:context.jwtClaims.id, paymentItem:args})
          }else{
              throw new Error('Not authorized.')
          }
      },
      accountAction: async (parent, args, context, resolveInfo) => {
          console.log(context.jwtClaims.user)
          throw new Error('Its all broken')
          return 'workning' + args.email;
      },
      refundTransaction: async (parent, args, context, resolveInfo) => {
          if(context.jwtClaims.id && context.jwtClaims.role === 'ftlc_owner'){
              //{grantedReason, paymentId, amount, unregister, grant}
              return await routes.refund(args)
          }else{
              throw new Error('Not authorized.')
          }
      },
      addCreditCard: async (parent, args, context, resolveInfo) => {
          if(context.jwtClaims.id){
              return await routes.stripe.addCard(context.jwtClaims.id, args.token, args.input)
          }else{
              throw new Error('Not authorized.')
          }
      },
      deleteCreditCard: async (parent, args, context, resolveInfo) => {
          if(context.jwtClaims.id){
              return await routes.stripe.deleteCard(context.jwtClaims.id, args.input)
          }else{
              throw new Error('Not authorized.')
          }
      }
    },
  },
}));

module.exports = SchemaExtension
