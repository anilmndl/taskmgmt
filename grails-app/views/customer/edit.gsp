<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Edit Customer</title>
</head>

<body>
<g:render template="/customer/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">

    <div class="col-lg-12">
        <h2 class="intro-text text-center">Edit
            <strong>Customer</strong></h2>
        <hr>

        <g:if test="${flash.message}">
            <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
        </g:if>

        <g:form controller="customer" action="update" id="${customerToEdit.id}">
            <div class = "row">
                <div class = "form-group col-lg-6">
                    <label>First Name*:</label>
                    <input type= "text" class = "form-control" name = "firstName" placeholder = "First Name"
                    value = "${customerToEdit.firstName}" required="required"/>
                </div>

            <div class="form-group col-lg-6">
                <label>Last Name*:</label>
                <input type="text" class="form-control" name="lastName" placeholder="Last Name"
                       value="${customerToEdit.lastName}" required="required"/>
            </div>

            <div class="form-group col-lg-12">
                <fieldset>
                    <legend>Address:</legend>

                    <div class="form-group col-lg-6">
                        <label>Mailing Address 1</label> <input type="text" class="form-control" name="mailingAddress1"
                                                                required="required"
                                                                value="${customerToEdit.mailingAddress1}"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Mailing Address 2</label> <input type="text" class="form-control" name="mailingAddress2"
                                                                value="${customerToEdit.mailingAddress2}"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>City</label> <input type="text" class="form-control" name="city" required="required"
                                                   value="${customerToEdit.city}"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>State</label> <input type="text" class="form-control" name="state" required="required"
                                                    value="${customerToEdit.state}"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Zipcode</label> <input type="text" class="form-control" name="zipCode"
                                                      required="required" value="${customerToEdit.zipCode}"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Country</label> <input type="text" class="form-control" name="country"
                                                      required="required" value="${customerToEdit.country}"/>
                    </div>
                </fieldset>
            </div>

            <div class="form-group col-lg-12">
                <fieldset>
                    <legend>Contact Information</legend>

                    <div class="form-group col-lg-6">
                        <label>Email*:</label>
                        <input type="email" class="form-control" name="email" placeholder="abc@example.com"
                               value="${customerToEdit.email}" required="required"/>
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Phone Number:</label>
                        <input type="number" class="form-control" name="phoneNumber" min=0
                               placeholder="Enter number without dashes"
                               value="${customerToEdit.phoneNumber}">
                    </div>
                </fieldset>
            </div>

            <div class="form-group col-lg-12">
                <button type="submit" class="btn btn-primary">Update Customer</button>
            </div>
        </g:form>
    </div>
    </div>
</body>
</html>