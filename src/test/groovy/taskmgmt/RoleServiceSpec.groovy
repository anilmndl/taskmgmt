package taskmgmt

<<<<<<< HEAD
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
=======
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@Mock([Role])
>>>>>>> develop
@TestFor(RoleService)
class RoleServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

<<<<<<< HEAD
    void "test something"() {
        expect:"fix me"
            true == false
=======
    void "role_service_save_method_saves_role_in_db"() {
        when:
        //create instance of Role object
        def role = new Role(title: "title")
        //call save method on role
        service.save(role)

        then:
        role.version != null && role.version == 0
        role.dateDeleted == null
    }

    void "role_service_save_method_doesn't_save_when_!validate"() {
        when:
        //creates instance of Role object with empty fields
        def role = new Role()
        //call save method on role
        service.save(role)

        then:
        role.version == null
    }

    void "role_service_delete_method_soft_deletes"() {
        when:
        when:
        //create instance of Role object
        def role = new Role(title: "title")
        //call save method on role
        service.save(role)
        //date deleted before soft delete
        def deleted = role.dateDeleted
        //soft deletes role
        service.delete(role)

        then:
        role.version != null
        deleted == null
        role.dateDeleted != null
    }

    void "role_service_update_method_updates_data_in_database"() {
        //save confirmed first
        when:
        //creates instance of Role object
        def role = new Role(title: "title")
        //call save method on role
        service.save(role)
        //date created and date modified before update
        def modified = role.dateModified
        def created = role.dateCreated

        then:
        //version is acquired only when it's saved in database
        role.version != null
        //should be created first hand to be update
        created != null

        //update is done after it's saved
        when:
        //call update method on role
        service.update(role)

        then:
        role.dateModified != null
        modified == null
    }

    void "role_service_update_method_reupdating_is_same_as_updating"() {
        //save confirmed first
        when:
        //creates instance of Role object
        def role = new Role(title: "title")
        //call save method on role
        service.save(role)
        //date created and before update
        def created = role.dateCreated

        then:
        //version is acquired only when it's saved in database
        role.version != null
        //should be created first hand to be update
        created != null

        //update is done after it's saved
        when:
        //call update method on role
        service.update(role)
        def version = role.version
        //update it again
        service.update(role)

        then:
        version != null
        role.dateModified != null
        //if it had been updated before before then it should version should change
        version != role.version
    }

    void "role_service_update_method_doesn't_update_when_!validate"() {
        //save confirmed first
        when:
        //creates instance of Role object with empty fields
        def role = new Role()
        //call save method on role
        service.save(role)
        //date modified before update
        def modified = role.dateModified

        then:
        //version is acquired only when it's saved in database
        role.version == null
        //should be created first hand to be update
        role.dateCreated == null

        //if update is done without having it saved first hand
        when:
        //call update method on role
        service.update(role)

        then:
        modified == null
        role.dateModified == null
        role.dateCreated == null
>>>>>>> develop
    }
}
