var express = require('express');
var pgp = require('pg-promise')( /*options*/ )
const query = require('./query')
pgp.pg.defaults.ssl = true;
var database = pgp(process.env.DATABASE_URL);
var db = {};

db.authenticate = (email, password) => {
    return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}

db.transactionIsProcessing = (user) => {
    return database.one('SELECT EXISTS(SELECT 1 FROM ftlc.transaction_state WHERE user_id = $1 AND processing = true)', [user])
        .then((data)=>data.exists)
}

db.storeTransaction = (user, info) => {
    return database.oneOrNone('SELECT ftlc.store_transaction ($1, $2)', [user, info])
}

db.endTransaction = (user) => {
    return database.none('DELETE FROM ftlc.transaction_state WHERE user_id = $1', [user])
}

db.getRegistrationData = ({students, addons, dateGroup, promoCode, user}, date) => {
    let dateGroups = [];
    let promises = [];

    students.forEach(student=>dateGroups.push({student, dateGroup}))
    promises.push(
        database.any('SELECT * FROM ftlc.students WHERE id = ANY(ARRAY[$1:list]::UUID[]) AND parent = $2', [students, user])
            .then((data)=>{
                return {Students:data}
            })
    )

    promises.push(
        database.oneOrNone(query.promoCode,[date, promoCode, dateGroup, user])
            .then((data)=>{
                return {PromoCode: data}
            })
    )
    promises.push(
        database.oneOrNone('SELECT * FROM ftlc.date_group WHERE open_registration < $1 AND $1 < close_registration AND id = $2 AND seats_left >= $3',[date, dateGroup, students.length])
            .then((data)=>{
                return {DateGroup: data}
            })
    )

    promises.push(
        database.any('SELECT * FROM ftlc.add_ons WHERE id = ANY(ARRAY[(SELECT add_on FROM ftlc.add_on_join WHERE date_group = $2 AND id = ANY(ARRAY[$1:list]::UUID[]))]::UUID[])', [addons, dateGroup])
            .then((data)=>{
                return {Addons: data}
            })
    )

    promises.push(
        database.any('SELECT * FROM ftlc.registration_override WHERE student = ANY(ARRAY[$1:list]::UUID[]) AND date_group = $2',[students, dateGroup])
            .then((data)=>{
                return {Overrides: data}
            })
    )


    dateGroups.forEach((dg)=>{
        promises.push(
            database.many('SELECT ftlc.check_prerequisites($1, $2), ftlc.check_registration($1, $2), ftlc.check_time($1,$2)', [dg.dateGroup, dg.student]).then(data=>{
                return {[dg.student]:data[0]}
            })
        )
    })

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

db.genTemporaryToken = (email) => {
    return database.any('(SELECT first_name FROM ftlc.users WHERE email = $1) UNION (SELECT ftlc.generate_password_token($1))', [email]);
}

module.exports = db;
