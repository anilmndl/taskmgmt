package taskmgmt

import grails.test.mixin.TestFor
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.web.GroovyPageUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestMixin(GroovyPageUnitTestMixin)
@Mock([Customer])
class CustomerControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test_if_create_renders_to_create"() {
        when:
        controller.create()

        then:
        response.status == 200
    }

    void "test_if_edit_renders_to_edit"() {
        when:
        controller.edit()

        then:
        response.status == 200
        view == "/customer/edit"
    }

    void "list_displays_a_list_of_customers"() {
        when:
        controller.list()
        String result = render(view: view, model: model)
        then:
        response.status == 200
        view == "/customer/list"
        result.size() > 0
    }

    void "detail_displays_detail_of_customers"() {
        when:
        Customer customer = new Customer()

        customer.firstName = "Sabin"
        customer.lastName = "Shrestha"
        customer.email = "43sanrizz@gmail.com"
        customer.phoneNumber = 2087056491
        customer.dateCreated = new Date()
        customer.dateModified = new Date()
        customer.id = 1
        controller.detail(customer)
        String result = render(view: view, model: model)
        then:
        result.size() > 0
        view == "/customer/detail"
        response.status == 200
    }

    void "test_if_save_redirects_to_list"() {
        when:
        controller.save()

        then:
        response.status == 301
    }
}
