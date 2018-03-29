<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Customer List</title>
</head>

<body>
<g:render template="/customer/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Customer List</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for Customer:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
                <g:link controller="customer" action="create" class="btn btn-primary  btn-xs"><i class="fa fa-plus"
                                                                                             aria-hidden="true"></i> New Customer</g:link>
            </div>
        </g:form>
    </fieldset>

    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Customers</strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${customerList}">
                        <g:each in="${customerList}" var="list">
                        %{--<g:if test="${show.flag != "deleted"  && show.flag != "completed"}">--}%
                            <tr>
                                <td>${list.id}</td>
                                <td>${list.firstName} ${list.lastName}</td>
                                <td><common:dateFormatWithTime dateValue="${list.dateCreated}"/></td>
                                <td>
                                    <g:link controller="customer" action="detail" id="${list.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                              aria-hidden="true"></i> View Details</g:link>
                                </td>
                            </tr>
                        %{-- </g:if>--}%
                        </g:each>
                    </g:if>
                </table>
            </div>
            <ul class="pagination pagination-sm">
                <div>
                    <g:paginate controller="customer" action="list" total="${listCount}"></g:paginate>
                </div>
            </ul>
        </div>
    </div>
</div>
</body>
</html>