package taskmgmt

class UserController {
    UserService userService

    static  defaultAction = "list"
    def list() {
        render view: "list",model: [users : Users.list()]
    }
    def create(){
        render view: "create"
    }
    def save(Users user) {
        userService.save(user)
        redirect view: "list"
    }
    def detail(Users users) {
        render view: "detail", model: [users: users]
    }

}
