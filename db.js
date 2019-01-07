var express = require('express');
var pgp = require('pg-promise')( /*options*/ )
pgp.pg.defaults.ssl = true;
var database = pgp(process.env.DATABASE_URL);
var db = {};

db.authenticate = function(email, password) {
    return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}
module.exports = db;
