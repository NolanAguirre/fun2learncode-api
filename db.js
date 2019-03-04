const pgp = require('pg-promise')(/* options */)
const query = require('./query')
pgp.pg.defaults.ssl = true
var database = pgp(process.env.DATABASE_URL)
var db = {}
//handle error messages here
db.authenticate = (email, password) => {
  return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password]).catch((error)=>{
    console.log(error)
    throw new Error('Cannot connect to the database.')
  })
}

db.transactionIsProcessing = (user) => {
  return database.none('SELECT * FROM ftlc.transaction_state WHERE user_id = $1 AND processing = true', [user]).catch((error)=>{
    console.log(error)
    throw new Error('Transaction is already being processed')
})
}

db.storeTransaction = (user, info) => {
  return database.oneOrNone('SELECT ftlc.store_transaction ($1, $2:json)', [user, info]).catch((error)=>{
    console.log(error)
    throw new Error('Error occured while storing transaction data')
  })
}

db.startTransaction = (user) => {
  return database.one('UPDATE ftlc.transaction_state SET processing = true WHERE user_id = $1 AND processing = false RETURNING transaction', [user])
    .then(data => data.transaction).catch((error)=>{
      console.log(error)
      throw new Error('Error storing transaction state.')
    })
}

db.endTransaction = (user) => {
  return database.none('DELETE FROM ftlc.transaction_state WHERE user_id = $1', [user]).catch((error)=>{
    console.log(error)
    throw new Error('Error ending transaction, transactions from this accound cannot be processed.')
  })
}

db.getRegistrationData = ({ students, addons, event, promoCode, user }, date) => {
  let events = []
  let promises = []

  students.forEach(student => events.push({ student, event }))
  promises.push(
    database.many('SELECT first_name, last_name, id FROM ftlc.student WHERE id = ANY(ARRAY[$1:list]::UUID[]) AND parent = $2', [students, user])
      .then((data) => {
        return { _students: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('No students found.')
      })
  )

  promises.push(
    database.one(query.promoCode, [date, promoCode, event, user])
      .then((data) => {
        return { _promoCode: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('Promo code is not valid.')
      })
  )
  promises.push(
    //SELECT * FROM ftlc.event WHERE open_registration < $1 AND $1 < close_registration AND id = $2 AND seats_left >= $3
    database.oneOrNone(query.hiddenEvent, [date, event, students.length])
      .then((data) => {
        return { _event: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('No valid event found.')
      })
  )

  promises.push(
    database.any('SELECT description, price, name FROM ftlc.add_on WHERE id IN (SELECT add_on FROM ftlc.add_on_join WHERE event = $2 AND add_on = ANY(ARRAY[$1:list]::UUID[]))', [addons, event])
      .then((data) => {
        return { _addons: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('Cannot connect to the database.')
      })
  )

  promises.push(
    database.any('SELECT * FROM ftlc.registration_override WHERE student = ANY(ARRAY[$1:list]::UUID[]) AND event = $2 AND valid_end > NOW()', [students, event])
      .then((data) => {
        return { _overrides: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('Cannot connect to the database.')
      })
  )

  promises.push(
    database.one('SELECT name FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $1)', [event])
      .then((data) => {
        return { _activity: data }
      }).catch((error)=>{
        console.log(error)
        throw new Error('Cannot find activity.')
      })
  )
  events.forEach((element) => {
    promises.push(
      database.one('SELECT ftlc.check_prerequisite($1, $2), ftlc.check_registration($1, $2), ftlc.check_time($1,$2), ftlc.check_waiver($2)', [element.event, element.student]).then(data => {
        return { [element.student]: data}
      }).catch((error)=>{
        console.log(error)
        throw new Error('Cannot connect to the database.')
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
      database.none('INSERT INTO ftlc.event_registration(registered_by, student, event, payment) VAlUES ($1, $2, $3, $4)', [user, student.id, event, payment]).catch((error)=>{
        console.log(error)
        throw new Error('Failed to create event registration, request help.')
    })
    )
  })
  promises.push(
    database.none('UPDATE ftlc.event SET seats_left = seats_left - $1 WHERE id = $2', [students.length, event]).catch((error)=>{
      console.log(error)
      throw new Error('Failed to update seats left')
    })
  )

  return Promise.all(promises)
}

db.storePayment = (user, snapshot, charge) => {
  if (snapshot._promoCode) { //its fine if this stuff fails.
    const id = snapshot._promoCode.id
    database.none('INSERT INTO ftlc.promo_code_use (user_id, promo_code) VALUES ($1, $2)', [user, id]).catch((error)=>{
      console.log(error)
      throw new Error('Cannot connect to the database.')
    })
    database.none('UPDATE ftlc.promo_code SET uses = uses - $1 WHERE id = $2', [1, id]).catch((error)=>{
      console.log(error)
      throw new Error('Cannot connect to the database.')
    })
  }
  return database.one('INSERT INTO ftlc.payment(user_id, snapshot, charge) VALUES ($1, $2:json, $3:json) RETURNING id', [user, snapshot, charge]).catch(defaultCatch)
    .then(data => data.id).catch((error)=>{
      console.log(error)
      throw new Error('Failed to store payment info.')
    })
}

db.processRefund = (payment, refund, unregister, reason) => {
  const id = payment.id
  let promises = []
  promises.push(database.none('UPDATE ftlc.payment SET refund = $1, status = $2 WHERE id = $3', [refund, 'refund', id])).catch((error)=>{
    console.log(error)
    throw new Error('could not update payment to refund.')
  })
  promises.push(database.none('UPDATE ftlc.refund_request SET status = $1, amount_refunded = $2, granted_reason = $3 WHERE payment = $4', ['accepted', refund.amount / 100, reason, id])).catch((error)=>{
    console.log(error)
    throw new Error('failed to update refund request')
  })
  if (unregister) {
    promises.push(database.none('DELETE FROM ftlc.event_registration WHERE payment = $1', [id])).catch((error)=>{
      console.log(error)
      throw new Error('failed to delete event registration')
    })
    promises.push(database.none('UPDATE ftlc.event SET seats_left = seats_left + $1 WHERE id = ANY(SELECT event FROM ftlc.event_registration WHERE payment = $2)', [payment.snapshot._students.length, id])).catch((error)=>{
      console.log(error)
      throw new Error('failed to restore seat to event.')
    })
  }
  return Promise.all(promises)
}

db.getPayment = (id) => {
  return database.one('SELECT * FROM ftlc.payment WHERE id = $1', [id]).catch((error)=>{
    console.log(error)
    throw new Error('could not find payment')
  })
}

db.genTemporaryToken = (email) => {
  return database.any('(SELECT first_name FROM ftlc.users WHERE email = $1) UNION (SELECT ftlc.generate_password_token($1))', [email]).catch((error)=>{
    console.log(error)
    throw new Error('cannot generate password token.')
  })
}

db.getMailingList = () => {
    return database.many('SELECT email FROM ftlc.news_letter').catch(defaultCatch).catch((error)=>{
      console.log(error)
      throw new Error('Cannot query mailing list')
    })
}

module.exports = db
