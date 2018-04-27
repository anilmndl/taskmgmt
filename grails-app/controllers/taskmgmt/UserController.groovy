package taskmgmt

import grails.plugin.springsecurity.SpringSecurityService

class UserController {
    UserService userService
    SpringSecurityService springSecurityService
    static defaultAction = "list"
    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def userList = User.createCriteria().list(params) {
            if (params.query) {
                and {
                    or {
                        ilike("firstName", "%${params.query}%")
                        ilike("lastName", "%${params.query}%")
                        ilike("lastName", "%${params.query}%")
                        ilike("phoneNumber", "%${params.query}%")
                    }
                    isNull("dateDeleted")
                }
            } else {
                isNull("dateDeleted")
            }
        }

        [userList: userList, listCount: User.count()]
    }

    def create() {
        render view: "create", model: [roles: Role.list()]
    }

    def edit(User user) {
        //if(springSecurityService.currentUser == user || springSecurityService.currentUser.getAuthorities()[0].authority == "ROLE_ADMIN"){
        render view: "edit", model: [editUser: user, roles: Role.list(), taskTypes: TaskType.list()]
    }


    def save(User user, Address address) {
        try {
            Role role = Role.get(params.role)
            userService?.save(user, address)
            UserRole.create(user, role)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "create", model: [user: user, address: address, roles: Role.list()]
            //redirect action: edit(user)
        }
    }

    def detail(User user) {
        def subscribeTaskType = user.taskTypes.sort { a, b ->
            a.id <=> b.id
        }

        def unSubscribedTaskTypes = TaskType.list()
        unSubscribedTaskTypes.removeAll(subscribeTaskType)

        render view: "detail", model: [user                 : user, taskTypes: TaskType.list(), subscribeTaskType: subscribeTaskType,
                                       unSubscribedTaskTypes: unSubscribedTaskTypes,
                                       authority            : springSecurityService.currentUser.getAuthorities()[0]]
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

    def update(User user, Address address) {
        try {
            Role role = Role.get(params.role)
            userService?.update(user, address)
            UserRole.create(user, role)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editUser: user, address: address, roles: Role.list()]
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
        render view: "detail", model: [user: user]
    }

    def Working(User user) {
        try {
            userService?.Working(user)
        }
        catch (Exception e) {
            flash.message = e.getMessage()
        }
        render view: "detail", model: [user: user]
    }

    def UserInfo(User user) {
        render view: "changePassword", model: [editUser: user]
    }
}
