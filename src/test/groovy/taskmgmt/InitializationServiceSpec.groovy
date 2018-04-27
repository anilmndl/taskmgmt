package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(InitializationService)
@Mock([Role, User, TaskType, Task,Customer])
class InitializationServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "check_for_user_and_role"(){
        when:
        service.initRole()
        service.initUser()
        then:
        Users.count == 1
        Role.count == 1
    }

    void "test_customer"(){
        when:
        service.initCustomer()
        then:
        Customer.count == 1
    }

    void "test_taskType_and_task"(){
        when:
        service.initTaskType()
        service.initRole()
        service.initUser()
        service.initTask()
        then:
        Task.count == 1
        TaskType.count == 1
    }
}
