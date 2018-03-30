package taskmgmt

class UserController {
    UserService userService

    static  defaultAction = "list"
    //delete() method is only allows POST request
    static  allowedMethods = [delete: 'POST']

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
    def create(){
        render view: "create", model: [roles: Role.list()]
    }
    def edit(Users user) {
        render view: "edit", model: [editUser: user, roles: Role.list()]
    }
    def save(Users user) {
        try {
            userService?.save(user)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editUser: user, roles: Role.list()]
        }
    }
    def detail(Users users) {
        render view: "detail", model: [users: users]
    }
    def delete(Users user){
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

}
