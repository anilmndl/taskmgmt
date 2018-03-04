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
    Integer rolePriority =1 //low priority if nothing is set

    static constraints = {
        address nullable: true
        phoneNumber nullable: true
        dateDeleted nullable: true
    }
}
