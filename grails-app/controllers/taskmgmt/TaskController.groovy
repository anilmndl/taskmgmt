package taskmgmt

class TaskController {

    TaskService taskService

    def delete() {

        Task task=Task.get(params.id)
       taskService.delete(task)
        redirect action: "list",model: [tasks: Task.list()]
    }

    def index() {
        render view: "list.gsp", model: [tasks: Task.list()]
    }

    def edit(Task task){
        render view: "edit.gsp", model: [editTask: task]
    }

    def update(Task task) {
        taskService.update(task)
        redirect action: "list"
    }

    def list() {
        render view: "list.gsp", model: [tasks: Task.list()]
    }

    def create() {
        // Task task=Task.get(params.id)
        render view: "create.gsp"
    }

    def detail() {

        Task tasks = Task.get(params.id)
        render view: "detail.gsp", model: [tasks: tasks]
    }

    def save(Task taskmgmt) {
        taskService.save(taskmgmt)
        redirect action: "list"
    }
}
