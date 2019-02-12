var pgp = require('pg-promise')()
pgp.pg.defaults.ssl = true
const fs = require('fs')
let database = pgp('postgres://nolan:pettertheduck@localhost:5432/fun2learncode')
const addData = async function (json) {
  for (var item in json.data) {
    let data = await database.one(json.query, Object.values(json.data[item]))
    json.data[item].id = data.id
  }
}
async function populateDatabse () {
  let users = JSON.parse(fs.readFileSync('sqitch/data/users.json', 'utf8'))
  let admins = JSON.parse(fs.readFileSync('sqitch/data/admins.json', 'utf8'))
  let addresses = JSON.parse(fs.readFileSync('sqitch/data/address.json', 'utf8'))
  let category = JSON.parse(fs.readFileSync('sqitch/data/category.json', 'utf8'))
  await addData(admins)
  await addData(users)
  await addData(addresses)
  await addData(category)
  console.log('database has been populated')
}
populateDatabse()
