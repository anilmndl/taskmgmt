package taskmgmt

import taskmgmt.enums.TaskStatus

class Task {

    String title
    String detail

    TaskStatus taskStatus = TaskStatus.CREATED
    // TODO create a new enum for TaskPriority

    TaskType taskType           // this creates a belongsTo relationship with TaskType

    Date dateCreated
    Date dateModified
    String flag                 // what is this for?? AM 02/26/2018

    static constraints = {
        taskStatus nullable: true
        dateCreated nullable: true
        dateModified nullable: true
        flag nullable: true
        taskType nullable: true
    }

    static mapping = {
        detail type: "text"             // this allows to enter text more than 255 characters
    }
}
