package taskmgmt

class TaskController {

    def list() {
        render view: "list", model:[tasks: Task.list()]
    }
}

