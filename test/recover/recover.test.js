const recover = require('../../routes/recover').test
const {emails} = require('../data')
module.exports = {
    describe:'Recover password',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await recover(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data:[
        {
            describe:'pass, email sent',
            data:{email:emails.valid},
            test: (expect, data)=>{return expect(data.message).toBe(`An email has been sent to ${emails.valid} with furthur instructions.`)}
        },{
            describe:'fail, email has no user',
            data:{email:emails.invalid},
            test: (expect, data)=>{return expect(data.error).toBe('No user with provided email found.')}
        }
    ]
}
