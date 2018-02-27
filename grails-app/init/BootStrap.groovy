import taskmgmt.InitializationService

class BootStrap {

    InitializationService initializationService

    def init = { servletContext ->
        initializationService.initTask()
    }

    def destroy = {
    }
}
