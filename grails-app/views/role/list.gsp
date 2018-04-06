<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Roles List</title>
</head>

<body>
<g:render template="/role/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Roles</h1>
    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for Role:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
                <g:link controller="role" action="create" class="btn btn-primary  btn-xs"><i class="fa fa-plus"
                                                                                             aria-hidden="true"></i> New Role</g:link>
            </div>
        </g:form>
    </fieldset>

    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Roles</strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>Role Title</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                %{-- <g:if test="${roleList}">--}%
                    <g:each in="${roleList}" var="show">
                        <tr>
                            <td>${show.title}</td>
                            <td><common:dateFormatWithTime dateValue="${show.dateCreated}"/></td>
                            <td>
                                <g:link controller="Role" action="detail" id="${show.id}"
                                        class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                       aria-hidden="true"></i> View Details</g:link>
                            </td>
                        </tr>
                    </g:each>
                %{--</g:if>--}%
                </table>
            </div>

        </div>
        <ul class="pagination pagination-sm">
            <li>
                <g:paginate next="Forward" prev="Back" controller="role" action="list" total="${listCount}"/>
            </li>
        </ul>
    </div>

</div>
</body>
</html>