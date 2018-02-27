package taskmgmt

class TaskController {

    TaskService taskService

    def list() {
        render view: "list.gsp", model: [tasks: Task.list()]
    }


    def create(){

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
