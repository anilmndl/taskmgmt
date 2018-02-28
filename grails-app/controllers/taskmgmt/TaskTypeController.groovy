package taskmgmt

class TaskTypeController {

    TaskTypeService taskTypeService

    def index() {
        redirect action: "list"
    }

    def list() {
        render view: "list.gsp", model: [typeList: Task.list()]
    }

    def create() {
        render view: "create.gsp"
    }

    def save(TaskType taskType) {
        taskTypeService.save(taskType)
        redirect action: "list"
    }

    def delete(TaskType taskType) {
        taskTypeService.delete(taskType)
        redirect action: "list", model: [tasks: Task.list()]
    }

    def edit(TaskType taskType) {
        render view: "edit", model: [taskType: taskType]
    }

    def update(TaskType taskType) {
        taskTypeService.update(taskType)
        redirect action: "list"
    }
}
