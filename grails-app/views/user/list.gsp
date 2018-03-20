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

    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label">User Name:</label>

                <div class="col-sm-9">
                    <g:textField name="firstName" value="${params.firstName}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="user" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times"
                                                                                             aria-hidden="true"></i> Clear</g:link>
                    <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-search"
                                                                            aria-hidden="true"></i> Search</button>
                </div>
            </div>
        </div>
    </form>

    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>
                    List
                </strong></div>
                <table class="table table-striped">
                    <tr>
                        <th><Id></Id></th>
                        <th>First name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${users}">
                        <g:each in="${users}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.firstName}</td>
                                <td>${user.middleName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.role.title}</td>
                                <td>${user.address}</td>
                                <td>${user.phoneNumber}</td>
                                <td><common:dateFormatWithTime dateValue="${user.dateCreated}"/></td>
                                <td>
                                    <g:link controller="user" action="detail" id="${user.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                              aria-hidden="true"></i> View Details</g:link>
                                    <g:link controller="user" action="edit" id="${user.id}"
                                            class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Edit</g:link>
                                </td>
                            </tr>
                        </g:each>
                    </g:if>
                </table>
            </div>
            <ul class="pagination pagination-sm">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>