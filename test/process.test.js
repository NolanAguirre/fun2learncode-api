const process = require('../routes/processTransaction').test;
const info = require('./info')

//TEST NEEDED FOR SECOND PERSON TO REGISTER FOR PRIVATE EVENT
module.exports = {
    describe:'Private Event test',
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
    data: info.stripeToken.fail.map((token)=>{
        return{
            describe:`invalid, transaction fail ${token}` ,
            data:{"user":info.users.other, token},
            test: (expect, data)=>{return expect(data.error).toContain("Stripe error while processing card.")}
        }
    })
}
