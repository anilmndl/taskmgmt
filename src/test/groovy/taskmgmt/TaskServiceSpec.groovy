package taskmgmt

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TaskService)
class TaskServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

<<<<<<< HEAD
    void "test something"() {
        expect:"fix me"
            true == false
=======
    void "aplusbwholesquared returns 25 when a = 2 and b = 3"() {
        setup:
            int a = 2
            int b = 3
        when:
            int result = service.aplusbwholesquared(a, b)

        then:
            result == 25
    }

    void "aminusbwholesquared return"(){
        setup:
            int a = 2
            int b = 3
        when:
            int result = service.aminusbwholesquared(a, b)

        then:
            result == 1
>>>>>>> 456512411b826cef4bc2742ab2199224d2e24ea7
    }
}
