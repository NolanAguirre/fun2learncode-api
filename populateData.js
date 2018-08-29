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
    let users_private = JSON.parse(fs.readFileSync('sqitch/data/user_private.json', 'utf8'));
    let students = JSON.parse(fs.readFileSync('sqitch/data/students.json', 'utf8'));
    let addresses = JSON.parse(fs.readFileSync('sqitch/data/address.json', 'utf8'));
    let activities = JSON.parse(fs.readFileSync('sqitch/data/activities.json', 'utf8'));
    let events = JSON.parse(fs.readFileSync('sqitch/data/events.json', 'utf8'));
    let event_dates = JSON.parse(fs.readFileSync('sqitch/data/event_dates.json', 'utf8'));
    function randomItem(data){
        return data[Math.floor(Math.random() * data.length)];
    }
    await addData(users);
    users_private.data.map((user, index) => {
        user.user_id = users.data[index].id;
        return user;
    })
    await addData(users_private);
    let studentids = users.data.filter((user) => {
        return user.role == 'ftlc_student'
    }).map((data) => {
        return data.id
    })
    let userids = users.data.filter((user) => {
        return user.role == 'ftlc_user'
    }).map((data) => {
        return data.id
    })
    studentids.forEach((element) => {
        students.data.push({
            student: element,
            parent: randomItem(userids)
        })
    })
    await addData(students);
    await addData(addresses);
    await addData(activities);
    events.data.map((element) => {
        element.event_type = randomItem(activities.data).id;
        element.address = randomItem(addresses.data).id;
    })
    await addData(events);
    for(let x = 0; x < 1000; x++){
        let temp = {};
        temp.start_date = new Date(+new Date() + Math.floor(Math.random()*5629740000));
        temp.end_date = new Date(+temp.start_date +  Math.floor(Math.random()*629740000));
        temp.event = randomItem(events.data).id;
        event_dates.data.push(temp);
    }
    await addData(event_dates)
}
populateDatabse();
