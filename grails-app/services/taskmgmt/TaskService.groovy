package taskmgmt

import grails.transaction.Transactional

import java.text.DateFormatSymbols

@Transactional
class TaskService {

    def save(Task taskmgmt) {
        taskmgmt.flag="created"
        taskmgmt.save failOnError: true, flush: true
    }
    def delete(Task task){
        task.dateModified=new Date()
        task.flag="deleted"
        task.save failOnError: true,flush: true
    }

    def update(Task task){
        task.dateModified = new Date()
        task.save failOnError: true, flush: true
     }
}
