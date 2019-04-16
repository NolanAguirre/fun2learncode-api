const moment = require('moment-timezone');

const summerCampId = '4c3e0f49-48c6-43dd-b13b-13a28e1afd91' //used to check if camp is a summer camp

const orderOverviewRow = (name, student, total) => {
    return `<tr>
      <td colspan="2" style="border:none" valign="top">
        ${name} - ${student}
      </td>
      <td style="border:none;text-align:right;width:10%" valign="top">${total}</td>
    </tr>`
}

const formatDates = (dates) => {
    let returnVal = ''
    dates.forEach((date)=>{
        returnVal += `${moment(date.start).tz('America/North_Dakota/Center').format('MMM Do h:mma')}-${moment(date.end).tz('America/North_Dakota/Center').format('h:mma')}<br/>\n`
    })
    //just adds sup tag to th nd st and rd
    returnVal = returnVal.replace(/th/g, '<sup>th</sup>').replace(/nd/g, '<sup>nd</sup>').replace(/st/g, '<sup>st</sup>').replace(/rd/g, '<sup>rd</sup>')
    return returnVal.substring(0, returnVal.length - 6);
}

const formatOrderOverveiw = (students, eventPrice, addons, overrides, promoCode) => {
    let returnVal = ''
    students.forEach((student)=>{
        let studentName = `${student.first_name} ${student.last_name}`
        let modifiedPrice = eventPrice
        let promoCodeReduction
        for(let k in overrides){
            let override = overrides[k]
            if(override.student === student.id){
                modifiedPrice = override.modified_price
                break
            }
        }
        returnVal += orderOverviewRow('Registration', studentName, modifiedPrice.toFixed(2))
        if (promoCode) {
            if (promoCode.percent) {
                promoCodeReduction =  modifiedPrice * (promoCode.effect / 100)
            } else {
                 promoCodeReduction = promoCode.effect
            }
            returnVal += orderOverviewRow(`Promo Code ${promoCode.code}`, studentName, `-${promoCodeReduction.toFixed(2)}`)
        }
        addons.forEach((addon)=>{
            returnVal += orderOverviewRow(addon.name, studentName, addon.price.toFixed(2))
        })
    })
    return returnVal
}

const summerCampInfo = `<h1 style="margin:0.2em 0em 0.5em 0px;padding-left:2px;padding-right:2px;font-size:24px">What to bring</h1>
                <table style="border:none" width="600px" cellspacing="0" cellpadding="2" border="0">
                  <tbody>
                    <tr>
                      <td colspan="3" style="border:none">
                        <table width="100%" cellspacing="0" cellpadding="4" border="0">
                          <tbody>
                            <tr>
                              <th style="width:296px;text-align:left;font-size:18px">
                                Full Day (2 summer camp)
                              </th>
                              <th style="width:296px;text-align:left;font-size:18px">
                                Half Day (1 summer camp)
                              </th>
                            </tr>
                            <tr>
                              <td valign="top">
                                2 Snacks<br>
                                Lunch, taken from 12:00-1:00<br>
                                Bottle of water
                              </td>
                              <td valign="top">
                                1 Snack<br>
                                Bottle of water
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <p>
                    Drop off begins 10 minutes before the camps starts, unless early drop off is available.<br>
                    Pick up begins 10 minutes before the camps ends, unless late pick up is available.
                </p>`

