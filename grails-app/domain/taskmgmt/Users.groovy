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

    Role role

    static  belongsTo = TaskType
    static hasMany = [taskTypes: TaskType]

    static constraints = {
        middleName nullable: true
        dateCreated nullable: true
        dateDeleted nullable:true
        dateModified nullable: true
    }
}