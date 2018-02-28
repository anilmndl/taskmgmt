package taskmgmt

class TaskTypeController {

    TaskTypeService taskTypeService

    def index() {
        redirect action: "list"
    }

    def list(){
        List<TaskType> typeList = TaskType.list()
        render view:"list.gsp", model: [typeList:typeList]
    }

    def create(){
        render view:"create.gsp"
    }

    def save(TaskType taskType){
        taskTypeService.save(taskType)
        redirect action: "list"
    }

    def delete(){
        TaskType taskType = TaskType.get(params.id)
        taskTypeService.delete(taskType)
        redirect action: "list",model:[tasks: Task.list()]
    }

    def edit(){
        TaskType taskType= TaskType.get(params.id)
        render view: "edit", model: [taskType:taskType]
    }

    def update(TaskType taskType){
        taskTypeService.update(taskType)
        redirect action: "list"
    }
}
