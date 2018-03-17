package taskmgmt

import taskmgmt.enums.TaskPriority
import taskmgmt.enums.TaskStatus

class Task {

    String title
    String detail

    TaskStatus taskStatus = TaskStatus.CREATED
    TaskPriority taskPriority = TaskPriority.HIGH


    TaskType taskType           // this creates a belongsTo relationship with TaskType

    Users users

    Date dateCreated
    Date dateModified
    Date dateCompleted          // the date when the task is marked completed
    Date dateDeleted            // use this to indicate if the task was deleted


    static constraints = {
        taskStatus nullable: true
        dateModified nullable: true
        dateCompleted nullable: true
        dateDeleted nullable: true
        taskType nullable: true
        taskPriority nullable: true
    }

    static mapping = {
        detail type: "text"             // this allows to enter text more than 255 characters
    }
}
