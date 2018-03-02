package taskmgmt

class Users {

    String firstName
    String middleName
    String lastName
    String address
    long phoneNumber
    Date dateCreated
    Date dateModified
    Date dateDeleted

    static constraints = {
        dateCreated nullable: true
        dateDeleted nullable:true
        dateModified nullable: true
    }
}