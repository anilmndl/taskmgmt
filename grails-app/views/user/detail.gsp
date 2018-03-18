<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User detail</title>
</head>

<body>
<g:render template="/user/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">User Details</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>
    <g:if test="${users}">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${users.id}"/>
                        <p>

                        <h3 class="text-center">${users.firstName}</h3></p>
                        <hr>
                        <label>Details:</label>

                        <p>First Name: ${users.firstName}</p>

                        <p>Middle Name: ${users.middleName}</p>

                        <p>Last Name: ${users.lastName}</p>

                        <p>Address: ${users.address}</p>

                        <p>Phone Number: ${users.phoneNumber}</p>
                        <h4>Date Created: <common:dateFormatWithTime dateValue="${users.dateCreated}"/></h4>
                        <table class="table table-responsive">
                            <tr>
                                <th><g:link controller="user" action="edit" id="${users.id}"
                                            class="btn btn-success btn-sm">Edit</g:link></th>
                                <th class="bottom-right">
                                %{--sends delete request as POST form submission--}%
                                    <g:form controller="user" action="delete" id="${users.id}" method="POST">
                                        <button class="btn btn-danger btn-sm pull-right">Delete</button>
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