package taskmgmt

class TaskTypeController {

    TaskTypeService taskTypeService

    static defaultAction = "list"

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list() {
        render view: "list", model: [typeList: TaskType.list(params), listCount: TaskType.count()]
    }

    def create() {
        render view: "create"
    }

    def save(TaskType taskType) {
        taskTypeService.save(taskType)
        redirect action: "list"
    }

    def delete(TaskType taskType) {
        taskTypeService.delete(taskType)
        redirect action: "list"
    }

    def edit(TaskType taskType) {
        render view: "edit", model: [taskType: taskType]
    }

    def update(TaskType taskType) {
        taskTypeService?.update(taskType)
        redirect action: "list"
    }

    def detail(TaskType taskType) {
        render view: "detail", model: [detailTaskType: taskType]
    }
}


