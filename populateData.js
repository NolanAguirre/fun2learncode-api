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
    let student = JSON.parse(fs.readFileSync('sqitch/data/student.json', 'utf8'));
    let instructor = JSON.parse(fs.readFileSync('sqitch/data/instructor.json', 'utf8'));
    let students = JSON.parse(fs.readFileSync('sqitch/data/students.json', 'utf8'));
    let addresses = JSON.parse(fs.readFileSync('sqitch/data/address.json', 'utf8'));
    let activity_catagories = JSON.parse(fs.readFileSync('sqitch/data/activity_catagories.json', 'utf8'));
    let activities = JSON.parse(fs.readFileSync('sqitch/data/activities.json', 'utf8'));
    let events = JSON.parse(fs.readFileSync('sqitch/data/events.json', 'utf8'));
    let event_dates = JSON.parse(fs.readFileSync('sqitch/data/event_dates.json', 'utf8'));
    let event_registration = JSON.parse(fs.readFileSync('sqitch/data/event_registration.json', 'utf8'));
    let event_logs = JSON.parse(fs.readFileSync('sqitch/data/event_logs.json', 'utf8'));

    function randomItem(data) {
        return data[Math.floor(Math.random() * data.length)];
    }
    await addData(users);
    await addData(student);
    await addData(instructor);
    student.data.forEach((element) => {
        students.data.push({
            student: element.id,
            parent: randomItem(users.data).id
        })
    })
    await addData(students);
    await addData(addresses);
    await addData(activity_catagories);
    activities.data.map((element) => {
        element.type = activity_catagories.data.filter((el) => {
            return element.type == el.name;
        })[0].id;
        return element;
    });
    await addData(activities);
    events.data.map((element) => {
        element.event_type = randomItem(activities.data).id;
        element.address = randomItem(addresses.data).id;
        return element;
    })
    await addData(events);
    events.data.forEach((element)=>{
        let temp = {};
        temp.start_date = new Date(+new Date() + Math.floor(Math.random() * 5629740000));
        temp.end_date = new Date(+temp.start_date + Math.floor(Math.random() * 629740000));
        temp.event = element.id;
        event_dates.data.push(temp);
    })
    await addData(event_dates)
    students.data.forEach((element) => {
        //let random = Math.floor(Math.random() * 10) + 1;
        //for (let x = 0; x < random; x++) {
            let temp = {};
            temp.student = element.id;
            temp.event_date = randomItem(event_dates.data).id;
            event_registration.data.push(temp)
        //}
    })
    await addData(event_registration)
    event_registration.data.forEach((element) => {
        let temp = {};
        temp.student = element.student;
        temp.event_date = element.event_date;
        temp.instructor = randomItem(instructor.data).id;
        temp.comment = "Completed level 3 of the game";
        event_logs.data.push(temp);
    })
    await addData(event_logs);
    console.log("database has been populated")
}
populateDatabse();
