var express = require('express');
var pgp = require('pg-promise')();
pgp.pg.defaults.ssl = true;
const fs = require('fs');
let database = pgp("postgres://nolan:pettertheduck@localhost:5432/fun2learncode");
addData = async function(json) {
    for (var item in json.data) {
        let data = await database.one(json.query, Object.values(json.data[item]))
        json.data[item].id = data.id;
    }
}
async function populateDatabse() {
    let users = JSON.parse(fs.readFileSync('sqitch/data/users.json', 'utf8'));
    let admins = JSON.parse(fs.readFileSync('sqitch/data/admins.json', 'utf8'));
    let student = JSON.parse(fs.readFileSync('sqitch/data/student.json', 'utf8'));
    let students = JSON.parse(fs.readFileSync('sqitch/data/students.json', 'utf8'));
    let addresses = JSON.parse(fs.readFileSync('sqitch/data/address.json', 'utf8'));
    let activity_catagories = JSON.parse(fs.readFileSync('sqitch/data/activity_catagories.json', 'utf8'));
    function randomItem(data) {
        return data[Math.floor(Math.random() * data.length)];
    }
    await addData(admins);
    await addData(users);
    await addData(student);
    student.data.forEach((element) => {
        students.data.push({
            student: element.id,
            parent: randomItem(users.data).id
        })
    })
    await addData(students);
    await addData(addresses);
    await addData(activity_catagories);

    console.log("database has been populated")
}
populateDatabse();
