package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskTypeService {

    def save(TaskType taskType) {
        taskType.dateCreated = new Date()
        taskType.flag = "created"
        taskType.save failOnError: true, flush: true
    }

    def update(TaskType taskType) {
        taskType.dateModified = new Date()
        taskType.save failOnError: true, flush: true
    }

    def delete(TaskType taskType){
        taskType.dateModified=new Date()
        taskType.flag="deleted"
        taskType.save failOnError: true,flush: true
    }
}
