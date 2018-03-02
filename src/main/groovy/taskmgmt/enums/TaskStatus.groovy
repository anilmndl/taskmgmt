package taskmgmt.enums

enum TaskStatus {

    CREATED("CREATED"),
    LOCKED("LOCKED"),
    UNLOCKED("UNLOCKED"),
    COMPLETED("COMPLETED")

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