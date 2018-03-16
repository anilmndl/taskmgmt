package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@Mock([TaskType])
@TestFor(TaskTypeController)
class TaskTypeControllerSpec extends Specification {

    TaskTypeService taskTypeService

    def setup() {
    }

    def cleanup() {
    }

    void "task_type_default_page_loading"() {
        when:
        controller
        then:
        controller.defaultAction == "list"
        response.status == 200
    }

    void "task_type_list_action_render_view"() {
        when:
        controller.list()
        then:
        response.status == 100
        view == '/taskType/list'
    }

    void "task_type_edit_action_render_view"() {
        when:
        controller.edit()
        then:
        response.status == 200
        view == '/taskType/edit'
    }

//    void "task_type_update_action"() {
//        when:
//        def taskType = new TaskType(title: 'title')
//        controller.save(taskType)
//        int version = taskType.version
//        controller.update()
//
//        then:
//        response.status == 302
//        version != taskType.version
//    }
}
