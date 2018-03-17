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
        else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def delete(Task task) {
        task.dateModified = new Date()
        task.dateDeleted = task.dateModified
        task.save failOnError: true, flush: true
    }

    def update(Task task) {
        task.dateModified = new Date()
        if (task.validate()) {
            task.save failOnError: true, flush: true
        }
        else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def complete(Task task) {
        task.dateModified = new Date()
        task.dateCompleted = task.dateModified
        task.taskStatus = TaskStatus.COMPLETED
        task.save failOnError: true, flush: true
    }

    def createTask(TaskType taskType, Task task) {
        task.title = task.title?:taskType.title
        task.detail = task.detail?:taskType.description

        return task
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
