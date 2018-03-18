<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Customer Detail</title>
</head>

<body>
<g:render template="/customer/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">${customer.firstName}'s Detail</h1>

    <g:if test="${customer}">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${customer.id}"/>
                        <p><h3 class="text-center">${customer.firstName} ${customer.lastName}</h3></p>

                        <hr>
                        <p>Email: ${customer.email} </p>
                        <p>Phone Number: ${customer.phoneNumber} </p>
                        <p>Address: ${customer.address} </p>
                        <p>Date Created: <common:dateFormat dateValue="${customer.dateCreated}"/></p>

                        <table class="table table-responsive">
                            <tr>
                                <th>
                                    <g:link controller="customer" action="edit" id="${customer.id}"
                                            class="btn btn-success btn-sm">Edit</g:link>
                                </th>
                                <th class="bottom-right">
                                %{--sends delete request as POST form submission--}%
                                    <g:form controller="customer" action="delete" id="${customer.id}" method="POST">
                                        <button class="btn btn-danger btn-sm">Delete</button>
                                    </g:form>
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</div>


</body>
</html>