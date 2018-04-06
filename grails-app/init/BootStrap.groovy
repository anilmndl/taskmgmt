import taskmgmt.InitializationService

class BootStrap {

    InitializationService initializationService

    def init = { servletContext ->
        initializationService.initRole()
        initializationService.initUser()
        initializationService.initTaskType()
        initializationService.initCustomer()
        initializationService.initTask()
        initializationService.initComment()
    }

    def destroy = {
    }
}
