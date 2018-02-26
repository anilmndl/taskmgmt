package taskmgmt

class TasktypeController {

    TaskTypeService taskTypeService

    def index() {
        redirect action: "list"
    }

    def list(){
        List<Tasktype> typeList = Tasktype.list()
        render view:"list.gsp", model: [typeList:typeList]
    }

    def create(){
        render view:"create.gsp"
    }

    def save(Tasktype tskType){
        taskTypeService.save(tskType)
        redirect action: "list"
    }

    def delete(){
        redirect action: "list"
    }

    def edit(){
        Tasktype taskType= Tasktype.get(params.id)
        render view: "edit", model: [taskType:taskType]
    }

    def update(Tasktype taskType){
        taskTypeService.update(taskType)
        redirect action: "list"
    }
}
