const stripe = require('stripe')(process.env.STRIPE_TOKEN)
const router = express.Router()

const createCustomer = async (id) => {
    const user = await db.getStripeUser(id);
    if(!user.stripe_id){
        return await stripe.customers.create({
            description: 'Customer',
            email: user.email
        }).then((customer)=>{
            await db.addStripeUser(id);
        })
    }else{
        return {error:'Custom for your account already exisits.'}
    }
}

const addCard = (id, cardInfo, default) => {
    const user = await db.getStripeUser(id)
    if(user.stripe_id){
        const card = await stripe.customers.createSource(user.stripe_id,{ source: cardInfo }).then(()=>{

        })
        if(default && card){
            stripe.customers.update(user.stripe_id,{default_source:card.id}).then((res)=>{
                //idk what to do here
            })
        }
    }
}

const deleteCard = (id, cardInfo) => {
    const user = await db.getStripeUser(id)
    if(user.stripe_id){
        const card = stripe.customers.listCards(user.stripe_id)
            .then((res)=>{
                return res.data.filter((card)=>{
                    return card.last4 === cardInfo.last4 &&
                        card.brand === cardInfo.brand &&
                        card.exp_month === cardInfo.exp_month &&
                        card.exp_year === cardInfo.exp_year
                })[0]
            })
        if(card){
            return await stripe.customers.deleteCard(user.stripe_id, card.id).then((res)=>{
                if(res.deleted){
                    return {message:'Card has been successfully deleted.'}
                }else{
                    return{message:'Something happened, card not deleted.'}
                }
            }).catch((error)=>{
                return {error:'Stripe error occured' + error.message}
            })
        }
    }else{
        return {error:'No user found'}
    }

}

const setDefault = (id, cardInfo) => {
    const user = await db.getStripeUser(id)
    if(user.stripe_id){
        stripe.customers.update(user.stripe_id,{default_source:cardInfo}).then((res)=>{
            //idk what to do here
        })
    }
}

const chargeCard = (id, token, total, saveCard) => {
    return stripe.charges.create({
             amount: total * 100,
             currency: 'usd',
             description: 'Fun 2 Learn Code Event',
             source: token,
             statement_descriptor: 'Fun 2 Learn Code Event'
         })
}


const chargeCustomer = (id) => {
    const user = await db.getStripeUser(id)
    return stripe.charges.create({
             amount: total * 100,
             currency: 'usd',
             description: 'Fun 2 Learn Code Event',
             customer: user.stripe_id,
             statement_descriptor: 'Fun 2 Learn Code Event'
         })
}

const getUserCards= (id) => {
    const user = await db.getStripeUser(id)
    return stripe.customers.listCards(user.stripe_id)
}

if(!process.env.TEST){
    router.post('/create-customer', async (req, res) => {
        res.json(await createCustomer(req.body.user))
    })
    router.post('/add-card', (req, res) => {
        if(req.body.cardInfo){
            res.json(await addCard(req.body.user, req.body.cardInfo, req.body.default))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/delete-card', (req, res) => {
        if(req.body.cardInfo){
            res.json(await deleteCard(req.body.user, req.body.cardInfo))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/set-default', (req, res) => {
        if(req.body.cardInfo){
            res.json(await setDefault(req.body.user, req.body.cardInfo))
        } else {
            res.json({error:'No card information provided'})
        }
    })
    router.post('/user-info', (req, res) => {
        res.json(await getUserCards(req.body.user))
    })
}


module.exports = {
    production: router,
    test:{
        createCustomer,
        addCard,
        deleteCard,
        setDefault,
        chargeCard,
        chargeCustomer,
        getUserCards
    }
}
