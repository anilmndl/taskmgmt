package taskmgmt

import org.apache.tools.ant.taskdefs.Parallel
import taskmgmt.enums.TaskStatus

class TaskController {

    TaskService taskService

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    //page will be redirected to list() method by default instead of "index"
    static defaultAction = "list"

    def delete(Task task) {
        try {
            taskService.delete(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def completed(Task task) {
        try {
            taskService?.complete(task)
            redirect action: "listCompleted"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "detail", model: [tasks: task]
        }
    }

    def edit(Task task) {
        render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list(), customerList: Customer.list()]
    }

    def update(Task task) {
        if ((task.title == null || task.detail == null) && task.taskType != null) {
            task = taskService?.createTask(task)
        }
        try {
            taskService?.update(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list()]
        }

    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def taskList = Task.createCriteria().list(params) {
            if (params.query) {
                and {
                    or {
                        ilike("title", "%${params.query}%")
                        // gtProperty("dateCreated", "%03-02-2018%")
                        //    le("dateCreated", "%${params.query}%")
                        // if(params.query.toInteger()){
                        //     ilike("dateCreated".toString() , "%${"params.query"}%")
                        // }else{
                        //    ilike("dateCreated".toString() , "%${"params.query"}%")
                    }
                    isNull("dateDeleted")
                }
            } else {
                isNull("dateDeleted")
            }
        }
        render view: "list", model: [tasks: taskList, listCount: Task.count()]
    }

    def create() {
        render view: "create", model: [taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list(), customerList: Customer.list()]
    }

    def detail(Task task) {
        render view: "detail", model: [tasks: task]
    }

    def listCompleted() {
        render view: "completed", model: [tasks: Task.findAllByDateCompletedIsNotNullAndDateDeletedIsNull([order: "desc", sort: "dateCompleted"])]
    }

    def save(Task task) {
        if ((task.title == null || task.detail == null) && task.taskType != null) {
            task = taskService?.createTask(task)
        }
        try {
            taskService?.save(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list()]
        }

    }

    def unlocked(Task task) {
        try {
            taskService?.unlocked(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [tasks: task]
    }

    def locked(Task task) {
        try {
            taskService?.locked(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [tasks: task]

        taskService.unlocked(task)
        redirect action: "list"
    }

    def myTask() {
        render view: "list", model: [tasks: Task.findAllByTaskStatusNotEqual(TaskStatus.COMPLETED)]
    }
}