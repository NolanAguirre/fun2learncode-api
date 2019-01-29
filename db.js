var express = require('express');
var pgp = require('pg-promise')( /*options*/ )
pgp.pg.defaults.ssl = true;
var database = pgp(process.env.DATABASE_URL);
var db = {};

db.authenticate = (email, password) => {
    return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}

db.startTransaction = (user) => {
    return database.none('INSERT INTO ftlc.transaction_state (user_id) VALUES ($1)', [user])
}

db.endTransaction = (user) => {
    return database.none('DELETE FROM ftlc.transaction_state WHERE user_id = $1', [user])
}
db.getRegistrationData = (students, addons, dateGroup, event, promoCode, user, date) => {
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
        database.one('SELECT * FROM ftlc.users WHERE id = $1', [user])
            .then((data)=>{
                return {user:data}
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
            database.one('SELECT EXISTS(SELECT 1 FROM ftlc.event_registration WHERE date_group = $1 AND student = $2)', [dg.dateGroup, dg.student]).then(data=>{
                return {[dg.student+'Event']:data.exists}
            }) // TODO make sure youre not signed up for something in the same timeslot
        )
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
        database.any('SELECT * FROM ftlc.students WHERE id = ANY(ARRAY[$1:list]::UUID[]) AND parent = $2', [students, user])
            .then((data)=>{
                return {students:data};
            })
    )

    promises.push(
        database.one('SELECT * FROM ftlc.activities WHERE id = (SELECT event_type FROM ftlc.events WHERE id = $1)', [event])
            .then((data)=>{
                return {activity:data}
            })
    )

    promises.push(
        database.many('SELECT * FROM ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.dates_join WHERE date_group = $1)', [dateGroup])
            .then((data)=>{
                return {dates:data}
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
    promises.push(
        database.none('UPDATE ftlc.date_group SET seats_left = seats_left - $1 WHERE id = $2', [info.students.length, info.dateGroup.id])
    )

    return Promise.all(promises)
}

db.getPromoCode = (code) => {
    let date = new Date().toISOString();
    return database.oneOrNone('SELECT 1 FROM ftlc.promo_code WHERE code = $1 AND valid_start < $2 AND $2 < valid_end', [code, date])
}

db.genTemporaryToken = (email) => {
    return database.any('(SELECT first_name FROM ftlc.users WHERE email = $1) UNION (SELECT ftlc.generate_password_token($1))', [email]);
}
module.exports = db;
