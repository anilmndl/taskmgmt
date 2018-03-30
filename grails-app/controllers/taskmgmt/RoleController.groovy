package taskmgmt
class RoleController {

    RoleService roleService

    static defaultAction = "list"
    static allowedMethods = [delete: 'POST']

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def roleList = Role.createCriteria().list(params) {
            if ( params.query ) {
                and {
                    ilike("title", "%${params.query}%")
                    isNull("dateDeleted")
                }
            }else{
                isNull("dateDeleted")
            }
        }

        [roleList: roleList, listCount: roleList.totalCount]
    }

    def save(Role role) {
        try {
            roleService?.save(role)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editRole: role]
        }
    }

    def edit(Role role) {
        render view: "edit", model: [editRole: role]
    }

    def update(Role role) {
        try {
            roleService?.update(role)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [editRole: role]
        }
    }

    def delete(Role role) {
        try {
            roleService?.delete(role)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def detail(Role role) {
        render view: "detail", model: [detailRole: role]
    }

    def create() {
        render view: "create"
    }
    // def setRolePriority(){
    //     roleService.setRolePriority()
    //    render view:"detail",model:[rolePriority: role]
    //
}

