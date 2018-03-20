package taskmgmt.enums

enum TaskPriority {

    HIGH("HIGH"),
    MEDIUM("MEDIUM"),
    LOW("LOW"),

    final String value

    TaskPriority(String value){
        this.value = value
    }

    String toString(){
        value
    }

    String getKey(){
        name()
    }
}