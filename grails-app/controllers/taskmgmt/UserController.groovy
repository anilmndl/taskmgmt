package taskmgmt

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {
    UserService userService

    static defaultAction = "list"
    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list(User user) {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def userList = User.createCriteria().list(params) {
            if (params.query) {
                and {
                    ilike("firstName", "%${params.query}%")
                    isNull("dateDeleted")
                }
            } else {
                isNull("dateDeleted")
            }
        }

        [user: user, listCount: user]
    }

    def create() {
        render view: "create", model: [roles: Role.list()]
    }

    def edit(User user) {
        render view: "edit", model: [editUser: user, roles: Role.list(), taskTypes: TaskType.list()]
    }

    def save(User user) {
        try {
            userService?.save(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editUser: user, roles: Role.list()]
            //redirect action: edit(user)
        }
    }

    def detail(User users) {
        render view: "detail", model: [users: users, taskTypes: TaskType.list()]
    }

    def delete(User user) {
        try {
            userService?.delete(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def update(User user) {
        try {
            userService?.update(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editUser: user, roles: Role.list()]
        }
    }

    def subscribe(User user) {
        TaskType taskType = TaskType.get(params.taskType)
        if (params.isSubscribe == "true") {
            try {
                user.taskTypes.add(taskType)
                flash.message = "Successfully subscribed to " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        } else {
            try {
                user.taskTypes.remove(taskType)
                flash.message = "Successfully unsubscribed from " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        }
        redirect action: "detail", params: ["id": user.id]
    }

    def Vacation(User user) {
        try {
            userService?.Vacation(user)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [users: user]
    }

    def Working(User user){
        try {
            userService?.Working(user)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [users: user]
    }
}
