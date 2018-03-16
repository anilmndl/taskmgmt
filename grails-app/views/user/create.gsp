<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create User</title>
</head>
<body>
<g:render template="/user/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="user" action="save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control"  name="firstName" placeholder="First Name" />
            <label>Middle Name</label>
            <input type="text" class="form-control"  name="middleName" placeholder="Middle Name" />
            <label>Last Name</label>
            <input type="text" class="form-control"  name="lastName" placeholder="Last Name" />
            <label>Role</label>
            <div class="form-group">
                <g:select from="${roles}" name="role" optionKey="id" optionValue="title"/>
            </div>
            <label>Address</label>
            <input type="text" class="form-control"  name="address" placeholder="Address" />
            <label>Phone Number</label>
            <input type="number" class="form-control"  name="phoneNumber" placeholder="Phone Number" />
        </div>



        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
