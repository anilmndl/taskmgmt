package taskmgmt

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class Customer {
    String firstName
    String lastName
    String country
    String mailingAddress1
    String mailingAddress2
    String city
    String state
    Integer zipCode
    long phoneNumber
    String email
    Date dateCreated
    Date dateModified
    Date dateDeleted
    static hasMany = [tasks: Task]

    static constraints = {
        mailingAddress1 nullable: true
        mailingAddress2 nullable: true
        country nullable: true
        city nullable: true
        state nullable: true
        zipCode nullable: true
        phoneNumber nullable: true
        dateDeleted nullable: true
        dateModified nullable: true
    }
}
