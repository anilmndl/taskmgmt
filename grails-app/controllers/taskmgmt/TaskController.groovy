package taskmgmt

class TaskController {
TaskService taskService
    
    def index() {
        render view: "list", model: [tasks: Task.list()]
    }
    def create(){
        render view:"create"
    }
    def save(Task taskmgmt){
        taskService.save(taskmgmt)
        redirect action: "create"
    }

}
