const recover = require('../../routes/recover').test
const {emails} = require('../data')

module.exports = () => {
    describe('Recover password', () => {
        test('Email sent', async () => {
            const data = await recover({email:emails.valid})
            return expect(data[Object.keys(data)[0]]).toBe(`An email has been sent to ${emails.valid} with furthur instructions.`)
        })
        test('User not found', async () => {
            const data = await recover({email:emails.invalid})
            return expect(data[Object.keys(data)[0]]).toBe('No user with provided email found.')
        })
    })
}
