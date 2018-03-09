package taskmgmt

class aUserController {
    UserService userService

    static  defaultAction = "list"
    def list() {
        render view: "list",model: [User : Users.findAllByDateDeletedIsNull([orders:"desc",sort:"dateCreated"])]
    }
    def create(){
        render view: "create"
    }
    def edit(Users user) {
        render view: "edit", model: [editUser: user]
    }
    def save(Users user) {
        user.dateCreated = new Date()
        userService.save(user)
        redirect action: "list"
    }
    def detail(Users users) {
        render view: "detail", model: [users: users]
    }
    def delete(Users users){
        userService.delete(users)
        redirect action: "list"
    }
    def update(Users user) {
        userService.update(user)
        redirect action: "list"
    }

}
