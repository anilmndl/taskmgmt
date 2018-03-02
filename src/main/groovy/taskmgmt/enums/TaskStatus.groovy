package taskmgmt.enums

enum TaskStatus {

    CREATED("CREATED"),
    LOCKED("LOCKED"),
    UNLOCKED("UNLOCKED"),
    COMPLETED("COMPLETED"),
    DELETED("DELETED")//don't know if this is necessary, but couldn't check if the task if deleted or not, in any other ways; by @shreamar

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