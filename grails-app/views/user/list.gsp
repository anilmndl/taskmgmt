<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User List</title>
</head>

<body>
<g:render template="/user/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Users</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for User:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
                <g:link controller="user" action="create" class="btn btn-primary  btn-xs"><i class="fa fa-plus"
                                                                                             aria-hidden="true"></i>New User</g:link>
            </div>
        </g:form>
    </fieldset>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>
                    List
                </strong></div>
                <table class="table table-striped">
                    <tr>

                        <th>First name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Phone Number</th>
                        <th> Vacation Mode</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${users}">
                        <g:each in="${users}" var="user">
                            <tr>
                                <td>${user.firstName}</td>
                                <td>${user.middleName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.phoneNumber}</td>
                                <td><common:vacationMode IsOnVacation="${user.vacationMode}"/> </td>
                                <td>
                                    <g:link controller="user" action="detail"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                              aria-hidden="true"></i> View Details</g:link>

                                </td>
                            </tr>
                        </g:each>
                    </g:if>
                </table>
            </div>
            <ul class="pagination pagination-sm">
                <li>
                    <g:paginate next="Forward" prev="Back" controller="user" action="list" total="${listCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>