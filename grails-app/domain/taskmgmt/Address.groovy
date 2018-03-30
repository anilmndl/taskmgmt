package taskmgmt

class Address {

    String address
    String address2
    String city
    String state
    int postalCode
    String country

    static constraints = {
        address2 nullable: true
    }
}