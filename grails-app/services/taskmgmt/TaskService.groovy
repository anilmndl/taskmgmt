package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskService {

    def save(Task taskmgmt) {
        taskmgmt.flag="created"
        taskmgmt.save failonError: true, flush: true
    }
    def delete(Task task){
        task.dateModified=new Date()
        task.flag="deleted"
        task.save failOnError: true,flush: true
    }
}
