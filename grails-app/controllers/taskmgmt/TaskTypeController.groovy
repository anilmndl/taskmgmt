package taskmgmt
import grails.gorm.DetachedCriteria
class TaskTypeController {

    TaskTypeService taskTypeService

    static defaultAction = "list"

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list() {
        params.max=10
        DetachedCriteria query = new DetachedCriteria(TaskType)
        if(params.title){
            query= query.build {
                ilike "title", "%${params.title}%"
            }
        }


        render view: "list", model: [typeList: query.list([sort: "dateCreated", order: "desc"]), listCount: TaskType.count()]
    }

    def create() {
        render view: "create"
    }

    def save(TaskType taskType) {
        try {
            taskTypeService?.save(taskType)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [taskType: taskType]
        }
    }

    def delete(TaskType taskType) {
        try {
            taskTypeService.delete(taskType)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def edit(TaskType taskType) {
        render view: "edit", model: [taskType: taskType]
    }

    def update(TaskType taskType) {
        try {
            taskTypeService?.update(taskType)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [taskType: taskType]
        }
    }

    def detail(TaskType taskType) {
        render view: "detail", model: [detailTaskType: taskType]
    }
}


