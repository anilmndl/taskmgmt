package taskmgmt

class TaskType {

    String title
    String identifier    // use this to find specific task type. The title may change in future but identifier should never change
    String description   //description of the task type

    Date dateCreated
    Date dateModified
    Date dateDeleted
    //String flag                     // What does this flag do? This is very confusing. AM 02/26/2018

    static hasMany = [tasks: Task]

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        dateDeleted nullable:true
        identifier nullable: true
    }

    static mapping = {
        description type: "text"             // this allows to enter text more than 255 characters
    }
}
