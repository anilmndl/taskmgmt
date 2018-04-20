package taskmgmt.enums

enum RoleAuthority {
    ROLE_ADMIN("ROLE_ADMIN"),
    ROLE_MANAGER("ROLE_MANAGER"),
    ROLE_USER("ROLE_USER")

    final String value
    RoleAuthority (String value){
        this.value = value
    }
    String toString(){
        value
    }
    String getKey(){
        name()
    }
}