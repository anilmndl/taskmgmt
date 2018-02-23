package taskmgmt

class Task {

    String title
    String detail
    Date dateCreated
    Date dateModified

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
    }
}
