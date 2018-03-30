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
            List<Customer> customerList = Customer.list()
            String messageToDisplay
            for(int i = 0; i < customerList.size(); i++){
                if(customerList[i].email == customer.email){
                    messageToDisplay = "There is already a user with this email"
                }
            }

            if(messageToDisplay != null){
                flash.message = messageToDisplay
                render view: "edit", model: [customerToEdit: customer]
            }
            else{
                customerService.save(customer)
                render view: "detail", model: [customer:customer]
            }
        }
        catch (Exception e) {
            flash.message = e.getMessage()
            render view: "edit", model: [customerToEdit: customer]
        }
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def customerList = Customer.createCriteria().list(params) {
            if ( params.query ) {
                and{
                    ilike("firstName",  "%${params.query}%")
                    isNull("dateDeleted")
                }
            }else{
                isNull("dateDeleted")
            }
        }

        [customerList: customerList, listCount: Customer.count()]
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

    def setTaskPriority(Customer customer) {
        customerService.setTaskPriority(customer)
        render view: "detail", model: [Priority: customer]
    }

}
