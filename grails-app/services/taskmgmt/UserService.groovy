package taskmgmt

import grails.transaction.Transactional

@Transactional
class UserService {

    def save(Users user) {
        user.save failOnError: true, flush: true

    }
}
