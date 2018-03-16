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

    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="title" class="col-sm-3 control-label">Task Title:</label>

                <div class="col-sm-9">
                    <g:textField name="title" value="${params.title}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="task" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> Clear</g:link>
                    <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-search" aria-hidden="true"></i> Search</button>
                </div>
            </div>
        </div>
    </form>

    <g:if test="${customer}">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${customer.id}"/>
                        <p><h3 class="text-center">${customer.firstName} ${customer.lastName}</h3></p>
                        <g:link controller="customer" action="delete" id="${customer.id}"
                                class="btn btn-danger btn-sm pull-right">Delete</g:link>
                        <g:link controller="customer" action="assignTask" id="${customer.id}" class="btn btn-success btn-sm">Assign Task</g:link>
                        <hr>
                        <p>Email: ${customer.email} </p>
                        <p>Phone Number: ${customer.phoneNumber} </p>
                        <p>Address: ${customer.address} </p>
                        <p>Date Created: <common:dateFormat date="${customer.dateCreated}"/></p>

                    </div>
                </div>
            </div>
        </div>
    </g:if>

</div>


</body>
</html>