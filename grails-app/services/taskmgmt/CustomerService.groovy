package taskmgmt

import grails.transaction.Transactional

@Transactional
class CustomerService {

    def save(Customer customer) {
        customer.dateCreated = new Date()
        if (customer.validate()) {
            customer.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def update(Customer customer) {
        customer.dateModified = new Date()
        if (customer.validate()) {
            customer.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }

    }

    def delete(Customer customer) {
        customer.dateDeleted = new Date()
        if (customer.validate()) {
            customer.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Delete failed.")
        }
    }

}
