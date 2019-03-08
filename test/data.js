const begin = require('../routes/beginTransaction').test;
const authenticate = require('../routes/authenticate').test;
const recover = require('../routes/recover').test;
const info = require('./info')
const event = require('./event.test')
const override = require('./override.test')
const privateEvent = require('./private.test')
const addon = require('./addon.test')
const code = require('./code.test')
const student = require('./student.test')
const mailing = require('./mailing.test')
const process = require('./process.test')
module.exports = [
    process,
    {
        describe:'Login test',
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
                describe:'successful',
                data:{email:'bobby7083@gmail',password:'password'},
                test: (expect, data)=>{return expect(data.auth).not.toBe(null)}
            },{
                describe:'incorrect password',
                data:{email:'bobby7083@gmail.com',password:'thisissparta'},
                test: (expect, data)=>{return expect(data.error).toBe('Email or Password was incorrect.')}
            },{
                describe:'incorrect email',
                data:{email:'bobby703@gmail.com',password:'thisissparta'},
                test: (expect, data)=>{return expect(data.error).toBe('Email or Password was incorrect.')}
            }
        ]
    },
    {
        describe:'begin transaction test',
        process: (describe, test, expect, item)=>{
            describe(item.describe, ()=>{
                item.data.forEach((obj)=>{
                    obj.process(describe, test, expect, obj)
                })
            })
        },
        data:[
            event,
            override,
            privateEvent,
            addon,
            code,
            student
        ]
    },
    mailing,
    {
        describe:'recover email test',
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
                describe:'email not a users email',
                data:{email:'bobby@gmail.com'},
                test: (expect, data)=>{return expect(data.error).toBe('No user with provided email found.')}
            }

            // ,{ THIS ONE SENDS EMAILS
            //     describe:'email sent',
            //     data:{email:'bobby7083@gmail.com'},
            //     test: (expect, data)=>{return expect(data.message).toBe('An email has been sent to bobby7083@gmail.com with furthur instructions.')}
            // }
        ]
    }
]
