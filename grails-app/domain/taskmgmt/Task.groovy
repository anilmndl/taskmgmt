package taskmgmt

class Task {

    String title
    String detail
    Date dateCreated
    Date dateModified
    String flag

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        flag nullable: true
    }
}
