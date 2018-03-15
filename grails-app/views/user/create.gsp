<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create User</title>
    <asset:javascript src="jquery.liveaddress.min.js"/>
    <script>
        var ss = jQuery.LiveAddress({
        key: '17890891736670965',
        debug: false,
        target: "US",
        addresses: [{
            country: "#country",
            address1: "#address",
            address2: "#address2",
            locality: "#city",
            administrative_area: "#state",
            postal_code: "#postalCode"
        }]
    });
    </script>
</head>

<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="user" action="save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control" name="firstName" placeholder="First Name"/>
            <label>Middle Name</label>
            <input type="text" class="form-control" name="middleName" placeholder="Middle Name"/>
            <label>Last Name</label>
            <input type="text" class="form-control" name="lastName" placeholder="Last Name"/>
            <label>Role</label>

            <div class="form-group">
                <g:select from="${roles}" name="role" optionKey="id" optionValue="title"/>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" placeholder="1234 Main St">
            </div>
            <div class="form-group">
                <label for="address2">Address 2</label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment, studio, or floor">
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city">
                </div>
                <div class="form-group col-md-3">
                    <label for="state">State</label>
                    <input type="text"  class="form-control" id="state">
                </div>
                <div class="form-group col-md-2">
                    <label for="postalCode">Zip</label>
                    <input type="text" class="form-control" id="postalCode">
                </div>
                <div class="form-group col-md-3">
                    <label for="country">Zip</label>
                    <input type="text" class="form-control" id="country">
                </div>
            </div>
            <label>Phone Number</label>
            <input type="number" class="form-control" name="phoneNumber" placeholder="Phone Number"/>
        </div>



        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
