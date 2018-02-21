package taskmgmt

class TaskController {

    TaskService taskService

    def list() {
        render view: "list",model:[tasks: Task.list()]
    }

    def redirect() {
        //change

    }

    def detail() {
    }

    def edit() {
    }

    def update() {
        render view: "list"
    }

    def save(Task mgmt) {
        mgmt.dateCreated = new Date()
        mgmt.dateModified = new Date()
    }

    def delete() {

    }

    def create() {
        taskService.createTask()
        redirect action: "list"
    }
    def index() {
        render view: "index"
        if (mgmt.validate()) {
            mgmt.save flush: true, failorError: true
            flash.Message = "Sucessfully built."
        } else {
            flash.Message = "Error"
        }
        redirect action: "create"

    }
}

