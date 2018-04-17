package taskmgmt

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

@Transactional
@Secured(['Role'])
class InitializationService {

    Random rand = new Random()


    void initTask() {
//        for (int i; i < 100; i++) {
//            new Task(taskStatus: TaskStatus.CREATED, title: "task", detail: "Please buy us 1 bottle of milk.",
//                    users: User.findById(rand.nextInt((int)User.list().size())+1), taskType: TaskType.findById(rand.nextInt((int)TaskType.list().size())+1),
//                    dateCreated: new Date(), customer: Customer.findById(rand.nextInt((int)Customer.list().size())+1)).save()
//
//        }
    }

    void initTaskType() {

        new TaskType(title: "Watch Netflix", description: "Binge watch and waste time").save()
        new TaskType(title: "Hulu is Life", description: "Next episode of family guy is out").save()
        new TaskType(title: "Crush the CrunchyRoll", description: "Anime is not cartoon").save()
        new TaskType(title: "Life of Prime", description: "Download now watch months later.").save()

    }

//    void initRole() {
//        //creating the role
//        Role adminRole = new Role(authority: 'ROLE_ADMIN').save()
//        Role userRole = new Role(authority: 'ROLE_USER').save()
//        Role managerRole = new Role(authority: 'ROLE_MANAGER').save()
//    }
//
//    void initUser() {
//        //creating user
//        User adminUser = new User(username: 'admin', password: 'admin', enabled: true).save()
//        User managerUser = new User(username: 'manager', password: 'mgmt', enabled: true).save()
//        User userUser = new User(username: 'user', password: 'user', enabled: true).save()
//    }
//
//    void initUserRole() {
//        //assigning role to the user
//        UserRole.create(adminUser, adminRole)
//        UserRole.create(managerUser, managerRole)
//        UserRole.create(userUser, userRole)
//    }

    void initCustomer() {
        for (int i; i < 100; i++) {
            new Customer(firstName: "Amar", lastName: "Shrestha", address: "1234 dumb street, dumbCity, dumbCountry",
                    email: "dumb_usermedumbness.dumb", phoneNumber: 123456789, dateCreated: new Date()).save()
        }
    }

    void initComment() {
//        for(int i; i<5;i++){
//            new Comment(comment: "Jhakkass xa yar. La keep it up. Sahi lagyo", dateCreated: new  Date(),task: Task.findById(rand.nextInt((int)Task.list().size())+1),users: Users.findById(rand.nextInt((int)User.list().size())+1)).save()
//        }
    }
}
