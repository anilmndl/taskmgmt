package taskmgmt


class Role {

    String title
    String description
    Date dateCreated
    Date dateModified
    Date dateDeleted

    //can be uncommented when User domain class is created
    //static hasMany = [users: User]
    static constraints = {
        description nullable: true
        dateModified nullable: true
        dateDeleted nullable: true
    }

    static mapping = {
        description type: "text"             // this allows to enter text more than 255 characters
    }
}
