module.exports = ({message}) => `<div style="width:100%;height:100%;">
    <div style="background-color:#41a62a">
        <h1 style="text-align:center; font-family:Zekton; color:white; margin:0; padding:20px 0;">Fun 2 Learn Code</h1>
    </div>
    <!-- ABOVE IS THE CODE FOR THE HEADER, I WOULD RECOMMENT YOU DONT CHANGE IT -->
    <div style="margin:0 auto; max-width:400px; color:black;">
        <h2> Account reqires action</h2>
        ${message}
        <!-- BELOW IS THE CODE FOR THE FOOTER, I WOULD RECOMMENT YOU DONT CHANGE IT -->
        <p style="font-size:10px;color:rgb(102, 102, 102);">To unsubscribe from our news letter <a href='http://localhost:3000/recover'>click here</a>.</p>
    </div>
</div>`
