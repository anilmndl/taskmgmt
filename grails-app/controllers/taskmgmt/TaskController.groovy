package taskmgmt
<<<<<<< HEAD

import org.h2.engine.User
=======
>>>>>>> 7bc1443b2aac76693987bf82a3e3e4ca8763a020
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
        def tasks = Task.createCriteria()
        tasks = tasks.list {
            isNull("dateDeleted")
            and {
                isNull("dateCompleted")
            }
            order("dateCreated","desc")
        }
        render view: "list", model: [tasks: tasks, listCount: Task.count(), dropdown: dropdown]
    }

    def create() {
        render view: "create", model: [taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list(), customerList: Customer.list()]
    }

    def detail(Task task) {
        render view: "detail", model: [tasks: task]
    }

    def listCompleted() {
        def tasks = Task.createCriteria()
        tasks = tasks.list{
            isNull("dateDeleted")
            and{
                isNotNull("dateCompleted")
            }
            order("dateCompleted","desc")
        }


        render view: "completed", model: [tasks: tasks]
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