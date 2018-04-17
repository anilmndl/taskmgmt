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
    void initRole() {
//        new Role(dateCreated: new Date(), title: "Manager", description: "Manages store").save()
//        new Role(dateCreated: new Date(), title: "User", description: "Manages store").save()
//        new Role(dateCreated: new Date(), title: "Customer", description: "Manages store").save()
//        new Role(dateCreated: new Date(), title: "Admin", description: "Manages store").save()
    }

    void initUser() {
      for (int i; i < 100; i++) {
        //            new User(firstName: "Sabin", middleName: "wait for it......", lastName: "Shrestha", role: Role.findById(rand.nextInt((int)Role.list().size())+1),
//                    address: "1234 awesomeness street, awesomeCity, awesomeCountry", phoneNumber: 123456789, dateCreated: new Date(), vacationMode: false).save()
    }
    }

    void initCustomer() {
        for (int i; i < 100; i++) {
            new Customer(firstName: "Amar", lastName: "Shrestha", address: "1234 dumb street, dumbCity, dumbCountry",
                    email: "dumb_usermedumbness.dumb", phoneNumber: 123456789, dateCreated: new Date()).save()
        }
    }

    void initComment(){
//        for(int i; i<5;i++){
//            new Comment(comment: "Jhakkass xa yar. La keep it up. Sahi lagyo", dateCreated: new  Date(),task: Task.findById(rand.nextInt((int)Task.list().size())+1),users: Users.findById(rand.nextInt((int)User.list().size())+1)).save()
//        }
    }
}
