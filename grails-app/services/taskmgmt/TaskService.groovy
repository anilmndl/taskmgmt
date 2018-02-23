package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskService {

    def save(Task taskmgmt) {
        taskmgmt.save failonError: true, flush: true
    }
    def deleteTask(String deleteTask){
        Task(flag:deleteTask).save failOnError: true,flush: true
    }
}
