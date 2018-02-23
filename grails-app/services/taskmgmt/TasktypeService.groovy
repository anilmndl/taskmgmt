package taskmgmt

import grails.transaction.Transactional

@Transactional
class TasktypeService {

    def save(Tasktype tskType) {
        tskType.flag="created"
        tskType.save failOnError: true, flush: true
    }

}
