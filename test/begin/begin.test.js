const event = require('./event.test')
const addon = require('./addon.test')
const code = require('./code.test')
const override = require('./override.test')
const privateEvent = require('./private.test')
const student = require('./student.test')

module.exports = {
    describe:'Begin transaction',
    process: (describe, test, expect, item)=>{
        describe(item.describe, ()=>{
            item.data.forEach((obj)=>{
                obj.process(describe, test, expect, obj)
            })
        })
    },
    data:[
        override,
        privateEvent,
        addon,
        code,
        student,
        event
    ]
}
