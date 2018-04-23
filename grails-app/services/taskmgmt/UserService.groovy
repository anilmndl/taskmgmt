package taskmgmt

import grails.transaction.Transactional

@Transactional
class UserService {

    def save(User user, Address address) {
        user.dateCreated = new Date()
        address.save failOnError: true, flush: true
        user.address = address
        user.save failOnError: true, flush: true
    }

    def delete(User users) {
        users.dateDeleted = new Date()
        if (users.validate()) {
            users.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Deletion failed.")
        }

    }

    def update(User user, Address address) {
        user.dateModified = new Date()
        address.save failOnError: true
        user.address = address
        user.save failOnError: true, flush: true
    }

    def Vacation(User user) {
        user.vacationMode = true
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def Working(User user) {
        user.vacationMode = false
        if (user.validate()) {
            user.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def ChanePassword(User user) {
        user.vacationMode=true
        if (user.validate()) {
            user.save failsOnError: true, flush: true
        }
        else{
            throw new Exception("Password Change Failed")
        }
    }
}
