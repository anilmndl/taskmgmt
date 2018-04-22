package taskmgmt

import grails.plugin.springsecurity.SpringSecurityService
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    SpringSecurityService springSecurityService

    String username
    String password
    String firstName
    String middleName
    String lastName
    String email
    Address address

    String phoneNumber
    Date dateCreated
    Date dateModified
    Date dateDeleted
    Boolean vacationMode = false
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }
    static constraints = {
        password blank: false, password: true
        username blank: false, unique: true
        middleName nullable: true
        dateDeleted nullable: true
        dateModified nullable: true
        phoneNumber nullable: true
        address nullable: true
        email nullable: true
    }
    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']


    static hasMany = [taskTypes: TaskType, comments: Comment]
    static mapping = {
        table 'tbl_user'
        password column: '`password`'
    }
}
