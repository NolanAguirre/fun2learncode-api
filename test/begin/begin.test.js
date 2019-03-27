const event = require('./event.test')
const addon = require('./addon.test')
const code = require('./code.test')
const override = require('./override.test')
const privateEvent = require('./private.test')
const student = require('./student.test')

const units = [
    event,
    addon,
    code,
    override,
    privateEvent,
    student
]

module.exports = () => {
    describe('Begin transaction', () => {
        units.forEach((unit)=>unit())
    })
}
