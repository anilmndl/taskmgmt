package taskmgmt

class RoleController {

    RoleService roleService

    static defaultAction = "list"

    def list() {
        render view: "list", model: [roleList: Role.findAllByDateDeletedIsNull([order: "desc", sort: "dateCreated"])]
    }

    def save(Role role) {
        roleService.save(role)
        redirect action: "list"
    }

    def edit(Role role) {
        render view: "edit", model: [editRole: role]
    }

    def update(Role role) {
        roleService.update(role)
        redirect action: "list"
    }

    def delete(Role role) {
        roleService.delete(role)
        redirect action: "list"
    }

    def detail(Role role) {
        render view: "detail", model: [detailRole: role]
    }

    def create() {
        render view: "create"
    }
}
