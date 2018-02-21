package taskmgmt

class TaskController {
    def index() {
        render view: "list", model: [tasks: Task.list()]
    }

    def create() {
        render view: "create"
    }

    def save(Task mgmt) {
        mgmt.dateCreated = new Date()
        mgmt.dateModified = new Date()

        if (mgmt.validate()) {
            mgmt.save flush: true, failorError: true
            flash.Message = "Sucessfully built."
        } else {
            flash.Message = "Error"
        }
        redirect action: "create"
    }
}
