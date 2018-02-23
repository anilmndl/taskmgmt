package taskmgmt

class TaskController {

    TaskService taskService

    def delete() {
        Task task = Task.get(params.id)
        taskService.delete(task)
        redirect action: "list", modle: [tasks: Task.list()]
    }

    def index() {
        render view: "list", model: [tasks: Task.list()]
    }

    def update() {
        render view: "list"
    }

    def list() {
        render view: "list", model: [tasks: Task.list()]
    }

    def create() {
        // Task task=Task.get(params.id)
        render view: "create"
    }

    def detail() {
        Task tasks = Task.get(params.id)
        render view: "detail", model: [tasks: tasks]
    }

    def save(Task taskmgmt) {
        taskService.save(taskmgmt)
        redirect action: "list"
    }
}
