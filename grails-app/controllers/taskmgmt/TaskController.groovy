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

    }


    def tada() {
        //tada() is when employee gets boored with doing what they are supposed to do and get some fun time
        redirect action: "list"
        //Why are you here if you don't wana work.
        //you're fired
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
}
