require('dotenv').config()
const pgp = require('pg-promise')(/* options */)
const query = require('./query')
pgp.pg.defaults.ssl = true
const database = pgp(process.env.DATABASE_URL)
var db = {}
//handle error messages here
db.authenticate = (email, password) => {
  return database.one('select id, role, expires_at from ftlc.authenticate($1, $2)', [email, password])
            .catch((error)=>{throw new Error('Incorrect email or password.')})
}

db.transactionIsProcessing = (user) => {
  return database.none('SELECT * FROM ftlc.transaction_state WHERE user_id = $1 AND processing = true', [user])
            .catch((error)=>{throw new Error('Transaction is already being processed')})
}

db.storeTransaction = (user, info) => {
  return database.oneOrNone('SELECT ftlc.store_transaction ($1, $2:json)', [user, info])
            .catch((error)=>{throw new Error('Error occured while storing transaction data')})
}

db.startTransaction = (user) => {
  return database.one('UPDATE ftlc.transaction_state SET processing = true WHERE user_id = $1 AND processing = false RETURNING transaction', [user])
    .then(data => data.transaction)
    .catch((error)=>{throw new Error('Error accessing transaction data.')})
}

db.endTransaction = (user) => {
  return database.none('DELETE FROM ftlc.transaction_state WHERE user_id = $1', [user])
  .catch((error)=>{throw new Error('Error ending transaction, transactions from this accound cannot be processed.' + error.message)})
}

db.getRegistrationData = async ({students, addons, event, promoCode, user}, date) => {
  let events = []
  let promises = []

  const _event = await database.one(query.hiddenEvent, [date, event, students.length, user, students])
    .then(data => data)
    .catch(error => {throw new Error('No valid event found.')})

  students.forEach(student => events.push({student, _event}))

  promises.push(
    database.many('SELECT first_name, last_name, id FROM ftlc.student WHERE id = ANY(ARRAY[$1:list]::UUID[]) AND parent = $2', [students, user])
      .then(data => {return {_students: data}})
      .catch(error => {throw new Error('User attempted to register student who is not their own.')})
  )
  if (promoCode) {
    promises.push(
      database.one(query.promoCode, [date, promoCode, _event.id, user])
        .then(data => {return {_promoCode: data}})
        .catch(error => {throw new Error('Promo code is not valid.')})
    )
  }

  if (addons.length > 0) {
    promises.push(
      database.any('SELECT description, price, name FROM ftlc.add_on WHERE id IN (SELECT add_on FROM ftlc.add_on_join WHERE event = $2 AND add_on = ANY(ARRAY[$1:list]::UUID[]))',[addons, _event.id])
        .then(data => {return {_addons: data}})
        .catch(error => {throw new Error('Invalid add-on selection.')})
    )
  }

  promises.push(
    database.any('SELECT * FROM ftlc.registration_override WHERE student = ANY(ARRAY[$1:list]::UUID[]) AND event = $2 AND valid_end > NOW()', [students,_event.id])
      .then(data => {return {_overrides: data}})
      .catch(error => {throw new Error('Cannot connect to the database.')})
  )

  promises.push(
    database.one('SELECT name, category FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $1)', [_event.id])
      .then(data => {return {_activity: data}})
      .catch(error => {throw new Error('Cannot find activity.')})
  )

  promises.push(
      database.one('SELECT email FROM ftlc.users WHERE id = $1', [user])
      .then(data=>{return {_user:data}})
      .catch(error => {throw new Error('Cannot find users email.')})
  )

  events.forEach(element => {
    promises.push(
      database.one('SELECT ftlc.check_prerequisite($1, $2), ftlc.check_registration($1, $2), ftlc.check_time($1,$2), ftlc.check_waiver($2)', [element._event.id, element.student])
        .then(data => {return {[element.student]: data}})
        .catch(error =>{throw new Error('Cannot connect to the database.')})
    )
  })
  return Promise.all(promises).then(data => {
    let returnVal = {_addons: [], _event}
    data.forEach(obj => {
      let key = Object.keys(obj)[0]
      returnVal[key] = obj[key]
    })
    return returnVal
  })
}

db.createEventRegistration = (user, students, event, payment) => {
  return database.tx(t => {
        const registrations = students.map((student) => {
            return database.none('INSERT INTO ftlc.event_registration(registered_by, student, event, payment) VAlUES ($1, $2, $3, $4)', [user, student.id, event, payment])
        })
        const q1 = database.none('UPDATE ftlc.event SET seats_left = seats_left - $1 WHERE id = $2', [students.length, event])
        return t.batch([...registrations, q1]);
    }).then(data => {
        return data
    })
    .catch(error => {throw new Error('Error occured while creating event registration.' + error.message)});
}

