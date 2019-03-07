const promoCode = `SELECT effect, percent, code, id FROM ftlc.promo_code WHERE disabled = false AND valid_start < $1 AND $1 < valid_end AND uses > 0  AND code = $2 AND NOT(SELECT EXISTS(SELECT 1 FROM ftlc.promo_code_use WHERE promo_code = id AND user_id = $4)) AND ((for_category = false AND for_activity = false AND for_user = false) OR (for_category = true AND category = (SELECT category FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $3))) OR (for_user = true AND user_id = $4) OR (for_activity = true AND activity = (SELECT activity FROM ftlc.event WHERE id = $3)))`
// $1 = timestamp
// $2 = code
// $3 = dateGroup
// $4 = userId

const hiddenEvent = `SELECT * FROM ftlc.event WHERE (
    ((open_registration < $1 AND $1 < close_registration) OR (ARRAY[$5:list]::UUID[] <@ array(SELECT student FROM ftlc.registration_override WHERE event::text = $2 AND $1 < valid_end))) AND seats_left >= $3 AND (
    (public_display = true AND id::text = $2) OR
    (public_display = false AND id = (SELECT event FROM ftlc.event_request WHERE access_token = $2 AND user_id = $4)) OR
    (false)))`


module.exports = {
  promoCode,
  hiddenEvent
}
//SELECT * FROM ftlc.event WHERE (open_registration < '2019-03-05T20:55:19.240Z' AND '2019-03-05T20:55:19.240Z' < close_registration AND seats_left >= 1 AND ((public_display = true AND id::text = 'TestEventasdfghjklqwertyuiop') OR (public_display = false AND id = (SELECT event FROM ftlc.event_request WHERE access_token = 'TestEventasdfghjklqwertyuiop' AND user_id = '702651ae-0036-448e-bd7c-b9e6489bf822'))))
