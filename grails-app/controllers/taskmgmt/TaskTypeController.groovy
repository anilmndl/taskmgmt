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
        render view: "detail", model: [detailTaskType: taskType]
    }
}


