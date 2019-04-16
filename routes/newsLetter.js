const axios = require('axios')

const mailchimpURL = `https://us8.api.mailchimp.com/3.0/lists/${process.env.MAILCHIMP_ID}/members/`
const auth = {
    auth:{
        username:'anything',
        password:process.env.MAILCHIMP_KEY
    }
}

const newsLetter = async (email)=>{
    const axiosBody = {
        email_address: email,
        status: "subscribed"
    }
    await axios.post(mailchimpURL, axiosBody, auth).catch((error)=>{
        throw new Error(error.response.data.title)
    })
    return true
}
module.exports = {
    production: newsLetter,
    test:async (args) => {
        try{
            return await newsLetter(args.email)
        }catch (error){
            return {error:error.message}
        }
    }
}
