package taskmgmt

import grails.transaction.Transactional

@Transactional
class RoleService {

    def save(Role role) {
        if (role.validate()) {
            role.save failOnError: true, flush: true
            //flash.message = "Role successfully created"
        } else {
            //flash.message = "Oops. Something went wrong. Cannot create.gsp role"
        }
    }

    def delete(Role role) {
        role.dateDeleted = new Date()
        //flash.message = "Role deleted"
    }

    def update(Role role) {
        if (role.validate()) {
            role.dateModified = new Date()
            role.save failOnError: true, flush: true
            //flash.message = "Role successfully update."
        } else {
            //flash.message = "Oops. Something went wrong. Cannot update the role."
        }
    }
}
