package taskmgmt

class TaskController {

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        // added a comment
        render view: "list", model: [tasks: Task.list()]
    }
}
