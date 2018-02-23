package taskmgmt

class TasktypeController {

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
        tasktypeService.save(tskType)
        redirect action: "list"
    }
}
