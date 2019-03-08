const refund = require('../../routes/refundTransaction').test
const {emails} = require('../data')

module.exports = {
    describe:'Refund',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await refund(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data:[
    ]
}
