package taskmgmt

class Address {

    String line1
    String line2
    String city
    String state
    String postalCode
    String country

    static constraints = {
        line2 nullable: true
        state nullable: true
        postalCode nullable: true

    }
}
