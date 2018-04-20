import taskmgmt.Address
import taskmgmt.InitializationService
import taskmgmt.Role
import taskmgmt.User
import taskmgmt.UserRole

class BootStrap {

    InitializationService initializationService
    def init = { servletContext ->
        initializationService.initTaskType()
        initializationService.initCustomer()
        //initializationService.initTask()
        initializationService.initComment()

        //creating the role
        Role adminRole = new Role(title: "Admin", description: "This is the main system controller", dateCreated: new Date(), authority: 'ROLE_ADMIN').save()
        Role userRole = new Role(title: "Manager", description: "This is the regular user", dateCreated: new Date(),authority: 'ROLE_USER').save()
        Role managerRole = new Role(title: "User", description: "This is the manager", dateCreated: new Date(),authority: 'ROLE_MANAGER').save()

        //creating user
        User adminUser = new User(username: 'admin', password: 'admin', firstName: "Kaushal", lastName: "Wagle",
                address: new Address(address: "123 S. 4th Ave", city:"Pocatello", state: "ID", country: "US").save(),
                phoneNumber: 54151651651, dateCreated: new Date(), role:adminRole, enabled: true).save()

        User managerUser = new User(username: 'manager', password:  'mgmt',firstName: "Kishor", lastName: "Simkhada",
                address: new Address(address: "567 S. 8th Ave", city:"Boise", state: "ID", country: "US").save(),
                role:managerRole, phoneNumber: 48465131, dateCreated: new Date(), enabled: true).save()

        User userUser = new User(username: 'user', password: 'user',firstName: "Alankar", lastName: "Pokhrael",
                address: new Address(address: "890 S. 1st Ave", city:"Salt Lake", state: "UT", country: "US").save(),
                role:userRole, phoneNumber: 95151231, dateCreated: new Date(), enabled: true).save()

        //assigning role to the user
        UserRole.create(adminUser, adminRole)
        UserRole.create(managerUser, managerRole)
        UserRole.create(userUser, userRole)
    }

    def destroy = {
    }
}
