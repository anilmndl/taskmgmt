package taskmgmt

class TaskController {

    TaskService taskService

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        // added a comment
        render view: "list", model: [tasks: Task.list()]
    }

    def create(){
        taskService.createTask()
        redirect action: "list"
    }
}
