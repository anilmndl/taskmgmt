<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create User</title>
</head>

<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h1>Create User</h1>
    <g:form controller="user" action="save">
        <div class="form-group">
            <label>First Name*</label>
            <input type="text" class="form-control" name="firstName" placeholder="First Name" required="required"/>
            <label>Middle Name</label>
            <input type="text" class="form-control" name="middleName" placeholder="Middle Name"/>
            <label>Last Name*</label>
            <input type="text" class="form-control" name="lastName" placeholder="Last Name" required="required"/>
            <label>Role*</label>

            <div class="form-group">
                <g:select class="btn btn-default dropdown-toggle" from="${roles}" name="role" optionKey="id"
                          optionValue="title" noSelection="[null:'--select--']"/>
            </div>
            <label>Address*</label>
            <input type="text" class="form-control" name="address" placeholder="Address" required="required"/>
            <label>Phone Number*</label>
            <input type="number" class="form-control" name="phoneNumber" placeholder="Phone Number"
                   required="required"/>
        </div>

        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
