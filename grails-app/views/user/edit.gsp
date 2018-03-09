<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update User</title>
</head>
<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="User" action="update" id="${editUser.id}">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control"  name="firstName" placeholder="User First Name" value="${editUser.firstName}">
            <label>Middle Name</label>
            <input type="text" class="form-control"  name="middleName" placeholder="User Middle Name" value="${editUser.middleName}">
            <label>Last Name</label>
            <input type="text" class="form-control"  name="lastName" placeholder="User Last Name" value="${editUser.lastName}">
            <label>Role</label>
            <div class="form-group">
                <g:select from="${roles}" name="role" optionKey="id" optionValue="title"/>
            </div>
            <label>Address</label>
            <input type="text" class="form-control"  name="address" placeholder="User address" value="${editUser.address}">
            <label>Phone Number</label>
            <input type="text" class="form-control"  name="phoneNumber" placeholder="User Phone Number" value="${editUser.phoneNumber}">
        </div>


        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
