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
                address1: "#address",
                address2: "#address2",
                locality: "#city",
                administrative_area: "#state",
                postal_code: "#postalCode"
            }]
        });

        function matchPassword(){
            $('#password, #confirm_password').on('keyup', function () {
                if ($('#password').val() == $('#confirm_password').val()) {
                    $('#message').html('Matching').css('color', 'green');
                } else
                    $('#message').html('Not Matching').css('color', 'red');
            });
        }

    </script>
</head>

<body>
<g:render template="/user/sidebar"/>
<div class="col-md-6 main">
    <g:form controller="user" action="save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control" name="firstName" placeholder="First Name" value="${user?.firstName}"/>
            <label>Middle Name</label>
            <input type="text" class="form-control" name="middleName" placeholder="Middle Name" value="${user?.middleName}"/>
            <label>Last Name</label>
            <input type="text" class="form-control" name="lastName" placeholder="Last Name" value="${user?.lastName}"/>

            <label>Username</label>
            <input type="text" class="form-control" name="username" placeholder="username" value="${user?.username}"/>
            <label>Password:</label>
            <input type="password" id="password" class="form-control"/>
            <label>Re-type Password:</label>
            <input type="password" id="confirm_password" class="form-control" name="password"
                onchange="matchPassword()"/>
            <span id='message'></span><br>

            <label>Role</label>

            <div class="form-group">
                <g:select class="btn btn-default dropdown-toggle" from="${roles}" name="role" optionKey="id"
                          optionValue="title" noSelection="['': '--select--']" required="required"/>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="address" onautocomplete="false">Address</label>
                    <input type="text" class="form-control" id="address" name="line1" value="${address?.line1}" placeholder="1234 Main St">
                </div>

                <div class="form-group col-md-6">
                    <label for="address2">Address 2</label>
                    <input type="text" class="form-control" id="address2" name="line2" value="${address?.line2}" placeholder="Apartment, studio, or floor">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city" value="${address?.city}">
                </div>

                <div class="form-group col-md-4">
                    <label for="state">State</label>
                    <input type="text" class="form-control" id="state" name="state" value="${address?.state}">
                </div>

                <div class="form-group col-md-2">
                    <label for="postalCode">Zip</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" value="${address?.postalCode}">
                </div>
                <input type="hidden" name="country" value="US"/>
            </div>
            <label>Phone Number</label>
            <input type="number" class="form-control" name="phoneNumber" placeholder="Phone Number"
                   required="required" value="${user?.phoneNumber}"/>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
<g:render template="/user/mapbar"/>
</body>
</html>
