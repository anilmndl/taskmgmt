package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus


@Transactional
class TaskService {

    def save(Task task) {
        task.dateCreated = new Date()
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def delete(Task task) {
        task.dateDeleted = new Date()
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Deletion failed.")
        }
    }

    def update(Task task) {
        task.dateModified = new Date()
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def complete(Task task) {
        task.dateCompleted = task.dateModified
        task.taskStatus = TaskStatus.COMPLETED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    Task createTask(Task task) {
        task.title = task.title ? task.title : task.taskType.title
        task.detail = task.detail ? task.detail : task.taskType.description

        return task
    }

    def unlocked(Task task) {
        task.taskStatus = TaskStatus.UNLOCKED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    def locked(Task task) {
        task.taskStatus = TaskStatus.LOCKED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

}
