import taskmgmt.InitializationService
import taskmgmt.Role
import taskmgmt.User
import taskmgmt.UserRole

class BootStrap {

    InitializationService initializationService
    def init = { servletContext ->
        //      initializationService.initRole()
//        initializationService.initUser()
        initializationService.initTaskType()
        initializationService.initCustomer()
        initializationService.initTask()
        initializationService.initComment()

        def roleAdmin = new Role(authority: 'ROLE_ADMIN',title: "Admin").save()
        def roleUser=new Role(authority: 'ROLE_USER').save()
        def admin = new User(username: 'role',password: 'hack',firstName:'Kishor',lastName: 'Simkkhada', email: 'admin@servername')
       //admin.authorities(roleAdmin)
        admin.role=roleAdmin
        //admin.addToAuthorities(role)
        admin.save()
        admin
    }
//
//        def adminRole=Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
//        def userRole=Role.findOrSaveWhere(authority: 'ROLE_USER')
//       def admin=User.findOrSaveWhere(username: 'hack',password: 'hack',firstName:'Kishor',lastName: 'Simkkhada',authorities:'ROLE_ADMIN')
//        def user=User.findOrSaveWhere(username: 'kishor',password: 'kishor',firstName:'Kishor',lastName: 'Simkkhada',authorities:'ROLE_USER')
//        if (!admin.authorities.contains(adminRole)) {
////            UserRole.create(admin, adminRole, true)
//        }
//        if (!user.authorities.contains(adminRole)) {
////            UserRole.create(user, userRole, true)
//        }
   // }


    def destroy = {
    }
}
