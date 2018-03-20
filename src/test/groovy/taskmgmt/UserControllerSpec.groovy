package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.h2.engine.User
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
<<<<<<< HEAD:src/test/groovy/taskmgmt/EditTagLibSpec.groovy
//@TestFor(EditTagLib)
class EditTagLibSpec extends Specification {
=======
@TestFor(UserController)
//@Mock([Users])
class UserControllerSpec extends Specification {
>>>>>>> cb6d8a045d9a2533b66aee2109d94a3ca04ee277:src/test/groovy/taskmgmt/UserControllerSpec.groovy

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
