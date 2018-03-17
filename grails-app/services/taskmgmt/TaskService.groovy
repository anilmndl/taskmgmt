package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus


@Transactional
class TaskService {

    def save(Task task) {
        task.dateCreated = new Date()
        if (task.validate()) {
            task.save failOnError: true, flush: true
        }
    }

    def delete(Task task) {
        task.dateModified = new Date()
        task.dateDeleted = task.dateModified
        task.save failOnError: true, flush: true
    }

    def update(Task task) {
        task.dateModified = new Date()
        task.save failOnError: true, flush: true
    }

    def complete(Task task) {
        task.dateModified = new Date()
        task.dateCompleted = task.dateModified
        task.taskStatus = TaskStatus.COMPLETED
        task.save failOnError: true, flush: true
    }

    def createTask() {
        new Task(title: "Created by Task Service").save failOnError: true, flush: true
    }
    def unlocked(Task task){

        task.taskStatus=TaskStatus.UNLOCKED
        task.save failOnError: true, flush: true
    }
    def locked(Task task){

        task.taskStatus=TaskStatus.LOCKED
        task.save failOnError: true, flush: true
    }

}
