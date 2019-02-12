var pgp = require('pg-promise')(/* options */)
const query = require('./query')
pgp.pg.defaults.ssl = true
var database = pgp(process.env.DATABASE_URL)
var db = {}

db.authenticate = (email, password) => {
  return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
}

db.transactionIsProcessing = (user) => {
  return database.one('SELECT EXISTS(SELECT 1 FROM ftlc.transaction_state WHERE user_id = $1 AND processing = true)', [user])
    .then((data) => data.exists)
}

db.storeTransaction = (user, info) => {
  return database.oneOrNone('SELECT ftlc.store_transaction ($1, $2:json)', [user, info])
}

db.startTransaction = (user) => {
  return database.one('UPDATE ftlc.transaction_state SET processing = true WHERE user_id = $1 AND processing = false RETURNING transaction', [user])
    .then(data => data.transaction)
}

db.endTransaction = (user) => {
  return database.none('DELETE FROM ftlc.transaction_state WHERE user_id = $1', [user])
}

db.getRegistrationData = ({ students, addons, event, promoCode, user }, date) => {
  let events = []
  let promises = []

  students.forEach(student => events.push({ student, event }))
  promises.push(
    database.any('SELECT first_name, last_name, id FROM ftlc.student WHERE id = ANY(ARRAY[$1:list]::UUID[]) AND parent = $2', [students, user])
      .then((data) => {
        return { _students: data }
      })
  )

  promises.push(
    database.oneOrNone(query.promoCode, [date, promoCode, event, user])
      .then((data) => {
        return { _promoCode: data }
      })
  )
  promises.push(
    database.oneOrNone('SELECT * FROM ftlc.event WHERE open_registration < $1 AND $1 < close_registration AND id = $2 AND seats_left >= $3', [date, event, students.length])
      .then((data) => {
        return { _event: data }
      })
  )

  promises.push(
    database.any('SELECT description, price, name FROM ftlc.add_on WHERE id IN (SELECT add_on FROM ftlc.add_on_join WHERE event = $2 AND add_on = ANY(ARRAY[$1:list]::UUID[]))', [addons, event])
      .then((data) => {
        return { _addons: data }
      })
  )

  promises.push(
    database.any('SELECT * FROM ftlc.registration_override WHERE student = ANY(ARRAY[$1:list]::UUID[]) AND event = $2', [students, event])
      .then((data) => {
        return { _overrides: data }
      })
  )

  promises.push(
    database.one('SELECT name FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $1)', [event])
      .then((data) => {
        return { _activity: data }
      })
  )

  events.forEach((element) => {
    promises.push(
      database.one('SELECT ftlc.check_prerequisite($1, $2), ftlc.check_registration($1, $2), ftlc.check_time($1,$2), ftlc.check_waiver($2)', [element.event, element.student]).then(data => {
        return { [element.student]: data}
      })
    )
  })

  return Promise.all(promises).then((data) => {
    let returnVal = {}
    data.forEach((obj) => {
      let key = Object.keys(obj)[0]
      returnVal[key] = obj[key]
    })
    return returnVal
  })
}

db.createEventRegistration = (user, students, event, payment) => {
  let promises = []
  students.forEach((student) => {
    promises.push(
      database.none('INSERT INTO ftlc.event_registration(registered_by, student, event, payment) VAlUES ($1, $2, $3, $4)', [user, student.id, event, payment])
    )
  })
  promises.push(
    database.none('UPDATE ftlc.event SET seats_left = seats_left - $1 WHERE id = $2', [students.length, event])
  )

  return Promise.all(promises)
}

db.storePayment = (user, snapshot, charge) => {
  if (snapshot._promoCode) {
    const id = snapshot._promoCode.id
    database.none('INSERT INTO ftlc.promo_code_use (user_id, promo_code) VALUES ($1, $2)', [user, id])
    database.none('UPDATE ftlc.promo_code SET uses = uses - $1 WHERE id = $2', [1, id])
  }
  return database.one('INSERT INTO ftlc.payment(user_id, snapshot, charge) VALUES ($1, $2:json, $3:json) RETURNING id', [user, snapshot, charge])
    .then(data => data.id)
}

db.processRefund = (payment, refund, unregister, reason) => {
  const id = payment.id
  let promises = []
  promises.push(database.none('UPDATE ftlc.payment SET refund = $1, status = $2 WHERE id = $3', [refund, 'refund', id]))
  promises.push(database.none('UPDATE ftlc.refund_request SET status = $1, amount_refunded = $2, granted_reason = $3 WHERE payment = $4', ['accepted', refund.amount / 100, reason, id]))
  if (unregister) {
    promises.push(database.none('DELETE FROM ftlc.event_registration WHERE payment = $1', [id]))
    promises.push(database.none('UPDATE ftlc.event SET seats_left = seats_left + $1 WHERE id = ANY(SELECT event FROM ftlc.event_registration WHERE payment = $2)', [payment.snapshot._students.length, id]))
  }
  return Promise.all(promises)
}

db.getPayment = (id) => {
  return database.one('SELECT * FROM ftlc.payment WHERE id = $1', [id])
}

db.genTemporaryToken = (email) => {
  return database.any('(SELECT first_name FROM ftlc.users WHERE email = $1) UNION (SELECT ftlc.generate_password_token($1))', [email])
}

module.exports = db
