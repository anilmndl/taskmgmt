package taskmgmt

import taskmgmt.enums.TaskStatus

class Task {

    String title
    String detail
    Date dateCreated
    Date dateModified
    String flag

    TaskStatus taskStatus = TaskStatus.CREATED

    static constraints = {
        taskStatus nullable: true
        dateCreated nullable: true
        dateModified nullable: true
        flag nullable: true
    }
}
