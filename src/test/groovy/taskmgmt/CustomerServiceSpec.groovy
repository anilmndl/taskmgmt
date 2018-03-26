package taskmgmt

<<<<<<< HEAD
=======
import grails.test.mixin.Mock
>>>>>>> develop
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(CustomerService)
<<<<<<< HEAD
=======
@Mock([Customer])
>>>>>>> develop
class CustomerServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

<<<<<<< HEAD
    void "test something"() {
        expect:"fix me"
            true == false
=======
    void "test_save"() {
        when:
        Customer customer =  new Customer(firstName: "Sabin", lastName:"Shrestha", email: "43sanrizz@gmail.com", phoneNumber: 2087056491)
        service.save(customer)

        then:
        Customer.list() != null
        Customer.get(1).firstName == "Sabin"
        Customer.get(1).lastName == "Shrestha"
    }

    void "test_delete"(){
        when:
        Customer customer =  new Customer(firstName: "Sabin", lastName:"Shrestha", email: "43sanrizz@gmail.com", phoneNumber: 2087056491)
        service.delete(customer)

        then:
        Customer.list() != null
        Customer.get(1).dateDeleted != null
>>>>>>> develop
    }
}
