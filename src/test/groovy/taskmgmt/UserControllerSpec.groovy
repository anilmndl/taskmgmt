package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.h2.engine.User
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */

//@TestFor(EditTagLib)
class EditTagLibSpec extends Specification {
    @TestFor(UserController)
//@Mock([User])
    class UserControllerSpec extends Specification {

        def setup() {
        }

        def cleanup() {
        }
//
//    void "test_render"() {
//        when:
//        controller.list()
//        String result = render(view:view, model:model)
//
//        then:
//        response.status == 200
//        view == "/user/list"
//        result.size() > 0
//    }
    }
}