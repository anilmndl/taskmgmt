package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus


@Transactional
class TaskService {

    def save(Task task) {
        task.dateCreated = new Date()
        task.flag = "created"
        //if (task.validate()) {
            task.save failOnError: true, flush: true
        //}
    }

    def delete(Task task) {
        task.dateModified = new Date()
        task.flag = "deleted"
        task.dateDeleted = new Date()
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
