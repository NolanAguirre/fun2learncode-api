const { execSync } = require('child_process');
require('dotenv').config()


const test = () => {
    console.log('This command needs the env vars DATABASE_URL, JWT_SECRET, EMAIL_USER, EMAIL_PASSWORD and CLIENT_URL to fully work.')
    const db =`${process.env.DATABASE_URL}`
    execSync(`pg_dump -n ftlc -n ftlc_private --clean -d ${db} -f temp.sql`)
    execSync(`psql -d ${db} -f testData.sql`)
    try{
        execSync(`jest index.test.js --forceExit --detectOpenHandles`)
    } catch(error){
        //console.log(error)
    }
    setTimeout(()=>{
        execSync(`psql -d ${db} -f temp.sql`)
        execSync(`rm temp.sql`)
    } ,3000)
}
test()
// console.log('This test will send emails to me(nolan), so please change the emails found on lines 1854-1855 and 1960-1962 of testingData.sql to email addresses you can recive emails at.')
// if the tests fail, the test data likely is too old, the tests are meant to run in march, in order to test after this,
// change the date on line 29 of beginTransaction to a date in early march
