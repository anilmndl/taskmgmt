package taskmgmt

class Task {

    String title
    Date dateCreated
    Date dateModified

    static constraints = {
        dateCreated nullable: true
        dateModified nullable: true
    }
}