module.exports = ({students, reciptURL, activity, eventPrice, overrides, addons, dates, address, orderId, total, promoCode, brand, lastFour}) => {
    let extraInfo = (activity.category === summerCampId)?summerCampInfo:''
    return `<div style="width:100%;height:100%;">
            <div style="background-color:#41a62a">
                <h1 style="text-align:center; font-family:Zekton; color:white; margin:0; padding:20px 0;">Fun 2 Learn Code</h1>
            </div>
            <!-- ABOVE IS THE CODE FOR THE HEADER, I WOULD RECOMMENT YOU DONT CHANGE IT -->
            <div style="margin:0 auto; max-width:600px; color:black;">
                <div>
                  <table width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                      <tr>
                        <td style="font-family:'arial';font-size:10pt" align="center">
                          <table style="max-width:600px" width="600" cellspacing="0" cellpadding="0" border="0" align="center">
                            <tbody>
                              <tr>
                                <td align="left">
                                  <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                      <tr>
                                        <td style="padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px" align="left">
                                          <div style="text-align:left">
                                            <h1 style="margin:0.2em 0em 0.5em 0px;padding-left:2px;padding-right:2px;font-size:24px">Hi ${'Nolan'},</h1>
                                            <p>
                                                Thank you for registering for on of our events! <br>
                                                Below you will see information pertaining to the event you've registed for.
                                            </p>
                                            <h1 style="margin:0.2em 0em 0.5em 0px;padding-left:2px;padding-right:2px;font-size:24px">Registration Details</h1>
                                            <table style="border:none" width="600px" cellspacing="0" cellpadding="2" border="0">
                                              <tbody>
                                                <tr>
                                                  <td colspan="3" style="border:none">
                                                    <table width="100%" cellspacing="0" cellpadding="4" border="0">
                                                      <tbody>
                                                        <tr>
                                                          <th style="width:296px;text-align:left;font-size:18px">
                                                              Event Details
                                                          </th>
                                                          <th style="width:296px;text-align:left;font-size:18px">
                                                              Event Dates
                                                          </th>
                                                        </tr>
                                                        <tr>
                                                          <td valign="top">
                                                            Activity: ${activity.name}<br>
                                                            Location:${address.alias}<br>
                                                            ${address.street}, ${address.city}, ${address.state}<br>
                                                            Price: ${eventPrice}
                                                          </td>
                                                          <td valign="top">
                                                              ${formatDates(dates)}
                                                          </td>
                                                        </tr>
                                                      </tbody>
                                                    </table>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <th colspan="3" style="border:none;text-align:left;font-size:18px">
                                                      Order Overview
                                                  </th>
                                                </tr>
                                                ${formatOrderOverveiw(students, eventPrice, addons, overrides, promoCode)}
                                                <tr>
                                                  <td colspan="2" style="border:none" valign="top">Total</td>
                                                  <td style="border:none;text-align:right;width:10%" valign="top">${total}</td>
                                                </tr>
                                              </tbody>
                                            </table>
                                            <table style="border:none;margin-top:10px" width="600px" cellspacing="0" cellpadding="3" border="0">
                                              <tbody>
                                                <tr>
                                                  <th colspan="3" scope="rowgroup" style="border:none;text-align:left;font-size:18px;">
                                                      Payment Summary
                                                  </th>
                                                </tr>
                                                <tr>
                                                  <td colspan="1" style="border:none;width:30%" valign="top">Amount:</td>
                                                  <td colspan="2" style="border:none" valign="top">${total}</td>
                                                </tr>
                                                <tr>
                                                  <td colspan="1" style="border:none" valign="top">Method:</td>
                                                  <td colspan="2" style="border:none" valign="top">${brand} ending in ${lastFour}</td>
                                                </tr>
                                                <tr>
                                                  <td colspan="1" style="border:none;width:180px" width="180px" valign="top">
                                                      Order ID:
                                                  </td>
                                                  <td colspan="2" style="border:none" valign="top">${orderId}</td>
                                                </tr>
                                                <tr>
                                                  <td colspan="1" style="border:none;width:180px" width="180px" valign="top">
                                                      Stripe receipt link:
                                                  </td>
                                                  <td colspan="2" style="border:none" valign="top"><a href='${reciptURL}' target='_blank'>click here</a></td>
                                                </tr>
                                              </tbody>
                                            </table>
                                            ${extraInfo}
                                          </div>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="yj6qo"></div>
                  <div class="adL"></div>
                </div>
            </div>
        </div>`
}
