package taskmgmt

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes = 'authority')
@ToString(includes = 'authority', includeNames = true, includePackage = false)
class Role implements Serializable {

    private static final long serialVersionUID = 1
    String authority
    String title
    String description
    Date dateCreated
    Date dateModified
    Date dateDeleted
    static constraints = {
        authority blank: false, unique: true
        description nullable: true
        dateModified nullable: true
        dateDeleted nullable: true

    }
    static hasMany = [users: User]

    static mapping = {
        cache true
        description type: "text"
    }
}
