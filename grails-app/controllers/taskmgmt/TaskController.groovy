package taskmgmt

class TaskController {

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        render view: "list", model: [tasks: Task.list()]
    }
}
