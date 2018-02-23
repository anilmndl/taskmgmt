package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskService {

    def save(Task taskmgmt) {
        taskmgmt.save failonError: true, flush: true
    }
}
