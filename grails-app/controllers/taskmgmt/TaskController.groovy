package taskmgmt

import taskmgmt.enums.TaskStatus

class TaskController {

    TaskService taskService

    //page will be redirected to list() method by default instead of "index"
    static defaultAction = "list"

    def delete(Task task) {
        taskService.delete(task)
        redirect action: "list"
    }

    def completed(Task task) {
        taskService.complete(task)
        redirect action: "listCompleted"
    }

    def edit(Task task) {
        render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByFlag("created")]
    }

    def update(Task task) {
        taskService.update(task)
        redirect action: "list"
    }

    def list() {
        render view: "list", model: [tasks: Task.findAllByTaskStatus(TaskStatus.CREATED, [sort: "dateCreated", order: "desc"])]
    }

    def create() {
        //taskService?.createTask()

        // Task task=Task.get(params.id)
        render view: "create", model: [taskTypeList: TaskType.findAllByFlag("created")]
    }

    def detail(Task tasks) {
        render view: "detail", model: [tasks: tasks]
    }

    def listCompleted() {
        render view: "completed", model: [tasks: Task.findAllByTaskStatus(TaskStatus.COMPLETED, [order: "desc", sort: "dateCompleted"])]
    }

    def save(Task task) {
        List<TaskType> taskTypeList = params.list()
        taskTypeList.each { list->
            if(list.title == task.taskTypeName)
            {
                task.taskType = list
            }
        }
        taskService.save(task)
        redirect action: "list"
    }
}
