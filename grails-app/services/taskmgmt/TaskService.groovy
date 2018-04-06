package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

import javax.validation.constraints.Null


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
        task.dateModified = new Date()
        task.taskStatus = TaskStatus.DELETED
        task.save failOnError: true, flush: true
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
        task.dateModified = new Date()
        task.dateCompleted = task.dateModified
        task.dateCompleted = new Date()
        task.taskStatus = TaskStatus.COMPLETED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }
    def assignRandomTaskToRandomUser() {
        newUsers()
        newTasks()
    }


    // I did the restrict to a single task
    // SanRIZZ.........
    // 1.c done   

    void newTasks(){
            new Task(taskStatus: TaskStatus.CREATED, title: "rndTask", detail: "This is random",
                    users: Users.findByFirstName("Alankar"), taskType: TaskType.findByTitle("Grocery"),
                    dateCreated: new Date(), customer: Customer.findByFirstName("Dumb")).save()
    }
    void newUsers(){
            new Users(firstName: "Alankar", middleName: "wait for it.........", lastName: "Pokhrel", role: Role.findByTitle("manager"),
                    address: "925 S. 8th Ave., Pocatello, Idaho", phoneNumber: 123456789, dateCreated: new Date()).save()
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
