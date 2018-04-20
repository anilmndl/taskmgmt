package taskmgmt

class Address {

    String address
    String address2
    String city
    String state
    String postalCode
    String country

    static constraints = {
        address2 nullable: true
        state nullable: true
        postalCode nullable: true

    }
}
