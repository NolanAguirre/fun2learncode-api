const promoCode = `SELECT effect, percent, code, id FROM ftlc.promo_code WHERE disabled = false AND valid_start < $1 AND $1 < valid_end AND uses > 0  AND code = $2 AND NOT(SELECT EXISTS(SELECT 1 FROM ftlc.promo_code_use WHERE promo_code = id AND user_id = $4)) AND ((for_category = false AND for_activity = false AND for_user = false) OR (for_category = true AND category = (SELECT category FROM ftlc.activity WHERE id = (SELECT activity FROM ftlc.event WHERE id = $3))) OR (for_user = true AND user_id = $4) OR (for_activity = true AND activity = (SELECT activity FROM ftlc.event WHERE id = $3)))`
// $1 = timestamp
// $2 = code
// $3 = dateGroup
// $4 = userId


module.exports = {
    promoCode
}
