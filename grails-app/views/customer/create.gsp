<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Customer</title>
</head>
<body>
<g:render template="/customer/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">

    <div class = "col-lg-12">
        <h2 class = "intro-text text-center">Create
            <strong>Customer</strong></h2>
        <hr>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="alert">${flash.message}</div>
        </g:if>

        <g:form controller="customer" action="save">
        <div class = "row">
            <div class = "form-group col-lg-6">
                <label>First Name*:</label>
                <input type= "text" class = "form-control" name = "firstName" placeholder = "First Name" required="required"/>
            </div>

            <div class = "form-group col-lg-6">
                <label>Last Name*:</label>
                <input type= "text" class = "form-control" name = "lastName" placeholder = "Last Name" required="required"/>
            </div>

            <div class = "form-group col-lg-12">
                <label>Address:</label>
                <input type= "text" class = "form-control" name = "address" placeholder = "Address" />
            </div>

            <div class = "form-group col-lg-6">
                <label>Email*:</label>
                <input type= "email" class = "form-control" name = "email" placeholder="someone@email.com" required="required"/>
            </div>

            <div class = "form-group col-lg-6">
                <label>Phone Number:</label>
                <input type= "number" class = "form-control" name = "phoneNumber" min=0 placeholder="Enter number without dashes">
            </div>

            <div class = "form-group col-lg-12">
                <button type="submit" class="btn btn-primary">Add Customer</button>
            </div>
        </div>
        </g:form>
    </div>
</div>
</body>
</html>