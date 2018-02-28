package taskmgmt

class TaskController {

    TaskService taskService

    def delete(Task task) {
        taskService.delete(task)
        redirect action: "list", model: [tasks: Task.list()]
    }

    def completed(Task task) {
        taskService.complete(task)
        redirect action: "listCompleted"
    }

    def index() {
        render view: "list", model: [tasks: Task.list()]
    }

    def edit(Task task) {
        render view: "edit", model: [editTask: task]
    }

    def update(Task task) {
        taskService.update(task)
        redirect action: "list"
    }

    def list() {
        render view: "list", model: [tasks: Task.list()]
    }

    def create() {
//        taskService?.createTask()
        // Task task=Task.get(params.id)
        render view: "create"
    }

    def detail(Task tasks) {
        render view: "detail", model: [tasks: tasks]
    }

    def listCompleted() {
        render view: "completed", model: [tasks: Task.list()]
    }

    def save(Task task) {
        taskService.save(task)
        redirect action: "list"
    }
}
