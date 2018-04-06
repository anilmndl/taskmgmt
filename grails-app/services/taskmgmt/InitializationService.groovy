package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

@Transactional
class InitializationService {

    Random rand = new Random()
    int max = 100


    void initTask() {
        for (int i; i < 100; i++) {
            new Task(taskStatus: TaskStatus.CREATED, title: "task", detail: "Please buy us 1 bottle of milk.",
                    users: Users.findById(rand.nextInt(max)), taskType: TaskType.findById(rand.nextInt(6)),
                    dateCreated: new Date(), customer: Customer.findById(rand.nextInt(max))).save()
        }
    }

    void initTaskType() {
        new TaskType(title: "Watch", description: "Binge watch and waste time").save()
        new TaskType(title: "Sleep", description: "Binge watch and waste time").save()
        new TaskType(title: "Eat", description: "Binge watch and waste time").save()
        new TaskType(title: "Code", description: "Binge watch and waste time").save()
        new TaskType(title: "Cook", description: "Binge watch and waste time").save()
        new TaskType(title: "Hike", description: "Binge watch and waste time").save()
    }

    void initRole() {
        new Role(dateCreated: new Date(), title: "Manager", description: "Manages store").save()
        new Role(dateCreated: new Date(), title: "User", description: "Manages store").save()
        new Role(dateCreated: new Date(), title: "Customer", description: "Manages store").save()
        new Role(dateCreated: new Date(), title: "Admin", description: "Manages store").save()
    }

    void initUser() {
        for (int i; i < 100; i++) {
            new Users(firstName: "Sabin", middleName: "wait for it......", lastName: "Shrestha", role: Role.findById(rand.nextInt(4)),
                    address: "1234 awesomeness street, awesomeCity, awesomeCountry", phoneNumber: 123456789, dateCreated: new Date(), vacationMode: false).save()
        }
    }

    void initCustomer() {
        for (int i; i < 100; i++) {
            new Customer(firstName: "Amar", lastName: "Shrestha", address: "1234 dumb street, dumbCity, dumbCountry",
                    email: "dumb_usermedumbness.dumb", phoneNumber: 123456789, dateCreated: new Date()).save()
        }
    }

    void initComment(){
        for(int i; i<5;i++){
            new Comment(comment: "Jhakkass xa yar. La keep it up. Sahi lagyo", dateCreated: new  Date(),task: Task.findById(1),users: Users.findById(1)).save()
        }
    }
}
