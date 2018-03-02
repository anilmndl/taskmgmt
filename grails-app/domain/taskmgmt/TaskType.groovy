package taskmgmt

class TaskType {

    String title
    String identifer                // use this to find specific task type. The title may change in future but identifier should never change

    Date dateCreated
    Date dateModified
    Date dateDeleted

    static hasMany = [tasks: Task]

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        dateDeleted nullable: true
        identifer nullable: true
    }
}
