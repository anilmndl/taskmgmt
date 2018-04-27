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
                phoneNumber: 5415165165, dateCreated: new Date(), role:adminRole, enabled: true).save()

        User userUserAl = new User(username: 'pokhalan', password: 'pokhalan',firstName: "Alankar", lastName: "Pokhrel",
                address: new Address(line1: "890 S. 1st Ave", city:"Salt Lake", state: "UT", country: "US").save(),
                role:userRole, phoneNumber: 9515123133, dateCreated: new Date(), enabled: true).save()
        User userUserAm = new User(username: 'shreamar', password: 'shreamar',firstName: "Amar", lastName: "Shrestha",
                address: new Address(line1: "548 S. 10th Ave.", city:"Pocatello", state: "ID", country: "US").save(),
                role:userRole, phoneNumber: 2419289412, dateCreated: new Date(), enabled: true).save()
        User userUserKi = new User(username: 'simkkish', password: 'simkkish',firstName: "Kishor", lastName: "Simkhada",
                address: new Address(line1: "321 N. 6th Ave.", city:"Queens", state: "NY", country: "US").save(),
                role:userRole, phoneNumber: 3252355555, dateCreated: new Date(), enabled: true).save()
        User userUserSu = new User(username: 'pathsush', password: 'pathsush',firstName: "Sushil", lastName: "Pathak",
                address: new Address(line1: "515 E. Haliday St.", city:"Pocatello", state: "ID", country: "US").save(),
                role:userRole, phoneNumber: 9247184856, dateCreated: new Date(), enabled: true).save()
        User userUserSa = new User(username: 'shresabi', password: 'shresabi',firstName: "Sabin", lastName: "Shrestha",
                address: new Address(line1: "2343 E. Longton St.", city:"Detroit", state: "MI", country: "US").save(),
                role:userRole, phoneNumber: 2218941294, dateCreated: new Date(), enabled: true).save()


        //assigning role to the user
        UserRole.create(adminUser, adminRole)
        UserRole.create(userUserAl, userRole)
        UserRole.create(userUserAm, userRole)
        UserRole.create(userUserKi, userRole)
        UserRole.create(userUserSu, userRole)
        UserRole.create(userUserSa, userRole)


        initializationService.initTask()
        initializationService.initComment()
    }

    def destroy = {
    }
}
