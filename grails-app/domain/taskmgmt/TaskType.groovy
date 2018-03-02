package taskmgmt

class TaskType {

    String title
    String identifer                // use this to find specific task type. The title may change in future but identifier should never change

    Date dateCreated
    Date dateModified
    String flag                     // What does this flag do? This is very confusing. AM 02/26/2018

    static hasMany = [tasks: Task]

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        flag nullable:true
        identifer nullable: true
    }
}
