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
    Boolean vacationMode = false
    Role role

    static hasMany = [taskTypes: TaskType, comments: Comment]

    static constraints = {
        vacationMode nullable: true
        middleName nullable: true
        dateCreated nullable: true
        dateDeleted nullable: true
        dateModified nullable: true
    }
}