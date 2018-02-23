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
<<<<<<< HEAD

    String MonthString(int month) {
        return new DateFormatSymbols().getMonths()[month-1]
    }
=======
    def update(Task task){
        task.dateModified = new Date()
        task.save failOnError: true, flush: true
     }
>>>>>>> 110ae2f9df853c262aaeaf8ed3825ae8c7e5c60e
}
