package taskmgmt

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@Mock([TaskType])
@TestFor(TaskTypeService)
class TaskTypeServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    //test for update service
    void "task_type_service_update"(){
        when:
        //create and save new instance of TaskType
        def taskType = new TaskType(title: "title")
        service.save(taskType)
        int version = taskType.version

        then:
        //version property is acquired after it's saved to database
        version!=null && version==0

        when:
        service.update(taskType)

        then:
        //each time taskType is updated it's version increases by 1
        version<taskType.version
    }
}
