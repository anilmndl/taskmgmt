package taskmgmt

import grails.transaction.Transactional

@Transactional
class UserService {

    def save(Users user) {
        user.dateCreated = new Date()
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def delete(Users users) {
        users.dateDeleted = new Date()
        if (users.validate()) {
            users.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Deletion failed.")
        }

    }

    def update(Users user) {
        user.dateModified = new Date()
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def Vacation(Users user){
        user.vacationMode= true
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def Working(Users user){
        user.vacationMode=false
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }
}
