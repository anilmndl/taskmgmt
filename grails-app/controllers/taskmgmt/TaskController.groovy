package taskmgmt

class TaskController {

    TaskService taskService

    def index() {
        render view: "list", model: [tasks: Task.list()]
    }
    def save(Task mgmt) {
        mgmt.flag="Created"
        mgmt.dateCreated = new Date()
        mgmt.dateModified = new Date()
        redirect action: "list"
    }
    def delete(Date taskInstance) {
        taskService.deleteTask(taskInstance)
        taskInstance.dateModified=new Date()
        taskInstance.flag="deleted"
        redirect action: "list",modle:[tasks: Task.list()]
    }

    def create() {
        taskService.createTask()
        redirect action: "index"
    }
}

