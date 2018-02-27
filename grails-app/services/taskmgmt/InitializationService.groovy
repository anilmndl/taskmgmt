package taskmgmt

import grails.transaction.Transactional
import taskmgmt.enums.TaskStatus

@Transactional
class InitializationService {

    void initTask() {
        new Task(taskStatus: TaskStatus.CREATED, title: "Test title").save()
        new Task(taskStatus: TaskStatus.LOCKED, title: "Another Task").save()
    }
}
