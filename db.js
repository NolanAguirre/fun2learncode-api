var express = require('express');
var pgp = require('pg-promise')( /*options*/ )
pgp.pg.defaults.ssl = true;
var database = pgp(process.env.DATABASE_URL);
var db = {};

db.authenticate = (email, password) => {
    return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}

db.validateRegistration = (students, addons, dateGroup) => {
    let dateGroups = [];
    students.forEach(student=>dateGroup.push({student:student.id, dateGroup:dateGroup}))

    return database.many('SELECT price, id FROM ftlc.add_ons WHERE id IN(SELECT add_on FROM ftlc.add_on_join WHERE date_group = $1 AND add_on = ANY(ARRAY[$2:list]::UUID[]));', [dateGroup, addons.map(addon=>addon.id)])
            .then((res)=>{
                console.log(res)
            })
}

db.storePayment = () => {

}


module.exports = db;
