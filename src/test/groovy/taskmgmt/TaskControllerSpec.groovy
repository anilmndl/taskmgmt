package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import grails.test.mixin.web.GroovyPageUnitTestMixin
import grails.util.Holders
import spock.lang.Specification

import javax.xml.ws.Holder

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TaskController)
@TestMixin(GroovyPageUnitTestMixin)
@Mock([Task, TaskType, Users])
class TaskControllerSpec extends Specification {

    TaskService taskService

    static doWithSpring = {
        taskService(TaskService)
    }

    def setup() {
        taskService = Holders.grailsApplication.mainContext.getBean("taskService")
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
            taskService.testService()
            controller.create()


        then:
//            response.status == 302
//            response.redirectedUrl == "/task/list"
            true == false
    }
}
