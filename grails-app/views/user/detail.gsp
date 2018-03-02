<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User detail</title>
</head>

<body>
<g:render template="/user/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Tasks</h1>

    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="title" class="col-sm-3 control-label">User: </label>

                <div class="col-sm-9">
                    <g:textField name="title" value="${params.title}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="user" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> Clear</g:link>
                    <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-search" aria-hidden="true"></i> Search</button>
                </div>
            </div>
        </div>
    </form>

    <g:if test="${users}">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${users.id}"/>
                        <p><h3 class="text-center">${users.firstName}</h3></p>
                        <g:link controller="User" action="delete" id="${users.id}" class="btn btn-danger btn-sm pull-right">Delete</g:link>
                        <hr>
                        <label>Details: </label>
                        <p>First Name: ${users.firstName}</p>
                        <p>Middle Name: ${users.middleName}</p>
                        <p>Last Name: ${users.lastName}</p>
                        <p>Address: ${users.address}</p>
                        <p>Phone Number: ${users.phoneNumber}</p>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</div>


</body>
</html>