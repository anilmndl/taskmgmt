package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import grails.test.mixin.web.GroovyPageUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TaskController)
@TestMixin(GroovyPageUnitTestMixin)
@Mock([Task])
class TaskControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "list_displays_a_list_of_tasks"() {
        when:
            controller.list()
            String result = render(view: view, model: model)
        then:
            response.status == 200
            view == "/task/list"
            result.size() > 0
    }

    void "create_redirects_to_list_action"(){
        when:
            controller.create()

        then:
            response.status == 302
            response.redirectedUrl == "/task/list"
    }
}
