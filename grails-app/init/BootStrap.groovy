import taskmgmt.Address
import taskmgmt.InitializationService
import taskmgmt.Role
import taskmgmt.User
import taskmgmt.UserRole
import taskmgmt.enums.RoleAuthority

class BootStrap {

    InitializationService initializationService
    def init = { servletContext ->
        initializationService.initTaskType()
        initializationService.initCustomer()

        //creating the role
        Role adminRole = new Role(title: "Admin", description: "This is the main system controller", dateCreated: new Date(), authority: RoleAuthority.ROLE_ADMIN).save()
        Role userRole = new Role(title: "User", description: "This is the regular user", dateCreated: new Date(),authority: RoleAuthority.ROLE_USER).save()

        //creating user
        User adminUser = new User(username: 'admin', password: 'admin', firstName: "Kaushal", lastName: "Wagle",
                address: new Address(line1: "123 S. 4th Ave", city:"Pocatello", state: "ID", country: "US").save(),
                phoneNumber: 54151651651, dateCreated: new Date(), role:adminRole, enabled: true).save()

        User userUser = new User(username: 'user', password: 'user',firstName: "Alankar", lastName: "Pokhrael",
                address: new Address(line1: "890 S. 1st Ave", city:"Salt Lake", state: "UT", country: "US").save(),
                role:userRole, phoneNumber: 95151231, dateCreated: new Date(), enabled: true).save()

        initializationService.initTask()
        initializationService.initComment()

        //assigning role to the user
        UserRole.create(adminUser, adminRole)
        UserRole.create(userUser, userRole)
    }

    def destroy = {
    }
}
