package taskmgmt

class TaskController {

    TaskService taskService

    def delete() {
        Task task=Task.get(params.id)
       taskService.delete(task)
        redirect action: "list",modle:[tasks: Task.list()]
    }
    
    def index() {
        render view: "list", model: [tasks: Task.list()]
    }

    def list() {
        render view: "list", model: [tasks: Task.list()]
    }

    def create(){
<<<<<<< HEAD
        render view: "main"
    }

    def listssss(){
=======
       // Task task=Task.get(params.id)
        render view:"create"
    }
>>>>>>> 706bd607ca0e90a2afa5aed68cfc1523e14dcf82

    def detail(){
        Task tasks = Task.get(params.id)
        render view:"detail", model: [tasks: tasks]
    }
    def save(Task taskmgmt){
        taskService.save(taskmgmt)
        redirect action: "list"
    }
}
