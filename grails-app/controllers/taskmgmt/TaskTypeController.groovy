package taskmgmt

class TaskTypeController {

    TaskTypeService taskTypeService

    static defaultAction = "list"

    def list() {
        // render view: "list", model: [typeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"])]
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

}