package taskmgmt

import grails.transaction.Transactional

@Transactional
class TaskTypeService {
    def save(TaskType taskType) {
        taskType.identifier = slugify(taskType.title)
        taskType.dateCreated = new Date()
        if (taskType.validate()) {
            taskType.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Save failed.")
        }
    }

    def update(TaskType taskType) {
        taskType.dateModified = new Date()
        if (taskType.validate()) {
            taskType.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Update failed.")
        }
    }

    def delete(TaskType taskType) {
        taskType.dateDeleted = new Date()
        if (taskType.validate()) {
            taskType.save failOnError: true, flush: true
        } else {
            throw new Exception("Oops! Something went wrong. Deletion failed.")
        }
    }

    def slugify(String data) {
        String slug = data
        slug = slug.toLowerCase();
        slug = slug.replaceAll(" ", "-")
        return slug
    }
}
