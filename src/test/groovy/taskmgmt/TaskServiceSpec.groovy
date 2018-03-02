package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.validation.ValidationException
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TaskService)
@Mock([Task])
class TaskServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "create_task_inserts_a_new_task_in_the_db"() {
        when:
        service.createTask("Test Task")

        then:
        Task.list() != null
        Task.get(1).title == "Test Task"
    }

    void "create_task_throws ValidationException if title is empty or null"() {
        when:
        service.createTask()

        then:
        thrown ValidationException
    }

        void "deleted_task should set the dateDeleted to date else null"() {
        when:
        service.delete(Task)
        then:
        Task.list() != null
        Task.listOrderByDateDeleted().get(1).dateDeleted != null
    }
}
