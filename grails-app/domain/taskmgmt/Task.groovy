package taskmgmt

class Task {

    String title
    Date dateCreated
    Date dateModified
    String flag

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
        flag nullable: true
    }
}
