<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Change User Info</title>
</head>

<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="text-primary text-capitalize">${sec.loggedInUserInfo(field:'username')} Info</h1>
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

            <label>Phone Number*</label>
            <input type="text" class="form-control" name="phoneNumber" placeholder="User Phone Number"
                   value="${editUser.phoneNumber}" required="required">
            <lable>New Password</lable>
            <input type="=text" class="form-control" name="password" placeholder="Change Password">
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
