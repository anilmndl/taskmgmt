import taskmgmt.InitializationService
import taskmgmt.Role
import taskmgmt.User
import taskmgmt.UserRole

class BootStrap {

    InitializationService initializationService
    def init = { servletContext ->
        initializationService.initTaskType()
        initializationService.initCustomer()
        initializationService.initTask()
        initializationService.initComment()
        //creating user
        User adminUser = new User(username: 'admin', password: 'admin', enabled: true).save()
        User managerUser = new User(username: 'manager', password: 'mgmt', enabled: true).save()
        User userUser = new User(username: 'user', password: 'user', enabled: true).save()
        //creating the role
        Role adminRole = new Role(authority: 'ROLE_ADMIN').save()
        Role userRole = new Role(authority: 'ROLE_USER').save()
        Role managerRole = new Role(authority: 'ROLE_MANAGER').save()

        //assigning role to the user
        UserRole.create(adminUser, adminRole)
        UserRole.create(managerUser, managerRole)
        UserRole.create(userUser, userRole)
    }

    def destroy = {
    }
}
