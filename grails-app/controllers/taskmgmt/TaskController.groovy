package taskmgmt

import grails.gorm.DetachedCriteria
import taskmgmt.enums.TaskStatus

class TaskController {

    TaskService taskService

    //page will be redirected to list() method by default instead of "index"
    static defaultAction = "list"

    def delete(Task task) {
        taskService.delete(task)
        redirect action: "list"
    }

    def completed(Task task) {
        taskService.complete(task)
        redirect action: "listCompleted"
    }

    def edit(Task task) {
        render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByFlag("created"),userList: Users.list()]
    }

    def update(Task task) {
        taskService.update(task)
        redirect action: "list"
    }

    def list() {
        DetachedCriteria query = new DetachedCriteria(Task)
        query = query.build {
//            isNull "dateDeleted"
        }

        if(params.title){
            query = query.build {
                ilike "title", "%${params.title}%"
            }
        }

        if(params.user){
            query = query.build {
                users{
                    ilike "firstName", "%${params.user}%"
                }
            }
        }

        //render view: "list", model: [tasks: Task.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"])]
        render view: "list", model: [tasks: query.list([sort: "dateCreated", order: "desc"])]
    }

    def create() {
        // Task task=Task.get(params.id)
        render view: "create", model: [taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list()]
    }

    def detail(Task tasks) {
        render view: "detail", model: [tasks: tasks]
    }

    def listCompleted() {
        render view: "completed", model: [tasks: Task.findAllByTaskStatus(TaskStatus.COMPLETED, [order: "desc", sort: "dateCompleted"])]
    }

    def save(Task task) {
        try{
            taskService.createTask()
        }catch (e){
            render view: "create", model: [taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list(), task: task]
            flash.message = "error occured while trying to save task"
            return
        }

        redirect action: "list"
    }

    def unlocked(Task task){
        taskService.unlocked(task)
        redirect action: "list"
    }
    def locked(Task task){
        taskService.locked(task)
        redirect action: "list"
    }
}
