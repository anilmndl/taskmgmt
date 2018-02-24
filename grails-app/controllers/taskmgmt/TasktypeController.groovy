package taskmgmt

class TasktypeController {

    TaskTypeService taskTypeService

    def index() {
        render view:"list.gsp"
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

    }

    def edit(Tasktype taskType){
        taskTypeService.update(taskType)
        redirect action: "index"
    }
}
