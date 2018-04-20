<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update User</title>
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
    </script>
</head>

<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h1>Update User</h1>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>
    <g:form controller="User" action="update" id="${editUser.id}">
        <div class="form-group">
            <label>First Name*</label>
            <input type="text" class="form-control" name="firstName" placeholder="User First Name"
                   value="${editUser.firstName}" required="required">
            <label>Middle Name</label>
            <input type="text" class="form-control" name="middleName" placeholder="User Middle Name"
                   value="${editUser.middleName}">
            <label>Last Name*</label>
            <input type="text" class="form-control" name="lastName" placeholder="User Last Name"
                   value="${editUser.lastName}" required="required">
            <label>Role*</label>

            <div class="form-group">
                <g:select class="btn btn-default dropdown-toggle" from="${roles}" name="role" optionKey="id"
                          optionValue="title" value="${editUser?.role?.id}" noSelection="[null:'--select--']"/>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="address" onautocomplete="false">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${editUser.address?.address}" placeholder="1234 Main St">
                </div>

                <div class="form-group col-md-6">
                    <label for="address2">Address 2</label>
                    <input type="text" class="form-control" id="address2" name="address2" value="${editUser.address?.address2}" placeholder="Apartment, studio, or floor">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city" value="${editUser.address?.city}">
                </div>

                <div class="form-group col-md-4">
                    <label for="state">State</label>
                    <input type="text" class="form-control" id="state" name="state" value="${editUser.address?.state}">
                </div>

                <div class="form-group col-md-2">
                    <label for="postalCode">Zip</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" value="${editUser.address?.postalCode}">
                </div>
                <input type="hidden" name="country" value="US"/>
            </div>
            <label>Phone Number*</label>
            <input type="text" class="form-control" name="phoneNumber" placeholder="User Phone Number"
                   value="${editUser.phoneNumber}" required="required">
        </div>


        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
