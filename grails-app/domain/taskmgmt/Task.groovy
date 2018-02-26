package taskmgmt

import taskmgmt.enums.TaskStatus

class Task {

    String title

    TaskStatus taskStatus = TaskStatus.CREATED

    static constraints = {
        taskStatus nullable: true
    }
}
