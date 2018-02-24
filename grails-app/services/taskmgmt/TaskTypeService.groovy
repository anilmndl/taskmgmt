package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskTypeService {

    def save(Tasktype tskType) {
        tskType.flag="created"
        tskType.save failOnError: true, flush: true
    }

    def update(Tasktype taskType){
        taskType.dateModified = new Date()
        if(taskType.validate()){
            taskType.save failOnError: true, flush: true
        }
    }

}
