const acceptInner = (token, name) => `<p style='padding-bottom:50px;'>
    Your private event request has been approved. <br />
    Below is your private event url, you must register and pay for the event through this link. <br />
    After this, you may choose to share the link to those you wish to invite, however it is entirly optional.
</p>
<table style="border:none;margin-top:10px" width="600px" cellspacing="0" cellpadding="3" border="0">
  <tbody>
    <tr>
      <th colspan="3" scope="rowgroup" style="border:none;text-align:left;font-size:18px;">
        Event Information
      </th>
    </tr>
    <tr>
      <td colspan="1" style="border:none;" valign="top">Link:</td>
      <td colspan="2" style="border:none" valign="top"><a href='${process.env.CLIENT_URL}/private/registration/${token}' target='_blank'>${process.env.CLIENT_URL}/private/registration/${token}</a></td>
    </tr>
    <tr>
      <td colspan="1" style="border:none" valign="top">Access Token:</td>
      <td colspan="2" style="border:none" valign="top">${token}</td>
    </tr>
  </tbody>
</table>`

const rejectInner = `<p style='padding-bottom:50px;'>
    Your private event request has been denied. <br />
    For more information, or to have questions answered please email info@fun2learncode.com
</p>`

module.exports = (status,token,name) => `<div style="width:100%;height:100%;background-color:#f2f2f2">
  <div style="background-color:#41a62a">
    <h1 style="text-align:center; font-family:Zekton; color:white; margin:0; padding:20px 0;">Fun 2 Learn Code</h1>
  </div>
  <!-- ABOVE IS THE CODE FOR THE HEADER, I WOULD RECOMMENT YOU DONT CHANGE IT -->
  <div style="margin:0 auto; max-width:600px; padding:20px;color:black; background-color:white">
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
                                <h1 style="margin:0.2em 0em 0.5em 0px;padding-left:2px;padding-right:2px;font-size:24px">Hi ${name},</h1>
                                    ${status === 'accepted'?acceptInner(token, name):rejectInner}
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
