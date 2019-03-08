const mailing = require('../../routes/mailing').test;
const defaultNewsLetter = require('../../emailTemplates/defaultNewsLetter')
module.exports = {
    describe:'News letter mailing',
    process:(describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await mailing(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data:[
        // {
        //     describe:'pass, mailing successful',
        //     data:{html:defaultNewsLetter('News Letter','This is a test newsletter')},
        //     test: (expect, data)=>{return expect(data.message).toBe("news letter sent")}
        // }
    ]
}
