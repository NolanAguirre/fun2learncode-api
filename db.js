var express = require('express');
var pgp = require('pg-promise')( /*options*/ )
pgp.pg.defaults.ssl = true;
var database = pgp(process.env.DATABASE_URL);
var db = {};

db.authenticate = (email, password) => {
    return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}

db.getRegistrationData = (students, addons, dateGroup, event, promoCode, date) => {
    let dateGroups = [];
    let promises = [];

    students.forEach(student=>dateGroups.push({student, dateGroup}))

    promises.push(
        database.oneOrNone('SELECT * FROM ftlc.events WHERE id = $1 AND open_registration < $2 AND $2 < close_registration', [event, date])
            .then((data)=>{
                return {event:data};
            })
    )

    promises.push(
        database.oneOrNone('SELECT * FROM ftlc.date_group WHERE id = $1 AND open_registration < $2 AND $2 < close_registration', [dateGroup, date])
            .then((data)=>{
                return {dateGroup:data};
            })
    )

    dateGroups.forEach((dg)=>{
        promises.push(
            database.one('SELECT ftlc.check_prerequisites($1, $2)', [dg.dateGroup, dg.student]).then(data=>{
                return {[dg.student]:data.check_prerequisites}
            })
        )
    })

    promises.push(
        database.any('SELECT * FROM ftlc.add_ons WHERE id IN(SELECT add_on FROM ftlc.add_on_join WHERE date_group = $1 AND add_on = ANY(ARRAY[$2:list]::UUID[]));', [dateGroup, addons])
            .then((data)=>{
                return {addons:data};
            })
    )

    promises.push(
        database.any('SELECT * FROM ftlc.students WHERE id = ANY(ARRAY[$1:list]::UUID[]);', [students])
            .then((data)=>{
                return {students:data};
            })
    )

    return Promise.all(promises).then((data)=>{
        let returnVal = {}
        data.forEach((obj)=>{
            let key = Object.keys(obj)[0]
            returnVal[key] = obj[key]
        })
        return returnVal;
    })
}

db.storePayment = (user, snapshot) => {
    return database.one('INSERT INTO ftlc.payment(user_id, status, snapshot) VALUES ($1, $2, $3:json) RETURNING id', [user.id, 'paid', snapshot])
}

db.createEventRegistration = (user, info, payment) => {
    let promises = [];

    info.students.forEach((student)=>{
        promises.push(
            database.none('INSERT INTO ftlc.event_registration(registered_by, student, date_group, payment) VAlUES ($1, $2, $3, $4)', [user.id, student.id, info.dateGroup.id, payment.id])
        )
    })
    return Promise.all(promises)
}


module.exports = db;
