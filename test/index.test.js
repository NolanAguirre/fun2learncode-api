require('dotenv').config()
const authenticate = require('./authenticate/authenticate.test')
const begin = require('./begin/begin.test')
const mailing = require('./mailing/mailing.test')
const process = require('./process/process.test')
const recover = require('./recover/recover.test')
const refund = require('./refund/refund.test')
const integration = require('./integration.test')
const units = [
    process,
    begin,
    refund,
    authenticate,
    mailing,
    recover,
    integration
]
describe('Entire website test', () => {
    units.forEach((item)=>{
        item.process(describe, test, expect, item)
    })
})
