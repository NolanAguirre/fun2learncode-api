const cron = require('cron')

class MailingQueue {
    constructor(){
        this.queue = {}
        this.sent = []
        this.lastFilter = Date.now()
        this.autoProcessing = false
        this.config = this.config.bind(this);
        this.process = this.process.bind(this);
        this.add = this.add.bind(this);
    }
    config(options){
        this.options = options
        for(let k in options.priorities){
            const priority = options.priorities[k]
            this.queue[priority.key + ''] = []
        }
    }
    process(){
        const NOW = Date.now()
        if(NOW - this.lastFilter > this.options.filterRate){ //5 minutes since last filter 300000
            this.sent = this.sent.filter((email)=>{
                return NOW - email < this.options.emailRefreshRate //remove all that are older than 61 minutes 3660000
            })
            this.lastFilter = NOW
        }
        let startProcessing = false
        for(let k in this.options.priorities){
            const priority = this.options.priorities[k]
            while(this.sent.length < priority.usage && this.queue[priority.key].length > 0){
                this.sent.push(NOW)
                this.options.cb(this.queue[priority.key].shift())
            }
            if(this.queue[priority.key].length > 0){
                startProcessing = true
            }
        }
        if(this.autoProcessing != startProcessing){
            this.autoProcessing = startProcessing
            if(startProcessing){
                job.start()
            }else{
                job.stop()
            }
        }
    }
    add(data, priority){
        this.queue[priority].push(data)
        this.process()
    }
}

const mailingQueue = new MailingQueue()
const job = cron.job('* */1 * * * *', ()=>{
    mailingQueue.process()
})

module.exports = mailingQueue
