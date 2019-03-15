const process = require('../../routes/processTransaction').test;
const {users, stripeTokens} = require('../data')

//TEST NEEDED FOR SECOND PERSON TO REGISTER FOR PRIVATE EVENT
module.exports = {
    describe:'Process transaction',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await process(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data: stripeTokens.fail.map((token)=>{
        return{
            describe:`invalid, transaction fail ${token}` ,
            data:{"user":users.other, token},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toContain("Stripe error while processing card.")}
        }
    })
}
