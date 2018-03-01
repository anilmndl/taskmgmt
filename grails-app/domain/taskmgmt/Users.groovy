package taskmgmt

class Users {

    String firstName
    String middleName
    String lastName
    String address
    long phoneNumber
    Date dateCreated

    static constraints = {
        dateCreated nullable: true
    }
}