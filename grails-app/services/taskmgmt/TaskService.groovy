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
        if(task.user!=null && task.taskStatus!=TaskStatus.ASSIGNED){
                task.taskStatus=TaskStatus.ASSIGNED
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
        def possibleTaskTypes = task.taskType.linkedTaskTypes
        possibleTaskTypes.each {
            def usersNotInVacation = it.users.collect(){
                it.vacationMode==false
            }
            Random random = new Random()
            new Task(taskStatus: TaskStatus.CREATED, title: it.title, detail: it.description,
                    users: usersNotInVacation[random.nextInt(usersNotInVacation().size())], taskType: it,
                    dateCreated: new Date()).save()
        }
    }
    // I did the restrict to a single task
    // SanRIZZ.........
    // 1.c done   

    void newTasks(){
            Random rand=new Random()

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
    Task createTask(Task task) {
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
