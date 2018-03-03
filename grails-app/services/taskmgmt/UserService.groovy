package taskmgmt

import grails.transaction.Transactional

@Transactional
class UserService {

    def save(Users user) {
        if (user.validate()){
            user.save failOnError: true, flush: true
    }
    }
    def delete(Users users){
        users.dateDeleted= new Date()
        users.save failonError:false, flush:false

    }
    def update(Users user) {
        user.dateModified = new Date()
        if (user.validate()) {
            user.save failOnError: true, flush: true
        }
    }
}
