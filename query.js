const promoCode = `SELECT effect, percent, code, id FROM ftlc.promo_code WHERE disabled = false AND valid_start < $1 AND $1 < valid_end AND uses > 0  AND code = $2 AND
(id NOT IN (SELECT promo_code FROM ftlc.promo_code_use WHERE user_id = $4)) AND
((for_category = false OR(for_category = true AND category = (SELECT category FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $3)))) AND
(for_user = false OR (for_user = true AND user_id = $4)) AND
(for_activity = false OR (for_activity = true AND activity = (SELECT activity FROM ftlc.event WHERE id = $3))))`
// $1 = timestamp
// $2 = code
// $3 = dateGroup
// $4 = userId

const hiddenEvent = `SELECT * FROM ftlc.event WHERE (
    ((open_registration < $1 AND $1 < close_registration) OR (ARRAY[$5:list]::UUID[] <@ array(SELECT student FROM ftlc.registration_override WHERE event::text = $2 AND $1 < valid_end))) AND seats_left >= $3 AND (
    (public_display = true AND id::text = $2) OR
    (public_display = false AND id = (SELECT event FROM ftlc.event_request WHERE access_token = $2 AND user_id = $4)) OR
    (public_display = false AND id = (SELECT event FROM ftlc.event_request WHERE access_token = $2) AND seats_left != capacity)))`

//last condition is a super cheesy way to make sure people that didnt request the event cant register before the user who did request it did
const updateRefund = `
INSERT INTO ftlc.refund_request(payment, granted_reason, user_id, status, amount_refunded, reason) VALUES ($1, $2, $3, $4, $5, $6)
    ON CONFLICT(payment, user_id) DO UPDATE SET granted_reason = $2, status = $4, amount_refunded = $5  WHERE ftlc.refund_request.user_id = EXCLUDED.user_id AND ftlc.refund_request.payment = EXCLUDED.payment RETURNING id`


module.exports = {
  promoCode,
  hiddenEvent,
  updateRefund
}
