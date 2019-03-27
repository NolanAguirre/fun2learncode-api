const refund = require('../../routes/refundTransaction').test
const {emails} = require('../data')

module.exports = () => {
    describe('Refund', () => {
        test('No test', () => {
            // const data = await refund(obj.data)
            return expect(1).toBe(1)
        })
    })
}
