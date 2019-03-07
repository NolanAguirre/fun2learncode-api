require('dotenv').config()
const {execSync}= require('child_process')


const setup = () => {
    if(!process.env.DATABASE_URL){
        console.log('please provide postgres database connection string of DATABASE_URL in your env file to setup.')
        return;
    }
    const db =`db:${process.env.DATABASE_URL}`
    execSync(`cd sqitch && sqitch deploy ${db} && sqitch verify ${db}`, {stdin: 'inherit', stdout: 'inherit', stderr: 'inherit'})
}

setup()
