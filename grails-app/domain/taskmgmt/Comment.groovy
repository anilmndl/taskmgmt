package taskmgmt

class Comment {
    String comment
    Task task
    User user
    Date dateCreated
    Date dateDeleted
    Date dateModified

    static constraints = {
        dateDeleted nullable: true
        dateModified nullable: true
    }

    static mapping = {
        comment type: "text"             // this allows to enter text more than 255 characters
    }
}
