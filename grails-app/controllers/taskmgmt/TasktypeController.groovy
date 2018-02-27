package taskmgmt

class TasktypeController {

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

    def save(TaskType tskType){
        taskTypeService.save(tskType)
        redirect action: "list"
    }

    def delete(){
        Tasktype taskType = Tasktype.get(params.id)
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
