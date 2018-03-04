package taskmgmt

class CustomerController {

    static defaultAction = "list"

    CustomerService customerService

    def create() {
        render view: "create"
    }

    def save(Customer customer) {
        customerService.save(customer)
        redirect action: "list"
    }

    def list() {
        render view: "list", model: [customerList: Customer.findAllByDateDeletedIsNull([order: "desc", sort: "dateCreated"])]
    }

    def delete(Customer customer) {
        customerService.delete(customer)
        redirect action: "list"
    }

    def edit(Customer customer) {
        render view: "edit", model: [customerToEdit: customer]
    }

    def update(Customer customer) {
        customerService.update(customer)
        redirect action: "list"
    }

    def detail(Customer customer) {
        render view: "detail", model: [customer: customer]
    }

    def setTaskPriority(Customer customer) {
        customerService.setTaskPriority(customer)
        render view: "detail", model: [Priority: customer]
    }

}
