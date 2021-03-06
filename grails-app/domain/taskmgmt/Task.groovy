package taskmgmt

import taskmgmt.enums.TaskPriority
import taskmgmt.enums.TaskStatus

class Task {

    String title
    String detail
    TaskStatus taskStatus = TaskStatus.CREATED
    TaskPriority taskPriority = TaskPriority.HIGH
    TaskType taskType           // this creates a belongsTo relationship with TaskType
    Customer customer           // this creates a belongsTO relationship with Customer
    User user
    Date dateCreated
    Date dateModified
    Date dateCompleted          // the date when the task is marked completed
    Date dateDeleted            // use this to indicate if the task was deleted
    Date dueDate                //date when the task is expected to be completed

    static  hasMany = [comments:Comment]

    static constraints = {
        user nullable: true
        taskStatus nullable: true
        dateModified nullable: true
        dateCompleted nullable: true
        dateDeleted nullable: true
        taskPriority nullable: true
        dueDate nullable: true
        customer nullable: true
    }

    static mapping = {
        detail type: "text"             // this allows to enter text more than 255 characters
    }
}
