package taskmgmt.enums

enum TaskStatus {

    CREATED("UNASSIGNED"),
    UNASSIGNED("UNASSIGNED"),
    ASSIGNED("ASSIGNED"),
    IN_PROGRESS("IN_PROGRESS"),
    COMPLETED("COMPLETED"),
    DELETED("DELETED")

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