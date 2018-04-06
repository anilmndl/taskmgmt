package taskmgmt

import grails.gorm.DetachedCriteria

class TaskTypeController {

    TaskTypeService taskTypeService

    static defaultAction = "list"

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def taskTypeList = TaskType.createCriteria().list(params) {
            if (params.query) {
                and {
                    ilike("title", "%${params.query}%")
                    isNull("dateDeleted")
                }
            } else {
                isNull("dateDeleted")
            }
            order("dateCreated","desc")
        }
        [typeList: taskTypeList, listCount: taskTypeList.totalCount]
    }

    def create() {
        taskTypeService?.create()
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
        render view: "detail", model: [detailTaskType: taskType, taskTypes: TaskType.list()]
    }

    def assign(TaskType taskType){
        TaskType toAssign = TaskType.get(params.taskType)
        if (params.isAssign == "true") {
            try {
                taskType.children.add(toAssign)
                flash.message = "Successfully added" + toAssign.title + "to " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        }else{
            try {
                taskType.children.remove(toAssign)
                flash.message = "Successfully removed " + toAssign.title + "from " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        }
        redirect action: "detail", params:["id": taskType.id]
    }
}


