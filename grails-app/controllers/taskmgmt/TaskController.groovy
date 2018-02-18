package taskmgmt

class TaskController {

    TaskService taskService

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        render view: "list",
                model:
                        [
                                tasks: Task.list()
                        ]
    }

    def redirect() {
        //change


    }
    def detail() {
//
    }

    def edit() {
        //
    }

    def update(){
        render view: "list"
    }

    def create(){
        taskService.createTask()
        redirect action: "list"
    }
    def index(){
        render view: "index"
    }
}
