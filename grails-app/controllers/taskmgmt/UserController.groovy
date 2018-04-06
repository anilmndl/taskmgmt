package taskmgmt

class UserController {
    UserService userService

    static defaultAction = "list"
    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def userList = Users.createCriteria().list(params) {
            if (params.query) {
                and {
                    ilike("firstName", "%${params.query}%")
                    isNull("dateDeleted")
                }
            } else {
                isNull("dateDeleted")
            }
        }

        [users: userList, listCount: userList.totalCount]
    }

    def create() {
        render view: "create", model: [roles: Role.list()]
    }

    def edit(Users user) {
        render view: "edit", model: [editUser: user, roles: Role.list(), taskTypes: TaskType.list()]
    }

    def save(Users user) {
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

    def detail(Users users) {
        render view: "detail", model: [users: users, taskTypes: TaskType.list()]
    }

    def delete(Users user) {
        try {
            userService?.delete(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def update(Users user) {
        try {
            userService?.update(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editUser: user, roles: Role.list()]
        }
    }

    def subscribe(Users user) {
        TaskType taskType = TaskType.get(params.taskType)
        if (params.isSubscribe == "true") {
            try {
                user.taskTypes.add(taskType)
                flash.message = "Successfully subscribed to " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        }else{
            try {
                user.taskTypes.remove(taskType)
                flash.message = "Successfully unsubscribed from " + taskType.title
            }
            catch (Exception e) {
                flash.message = "There was some error"
            }
        }
        detail(user)
    }
}
