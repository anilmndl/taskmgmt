package taskmgmt

import grails.gorm.DetachedCriteria
import grails.plugin.springsecurity.SpringSecurityService
import taskmgmt.enums.TaskStatus
import org.springframework.transaction.annotation.Transactional

import javax.jws.soap.SOAPBinding

@Transactional
class TaskService {
    SpringSecurityService springSecurityService


    def save(Task task) {
        task.dateCreated = new Date()
        if (task.user != null) {
            task.taskStatus = TaskStatus.ASSIGNED
        }
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def randomUser(Task task) {
        task.title = task.title ? task.title : task.taskType.title
        task.detail = task.detail ? task.detail : task.taskType.description
        Random rand = new Random()
        new Task(title: "randTaskType", description: "This is random")
        new User(firstName: "Kishor", middleName: "", lastName: "Simkhada", role: Role.findById(rand.nextInt(100)),
                address: "420 S. 6th Ave #5, Pocatello, Idaho",
                phoneNumber: 1029384756, dateCreated: new Date()).save()
        return task
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
        task
        if (task.user != null && task.taskStatus != TaskStatus.ASSIGNED) {
            task.taskStatus = TaskStatus.ASSIGNED
        }
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def complete(Task task) {
        task.dateModified = new Date()
        task.dateCompleted = new Date()
        task.taskStatus = TaskStatus.COMPLETED
        if (task.validate()) {
            task.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Operation failed.")
        }
    }

    def assignRandomTaskToRandomUser(Task task) {
        Random random = new Random()
        def linkedTaskType = task.taskType.linkedTaskTypes
        List<User> users = User.findAllByVacationModeNotEqual(true)

        for(int i=0; i < linkedTaskType.size(); i++){
            if(users[i] == null){
                users[i] = springSecurityService.currentUser as User
            }
            new Task(taskStatus: (users!= null) ? TaskStatus.ASSIGNED : TaskStatus.CREATED , title: linkedTaskType[i].title, detail: linkedTaskType[i].description,
            user: users[i], taskType: linkedTaskType[i], dueDate: new Date(), dateCreated: new Date()).save()
        }
    }

    void newTasks() {
        Random rand = new Random()

        new Task(taskStatus: TaskStatus.CREATED, title: "rndTask", detail: "This is random",
                users: User.findByFirstName("Alankar"), taskType: TaskType.findById(rand.nextInt(100)),
                dateCreated: new Date(), customer: Customer.findByFirstName("Dumb")).save()
        new Task(taskStatus: TaskStatus.CREATED, title: "rndTask1", detail: "This is random",
                users: User.findByFirstName("Alankar"), taskType: TaskType.findById(rand.nextInt(100)),
                dateCreated: new Date(), customer: Customer.findByFirstName("Dumb")).save()
        new Task(taskStatus: TaskStatus.CREATED, title: "rndTask2", detail: "This is random",
                users: User.findByFirstName("Alankar"), taskType: TaskType.findById(rand.nextInt(100)),
                dateCreated: new Date(), customer: Customer.findByFirstName("Dumb")).save()
    }


    void newUsers() {
        new User(firstName: "Alankar", middleName: "wait for it.........", lastName: "Pokhrel", role: Role.findById(1),
                address: "925 S. 8th Ave., Pocatello, Idaho", phoneNumber: 123456789, dateCreated: new Date(), vacationMode: true).save()
    }

    Task autoFillTask(Task task) {
        task.title = task.title ? task.title : task.taskType.title
        task.detail = task.detail ? task.detail : task.taskType.description
        return task
    }

    def unassigned(Task task) {
        task.taskStatus = TaskStatus.UNASSIGNED
        task.user = null
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

