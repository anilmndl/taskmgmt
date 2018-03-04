package taskmgmt

import grails.transaction.Transactional

@Transactional
class CustomerService {

    def save(Customer customer) {
        customer.dateCreated = new Date()
        customer.dateModified = new Date()
        customer.save failOnError: true, flush: true
    }

    def update(Customer customer) {
        customer.dateModified = new Date()
        customer.save failOnError: true, flush: true
    }

    def delete(Customer customer) {
        customer.dateModified = new Date()
        customer.dateDeleted = new Date()
        customer.save failOnError: true, flush: true
    }
}
