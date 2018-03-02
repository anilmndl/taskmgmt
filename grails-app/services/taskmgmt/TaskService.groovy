package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

import java.text.DateFormatSymbols

@Transactional
class TaskService {

    def save(Task task) {
        task.dateDeleted=null
        task.save failOnError: true, flush: true
    }

    def delete(Task task) {
        task.dateModified = new Date()
        task.taskStatus = TaskStatus.DELETED
        task.save failOnError: true, flush: true
    }

    def update(Task task) {
        task.dateModified = new Date()
        task.save failOnError: true, flush: true
    }

    def complete(Task task) {
        task.dateModified = new Date()
        task.dateCompleted = task.dateModified
        task.dateDeleted=null //it is going to be null unless deleted because it should not be displayed even if it is completed.
        task.taskStatus = TaskStatus.COMPLETED// this will track if the event is completed.
        task.save failOnError: true, flush: true
    }

    def createTask() {
        new Task(title: "Created by Task Service").save failOnError: true, flush: true
    }
}
