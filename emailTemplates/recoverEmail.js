module.exports = (name, url) => `<div style="width:100%;height:100%;">
    <div style="background-color:#4bc82e">
        <h1 style="text-align:center; font-family:Zekton; color:white; margin:0; padding:20px 0;">Fun 2 Learn Code</h1>
    </div>
    <div style="margin:0 auto; max-width:400px; color:black;">
        <h2>Hi ${name},</h2>
        <p>We got a request to reset your Fun 2 Learn Code account password</p>
        <div style="margin:0 auto; max-width:200px;">
            <a href='${url}' style="text-decoration: none;">
                <div style="padding:20px;font-size: 20px; font-weight:800;border-radius:5px;border:2px solid #41a62a;color:#41a62a; margin:10px 0;">Reset Password</div>
            </a>
        </div>
        <p>This link expires 1 hour from the time it's sent, if you need a new link <a href='${process.env.CLIENT_URL}/recover'>click here</a>.</p>
    </div>
</div>`
