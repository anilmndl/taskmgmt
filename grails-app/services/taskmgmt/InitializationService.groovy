package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

@Transactional
class InitializationService {

    void initTask() {
        for (int i; i < 100; i++) {
            new Task(taskStatus: TaskStatus.CREATED, title: "task", detail: "Please buy us 1 bottle of milk.",
                    users: Users.findByFirstName("Sabin"), taskType: TaskType.findByTitle("Grocery"),
                    dateCreated: new Date(), customer: Customer.findByFirstName("Dumb")).save()
        }
    }

    void initTaskType() {
        for (int i; i < 100; i++) {
            new TaskType(title: "Grocery", description: "Buy stuffs").save()
        }
    }

    void initRole() {
        for (int i; i < 100; i++) {
            new Role(dateCreated: new Date(), title: "manager", description: "Manages store").save()
        }
    }

    void initUser() {
        for (int i; i < 100; i++) {
            new Users(firstName: "Sabin", middleName: "wait for it......", lastName: "Shrestha", role: Role.findByTitle("manager"),
                    address: "1234 awesomeness street, awesomeCity, awesomeCountry", phoneNumber: 123456789, dateCreated: new Date(), vacationMode: true).save()
        }
    }

    void initCustomer() {
        for (int i; i < 100; i++) {
            new Customer(firstName: "Dumb", lastName: "customer", address: "1234 dumb street, dumbCity, dumbCountry",
                    email: "dumb_usermedumbness.dumb", phoneNumber: 123456789, dateCreated: new Date()).save()
        }
    }

    void initComment(){
        for(int i; i<5;i++){
            new Comment(comment: "Jhakkass xa yar. La keep it up. Sahi lagyo", dateCreated: new  Date(),task: Task.findById(1),users: Users.findById(1)).save()
        }
    }
}
