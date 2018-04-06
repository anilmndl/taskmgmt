package taskmgmt

class TaskType {

    String title
    String identifier    // use this to find specific task type. The title may change in future but identifier should never change
    String description   //description of the task type
    Date dateCreated
    Date dateModified
    Date dateDeleted

    static hasMany = [tasks: Task, users: Users]

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        dateDeleted nullable:true
        identifier nullable: true
        users nullable: true
    }

    static mapping = {
        description type: "text"             // this allows to enter text more than 255 characters
    }
}