db.storePayment = (user, snapshot, charge) => {
  if (snapshot._promoCode) { //its fine if this stuff fails.
    const id = snapshot._promoCode.id
    database.none('INSERT INTO ftlc.promo_code_use (user_id, promo_code) VALUES ($1, $2)', [user, id]).catch((error)=>{
      //console.log(error)
      throw new Error('Cannot connect to the database.')
    })
    database.none('UPDATE ftlc.promo_code SET uses = uses - $1 WHERE id = $2', [1, id]).catch((error)=>{
      //console.log(error)
      throw new Error('Cannot connect to the database.')
    })
  }
  return database.one('INSERT INTO ftlc.payment(user_id, snapshot, charge) VALUES ($1, $2:json, $3:json) RETURNING id', [user, snapshot, charge])
    .then(data => data.id).catch((error)=>{
      //console.log(error)
      throw new Error('Failed to store payment info.')
    })
}

db.getPayment = (id) => {
  return database.one('SELECT charge, snapshot, user_id FROM ftlc.payment WHERE id = $1', [id])
  .catch((error)=>{throw new Error('could not find payment')})
}
db.storeFailedRefund = (refund, payment) => {
    return database.one('UPDATE ftlc.payment SET refund = $1, status = $2 WHERE id = $3 RETURNING *', [refund, 'refund', payment])
            .catch((error)=>{throw new Error('Error updating payment to refund status')})
}

db.updateRefund = (payment, grantedReason, user, status, reason, refund) => {
    const paymentStatus = (status === 'accepted')?'refund':'paid'
    return database.tx(t => {
          const q1 = database.one('UPDATE ftlc.payment SET refund = $1, status = $2 WHERE id = $3 RETURNING *', [refund, paymentStatus, payment])
          const q2 = database.one(query.updateRefund, [payment, grantedReason, user, status, refund.amount/100, reason])
          return t.batch([q1, q2]);
      })
      .catch(error => {throw new Error('Error occured while storing refund data.' + error.message)});
}

db.unregister = (event, students) => {
    return database.tx(t => {
          const registrations = students.map((student) => {
              return database.none('DELETE FROM ftlc.event_registration WHERE student = $1 AND event = $2', [student.id, event])
          })
          const q1 = database.none('UPDATE ftlc.event SET seats_left = seats_left + $1 WHERE id = $2', [students.length, event])
          return t.batch([...registrations, q1]);
      })
      .catch(error => {throw new Error('Error occured while removing event registration.' + error.message)});
}

db.genTemporaryToken = (email) => {
  return database.any('(SELECT first_name FROM ftlc.users WHERE email = $1) UNION (SELECT ftlc.generate_password_token($1))', [email]).catch((error)=>{
    //console.log(error)
    throw new Error('cannot generate password token.')
  })
}

db.getEmailData = (event) => {
    let promises = []
    promises.push(
        database.many('SELECT start, \"end\" from ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.date_join WHERE event = $1)', [event])
                .then((data)=>{return{dates:data}})
                .catch((error)=>{throw new Error('Unable to get event dates.')})
    )
    promises.push(
        database.one('SELECT * FROM ftlc.address WHERE id = (SELECT address FROM ftlc.event WHERE id = $1)', [event])
        .then((data)=>{return{address:data}})
        .catch((error)=>{throw new Error('Unable to get event address.')})
    )

    return Promise.all(promises).then(data => {
        let returnVal = {}
      data.forEach(obj => {
        let key = Object.keys(obj)[0]
        returnVal[key] = obj[key]
      })
      return returnVal
    })
}

db.getMailingList = () => {
    return database.many('SELECT email FROM ftlc.news_letter')
    .catch((error)=>{throw new Error('Cannot query mailing list')})
}

db.getUser = (id) => {
    return database.one('SELECT * from ftlc.users WHERE id = $1', [id])
            .catch((error)=>{throw new Error('Cannot find user with given id.')})
}

if(process.env.TEST){
    db.database = database
    db.createRefundRequest = (user, reason, payment) => {
        return database.none('INSERT INTO ftlc.refund_request(user_id, reason, payment) VALUES ($1, $2, $3)', [user, reason, payment]).catch((error)=>{
          //console.log(error)
          throw new Error('Issue occered while createing mock refund requests, this is not in production, check test code.')
        })
    }
}


module.exports = db
