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

    def assignRandomTaskToRandomUser(Task task) {
        List<TaskType> newTaskTypeList = task.taskType.linkedTaskTypes
        newTaskTypeList.each {
            def newUsersList = it.users
            List<Users> userList
            newUsersList.each {
                if(it.vacationMode==false){
                    userList.add(it)
                }
            }
            Random random = new Random()
            new Task(taskStatus: TaskStatus.CREATED, title: it.title, detail: it.description,
                    users: userList[random.nextInt(userList.size())], taskType: it,
                    dateCreated: new Date()).save()
        }
    }
    // I did the restrict to a single task
    // SanRIZZ.........
    // 1.c done   

    void newTasks() {
        new Task(taskStatus: TaskStatus.CREATED, title: "rndTask", detail: "This is random",
                users: Users.findByFirstName("Alankar"), taskType: TaskType.findById(1),
                dateCreated: new Date(), customer: Customer.findById(1)).save()
    }

    void newUsers() {
        new Users(firstName: "Alankar", middleName: "wait for it.........", lastName: "Pokhrel", role: Role.findById(1),
                address: "925 S. 8th Ave., Pocatello, Idaho", phoneNumber: 123456789, dateCreated: new Date(),vacationMode: true).save()
    }

    Task createTask(Task task) {
        task.title = task.title ? task.title : task.taskType.title
        task.detail = task.detail ? task.detail : task.taskType.description
        return task
    }

    def unassigned(Task task) {

        task.taskStatus = TaskStatus.UNASSIGNED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    def assigned(Task task) {
        task.taskStatus = TaskStatus.ASSIGNED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    def inProgress(Task task) {
        task.taskStatus = TaskStatus.IN_PROGRESS
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    def commentSave(Comment comment) {
        comment.dateCreated = new Date()
        if (comment.validate()) {
            comment.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }
}
