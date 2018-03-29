package taskmgmt

import grails.transaction.Transactional

@Transactional
class RoleService {

    def save(Role role) {
        if (role.validate()) {
            role.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def delete(Role role) {
        role.dateDeleted = new Date()
        if (role.validate()) {
            role.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Deletion failed.")
        }
    }

    def update(Role role) {
        role.dateModified = new Date()
        if (role.validate()) {
            role.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }
}
