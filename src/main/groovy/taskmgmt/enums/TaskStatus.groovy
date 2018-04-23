package taskmgmt.enums

enum TaskStatus {

    CREATED("Unassigned"),
    UNASSIGNED("Unassigned"),
    ASSIGNED("Assigned"),
    IN_PROGRESS("In-progress"),
    COMPLETED("Completed"),
    DELETED("Deleted")

    final String value
    TaskStatus(String value){
        this.value = value
    }
    String toString(){
        value
    }

    String getKey(){
        name()
    }
}