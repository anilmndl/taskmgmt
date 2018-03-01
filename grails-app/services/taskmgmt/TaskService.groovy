package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

import java.text.DateFormatSymbols

@Transactional
class TaskService {

    def save(Task task) {
        task.flag = "created"
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
        task.flag = "completed"
        task.taskStatus = TaskStatus.COMPLETED
        task.save failOnError: true, flush: true
    }

    def createTask() {
        new Task(title: "Created by Task Service").save failOnError: true, flush: true
    }
}
