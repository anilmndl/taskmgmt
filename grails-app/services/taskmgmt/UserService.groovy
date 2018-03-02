package taskmgmt

import grails.transaction.Transactional

@Transactional
class UserService {

    def save(Users user) {
        user.save failOnError: true, flush: true

    }
    def delete(Users users){
        users.dateDeleted= new Date()
        users.save failonError:false, flush:false

    }
    def update(Users user) {
        user.dateModified = new Date()
        user.save failOnError: true, flush: true
    }
}
