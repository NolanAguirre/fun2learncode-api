const promoCode = `SELECT effect, percent FROM ftlc.promo_code WHERE valid_start < $1 AND $1 < valid_end AND uses > 0  AND code = $2 AND ((for_catagory = true AND catagory = (SELECT event_type FROM ftlc.events WHERE id = (SELECT event FROM ftlc.date_group WHERE id = $3))) OR (for_event = true AND event = (SELECT event FROM ftlc.date_group WHERE id = $3)) OR (for_user = true AND user_id = $4) OR (for_catagory = false AND for_event = false AND for_user = false))`
// $1 = timestamp
// $2 = code
// $3 = dateGroup
// $4 = userId


module.exports = {
    promoCode
}
