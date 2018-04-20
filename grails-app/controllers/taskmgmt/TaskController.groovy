package taskmgmt

import org.h2.engine.User
import taskmgmt.enums.TaskStatus

import java.text.DateFormat
import java.text.ParseException
import java.text.SimpleDateFormat

class TaskController {

    TaskService taskService

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    //page will be redirected to list() method by default instead of "index"
    static defaultAction = "list"

    def delete(Task task) {
        try {
            taskService.delete(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def completed(Task task) {
        try {
            taskService?.complete(task)
            taskService?.assignRandomTaskToRandomUser(task)
            redirect action: "listCompleted"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "detail", model: [tasks: task]
        }
    }

    def edit(Task task) {
        def userList = Users.createCriteria().list(params) {
            and {
                isNull("dateDeleted")
                eq("vacationMode", false)
            }
            order("dateCreated", "desc")
        }
        render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: userList, customerList: Customer.list()]
    }

    def update(Task task) {
        if ((task.title == null || task.detail == null) && task.taskType != null) {
            task = taskService?.createTask(task)
        }
        try {
            taskService?.update(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list()]
        }

    }

    // The date picker needs all fields to be filled to search after a date
    // need to make it better. For ex if a user selects one portion like a day of date, other field should be required
    // trying to figure out how to search through task.taskType
    // SanRIZZ .................
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def tasks = Task.createCriteria().list(params) {
            and {
                isNull("dateDeleted")
                isNull("dateCompleted")
                if (params.query && params.date && params.taskType) {
                    and {
                        ilike("title", "%${params.query}%")
                        eqProperty("taskType", "%${params.taskType}%")
                    }
                } else if (params.query && params.date) {
                    and {
                        ilike("title", "%${params.query}%")
                        gt("dateCreated", params.date)
                    }
                } else if (params.query && params.taskType) {
                    and {
                        ilike("title", "%${params.query}%")
                        eqProperty("taskType", "%${params.taskType}%")
                    }
                } else if (params.taskType && params.date) {
                    gt("dateCreated", params.date)
                    eqProperty("taskType", "%${params.taskType}%")
                } else if (params.date) {
                    gt("dateCreated", params.date)
                } else if (params.query) {
                    ilike("title", "%${params.query}%")
                } else if (params.taskType) {
                    eqProperty("taskType", "%${params.taskType}%")
                } else {
                    true
                }
            }
            order("dateCreated", "desc")
        }
        render view: "list", model: [tasks: tasks, listCount: Task.findAllByDateCompletedIsNullAndDateDeletedIsNull().size(), taskTypeList: TaskType.
                findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"])]
    }

    def create() {
        def userList = Users.createCriteria().list(params) {
            and {
                isNull("dateDeleted")
                eq("vacationMode", false)
            }
            order("dateCreated", "desc")
        }
        render view: "create",
                model: [taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]),
                        userList    : userList, customerList: Customer.findAllByDateDeletedIsNull()]
    }

    def detail(Task task) {
        def commentList = Comment.createCriteria().list(params) {
            and {
                //eq("task_id","${task.id}")
                isNull("dateDeleted")
            }
            order("dateCreated", "desc")
        }

        def userList = Users.createCriteria().list(params) {
            and {
                isNull("dateDeleted")
                eq("vacationMode", false)
            }
            order("dateCreated", "desc")
        }

        render view: "detail", model: [tasks: task, commentList: commentList, userList: userList]

    }

    def listCompleted() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def taskList = Task.createCriteria().list(params) {
            if (params.query) {
                and {
                    isNull("dateDeleted")
                    isNotNull("dateCompleted")
                    ilike("title", "%${params.query}%")
                }
            } else {
                isNull("dateDeleted")
                isNotNull("dateCompleted")
            }
        }
        render view: "completed", model: [tasks: taskList, listCount: Task.findAllByDateCompletedIsNotNullAndDateDeletedIsNull().size()]
    }

    def save(Task task) {
        if ((task.title == null || task.detail == null) && task.taskType != null) {
            task = taskService?.createTask(task)
        }
        if ((task.users == null)) {
            task = taskService?.randomUser(task)
        }
        try {
            taskService?.save(task)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editTask: task, taskTypeList: TaskType.findAllByDateDeletedIsNull([sort: "dateCreated", order: "desc"]), userList: Users.list()]
        }

    }

    def unassigned(Task task) {
        try {
            taskService?.unassigned(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [tasks: task]
    }

    def assigned(Task task) {
        try {
            taskService?.assigned(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [tasks: task]
    }

    def inProgress(Task task) {
        try {
            taskService?.inProgress(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [tasks: task]
    }

    def myTask() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def taskList = Task.createCriteria().list(){
            eq("taskType",TaskStatus.COMPLETED)
            order("dateCreated","desc")
        }
        render view: "list", model: [tasks: taskList,listCount: taskList.size()]
    }

    def saveComment(Comment comment) {
        try {
            taskService.commentSave(comment)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        redirect action: "detail", id:params.task

    }

    def reassignTask(Task task) {
        try {
            taskService?.update(task)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        //redirects to details page
        detail(task)
    }
}