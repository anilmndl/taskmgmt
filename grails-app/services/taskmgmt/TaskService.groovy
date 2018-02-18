package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskService {

    def createTask() {
        new Task(title: "Created by Task Service").save failOnError:true, flush:true
    }

    def createTask(String title){
        new Task(title: title).save failOnError:true, flush:true
    }

    int aplusbwholesquared(int a, int b){
       return  a * a + 2 * a * b + b * b
    }

    int aminusbwholesquared(int a, int  b){
        return a * a - 2* a * b + b * b
    }
}
