package taskmgmt

class Comment {
    String content
    Task task
    User user
    Date dateCreated
    Date dateDeleted
    Date dateModified

    static constraints = {
        user nullable: true
        dateDeleted nullable: true
        dateModified nullable: true
    }

    static mapping = {
        content type: "text"             // this allows to enter text more than 255 characters
    }
}
