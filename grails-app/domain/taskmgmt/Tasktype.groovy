package taskmgmt

class Tasktype {

    String topic
    Date dateCreated
    Date dateModified
    String flag


    static constraints = {
        flag nullable:true
    }
}
