const { execSync } = require('child_process');
require('dotenv').config()


const test = () => {
    console.log('This command needs the env vars DATABASE_URL, JWT_SECRET, EMAIL_USER, EMAIL_PASSWORD and CLIENT_URL to fully work.')
    const db =`${process.env.DATABASE_URL}`
    execSync(`pg_dump -a -n ftlc -n ftlc_private ${db} > tempDump.sql `, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
    execSync(`pg_dump -d ${db} -c -f testingData.sql`, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
    execSync(`jest index.test.js --forceExit --detectOpenHandles`, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
    execSync(`pg_dump -d ${db} -c -f tempDump.sql`, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
    execSync(`rm tempDump.sql`, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
}
// test()
console.log('This test will send emails to me(nolan), so please change the emails found on lines 1854-1855 and 1960-1962 of testingData.sql to email addresses you can recive emails at.')
// if the tests fail, the test data likely is too old, the tests are meant to run in march, in order to test after this,
// change the date on line 29 of beginTransaction to a date in early march
