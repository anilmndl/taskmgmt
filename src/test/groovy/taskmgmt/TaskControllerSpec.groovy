package taskmgmt

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TaskController)
class TaskControllerSpec extends Specification {

    def setup()
    {
    }

    def cleanup()
    {
    }

    /*create a test for saving a task by Sabin */
    void "test save"(){
        when:"The create is executed"
        Task newTask = new Task()
        newTask.validate()
        newTask.detail = "Detail"
        newTask.title = "Test"
        newTask.flag="Created"
        controller.save(newTask)

        then:
        Task.count() == 1
    }

    void "test detail"(){

    }
}
