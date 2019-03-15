const cron = require('cron')
const {exec} = require('child_process')

let x = 0
const job = cron.job('*/10 * * * * *', ()=>{
    exec('jest index.test.js --runInBand', (error, stdout, stderr) => {
  if (error) {
    throw error;
  }
  console.log(stdout);
  console.log(++x)
})
})
job.start()
