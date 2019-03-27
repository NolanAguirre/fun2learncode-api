const authenticate = require('../../routes/authenticate').test;
const {emails, passwords} = require('../data')

module.exports = () => {
    describe('Authenticate', () => {
        test('Valid email and password', async () => {
            const data = await authenticate({email:emails.valid,password:passwords.valid})
            return expect(data[Object.keys(data)[0]]).not.toBe(null)
        })
        test('Invalid password', async () => {
            const data = await authenticate({email:emails.valid,password:passwords.invalid})
            return expect(data[Object.keys(data)[0]]).toBe('Email or Password was incorrect.')
        })
        test('Invalid email', async () => {
            const data = await authenticate({email:emails.invalid,password:passwords.valid})
            return expect(data[Object.keys(data)[0]]).toBe('Email or Password was incorrect.')
        })
    })
}
