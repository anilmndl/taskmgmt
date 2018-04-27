package taskmgmt.enums

enum TaskPriority {

    HIGH("High"),
    MEDIUM("Medium"),
    LOW("Low"),

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