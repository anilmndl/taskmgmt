package taskmgmt

<<<<<<< HEAD
=======
import grails.test.mixin.Mock
>>>>>>> develop
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
<<<<<<< HEAD
=======
@Mock([Role])
>>>>>>> develop
@TestFor(RoleController)
class RoleControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

<<<<<<< HEAD
    void "test something"() {
        expect:"fix me"
            true == false
=======
    void "role_controller_defaultAction"() {
        when:
        controller

        then:
        controller.defaultAction == 'list'
        response.status == 200
    }

    void "role_controller_list_action"() {
        when:
        controller.list()

        then:
        response.status == 200
        view == '/role/list'
    }

    void "role_controller_edit_action"() {
        when:
        controller.edit()

        then:
        response.status == 200
        view == '/role/edit'
    }

    void "role_controller_detail_action_render_view"(){
        when:
        controller.detail()

        then:
        response.status == 200
        view == '/role/detail'
    }

    void "role_controller_create_action_render_view"(){
        when:
        controller.create()

        then:
        response.status == 200
        view == '/role/create'
>>>>>>> develop
    }
}
