const authenticate = require('../../routes/authenticate').test;
const {emails, passwords} = require('../data')

module.exports = {
    describe:'Authenticate',
    process: (describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                test(obj.describe, async ()=>{
                    const data = await authenticate(obj.data)
                    return obj.test(expect, data)
                })
            })
        })
    },
    data:[
        {
            describe:'pass, valid email and password',
            data:{email:emails.valid,password:passwords.valid},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).not.toBe(null)}
        },{
            describe:'fail, invalid password',
            data:{email:emails.valid,password:passwords.invalid},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Email or Password was incorrect.')}
        },{
            describe:'fail, invalid email',
            data:{email:emails.invalid,password:passwords.valid},
            test: (expect, data)=>{return expect(data[Object.keys(data)[0]]).toBe('Email or Password was incorrect.')}
        }
    ]
}
