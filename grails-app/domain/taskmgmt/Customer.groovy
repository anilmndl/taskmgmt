package taskmgmt

class Customer {
    String firstName
    String lastName
    String address
    Integer phoneNumber
    String email
    Date dateCreated
    Date dateModified
    Date dateDeleted
    static hasMany = [tasks: Task]

    static constraints = {
        address nullable: true
        phoneNumber nullable: true
        dateDeleted nullable: true
        dateModified nullable: true
    }
}
