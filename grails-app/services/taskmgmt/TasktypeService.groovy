package taskmgmt

import grails.transaction.Transactional

@Transactional
class TasktypeService {

    def save(Tasktype tskType) {
        tskType.dateCreated = new Date()
        tskType.dateModified = new Date()
        tskType.flag="created"
        tskType.save failOnError: true, flush: true
    }

}
