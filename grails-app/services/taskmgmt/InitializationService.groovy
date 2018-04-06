package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

@Transactional
class InitializationService {

    Random rand = new Random()
    int max = 100

    def roleList = ["manager", "user", "admin", "customer"]

    void initTask() {
        for (int i; i < 100; i++) {
            new Task(taskStatus: TaskStatus.CREATED, title: "task", detail: "Please buy us 1 bottle of milk.",
                    users: Users.findById(rand.nextInt(max)), taskType: TaskType.findById(rand.nextInt(max)),
                    dateCreated: new Date(), customer: Customer.findById(1)).save()
        }
    }

    void initTaskType() {
        for (int i; i < 100; i++) {
            new TaskType(title: "Watch" + rand.nextInt(), description: "Binge watch and waste time").save()
        }
    }

    void initRole() {
        for (int i; i < 100; i++) {
            new Role(dateCreated: new Date(), title: roleList.get(rand.nextInt(roleList.size())), description: "Manages store").save()
        }
    }

    void initUser() {
        for (int i; i < 100; i++) {
            new Users(firstName: "Sabin", middleName: "wait for it......", lastName: "Shrestha", role: Role.findByTitle("manager"),
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
