package taskmgmt

import grails.plugin.springsecurity.SpringSecurityService
import taskmgmt.enums.TaskStatus
import org.springframework.transaction.annotation.Transactional


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
            if(users[i] == null) {
                users[i] = springSecurityService.currentUser as User
            }
            new Task(taskStatus: (users!= null) ? TaskStatus.ASSIGNED : TaskStatus.CREATED , title: linkedTaskType[i].title, detail: linkedTaskType[i].description,
            user: users[random.nextInt(users.size())], taskType: linkedTaskType[i], dueDate: new Date(), dateCreated: new Date()).save()
        }
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

