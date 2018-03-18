package taskmgmt

class CustomerController {

    static defaultAction = "list"

    //delete() method is only allows POST request
    static allowedMethods = [delete: 'POST']

    CustomerService customerService

    def create() {
        render view: "create"
    }

    def save(Customer customer) {
        try {
            customerService.save(customer)
            render view: "detail", model: [customer:customer]
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [customerToEdit: customer]
        }
    }

    def list() {
        render view: "list", model: [customerList: Customer.findAllByDateDeletedIsNull([order: "desc", sort: "dateCreated"])]
    }

    def delete(Customer customer) {
        try {
            customerService?.delete(customer)
            redirect action: "list"
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            redirect action: "detail"
        }
    }

    def edit(Customer customer) {
        render view: "edit", model: [customerToEdit: customer]
    }

    def update(Customer customer) {
        try {
            customerService.update(customer)
            render view: "detail", model: [customer:customer]
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [customerToEdit: customer]
        }
    }

    def detail(Customer customer) {
        render view: "detail", model: [customer: customer]
    }

}
