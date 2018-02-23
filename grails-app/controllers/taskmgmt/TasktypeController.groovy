package taskmgmt

class TasktypeController {

    TaskTypeService taskTypeService

    def index() {
        render view:"list.gsp"
    }

    def list(){
        render view:"list.gsp"
    }

    def create(){
        render view:"create.gsp"
    }

    def save(Tasktype tskType){
        taskTypeService.save(tskType)
        redirect action: "list"
    }
}
