require('dotenv').config()
const authenticate = require('./authenticate/authenticate.test')
const begin = require('./begin/begin.test')
const mailing = require('./mailing/mailing.test')
const processTransaction = require('./process/process.test')
const recover = require('./recover/recover.test')
const refund = require('./refund/refund.test')
const integration = require('./integration.test')
const { execSync } = require('child_process')
const database = require('../db')
const units = [
    //processTransaction,
    begin,
    refund,
    authenticate,
    //mailing,
    recover
]
jest.setTimeout(3000);
describe('Entire website test', () => {
    beforeAll(() => {
        const db =`${process.env.DATABASE_URL}`
        execSync(`pg_dump -n ftlc -n ftlc_private --clean -d ${db} -f temp.sql`)
        execSync(`psql -d ${db} -f testData.sql`)
        return
    })
    afterAll(() => {
        const db =`${process.env.DATABASE_URL}`
        // execSync(`pg_dump -n ftlc -n ftlc_private --clean -d ${db} -f afterTest.sql`)
        execSync(`psql -d ${db} -f temp.sql`)
        execSync(`rm temp.sql`)
        database.database.$pool.end()
        return
    })
    units.forEach((item)=>{
        item()
    })
})
