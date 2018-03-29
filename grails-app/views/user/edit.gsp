<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update User</title>
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
            <label>Address*</label>
            <input type="text" class="form-control" name="address" placeholder="User address"
                   value="${editUser.address}" required="required">
            <label>Phone Number*</label>
            <input type="text" class="form-control" name="phoneNumber" placeholder="User Phone Number"
                   value="${editUser.phoneNumber}" required="required">
        </div>


        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
