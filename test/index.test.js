require('dotenv').config()
const foo = require('./data.js')

describe('Entire website test', () => {
    foo.forEach((item)=>{
        item.process(describe, test, expect, item)
    })
})
