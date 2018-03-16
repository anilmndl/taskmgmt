package taskmgmt

import taskmgmt.enums.TaskPriority
import taskmgmt.enums.TaskStatus

class Task {

    String title
    String detail

    TaskStatus taskStatus = TaskStatus.CREATED
    TaskPriority taskPriority = TaskPriority.HIGH


    TaskType taskType           // this creates a belongsTo relationship with TaskType

    //String taskTypeName

    Users users

    //String taskTypeName
    Date dateCreated
    Date dateModified
    Date dateCompleted          // the date when the task is marked completed
    Date dateDeleted            // use this to indicate if the task was deleted

    String flag                 // what is this for?? AM 02/26/2018

    static constraints = {
        //taskTypeName nullable: true
        taskStatus nullable: true
        dateCreated nullable: true
        dateModified nullable: true
        dateCompleted nullable: true
        dateDeleted nullable: true
        flag nullable: true
        taskType nullable: true
        taskPriority nullable: true
    }

    static mapping = {
        detail type: "text"             // this allows to enter text more than 255 characters
    }
}
