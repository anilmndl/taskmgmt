<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>

    <meta name="layout" content="main"/>
    <title>Create Customer</title>
    <asset:javascript src="display.js"/>
</head>

<body>
<g:render template="/customer/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">

    <div class="col-lg-12">
        <h2 class="intro-text text-center">Create
            <strong>Customer</strong></h2>
        <hr>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="alert">${flash.message}</div>
        </g:if>

        <g:form controller="customer" action="save">
            <div class="row">
                <div class="form-group col-lg-6">
                    <label>First Name*:</label>
                    <input type="text" class="form-control" name="firstName" placeholder="First Name"
                           required="required"/>
                </div>

                <div class="form-group col-lg-6">
                    <label>Last Name*:</label>
                    <input type="text" class="form-control" name="lastName" placeholder="Last Name"
                           required="required"/>
                </div>

                <div class="form-group col-lg-12">
                    <fieldset>
                        <legend>Address*:</legend>

                        <button onclick="displayFunction()" class="btn-primary col-lg-12">Fill out the Address*</button>

                        <div id="display">
                            <div class="form-group col-lg-6">
                                <label>Mailing Address 1</label> <input type="text" class="form-control"
                                                                        name="mailingAddress1" required="required"/>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Mailing Address 2</label> <input type="text" class="form-control"
                                                                        name="mailingAddress2"/>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>City</label> <input type="text" class="form-control" name="city"
                                                           required="required"/>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>State</label> <input type="text" class="form-control" name="state"
                                                            required="required"/>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Zip Code</label> <input type="number" class="form-control" name="zipCode" min=0
                                                              required="required"/>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Country</label> <input type="text" class="form-control" name="country"
                                                              required="required"/>
                            </div>
                        </div>

                    </fieldset>
                </div>


                <div class="form-group col-lg-12">
                    <fieldset>
                        <legend>Contact Information</legend>

                        <div class="form-group col-lg-6">
                            <label>Email*:</label>
                            <input type="email" class="form-control" name="email" placeholder="someone@email.com"
                                   required="required"/>
                        </div>

                        <div class="form-group col-lg-6">
                            <label>Phone Number:</label>
                            <input type="number" class="form-control" name="phoneNumber" min=0
                                   placeholder="Enter number without dashes">
                        </div>
                    </fieldset>

                    <div class="form-group col-lg-12">
                        <button type="submit" class="btn btn-primary">Add Customer</button>
                    </div>
                </div>
            </div>
        </g:form>

    </div>
</div>
</body>
</html>