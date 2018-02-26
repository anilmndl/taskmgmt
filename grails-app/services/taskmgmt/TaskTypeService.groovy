package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskTypeService {

    def save(TaskType tskType) {
        tskType.flag = "created"
        tskType.save failOnError: true, flush: true
    }

    def update(TaskType taskType) {
        taskType.dateModified = new Date()
        taskType.save failOnError: true, flush: true
    }

}
