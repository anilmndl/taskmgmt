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

    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="fullName" class="col-sm-4 control-label">Customer Name:</label>

                <div class="col-sm-8">
                    <g:textField name="fullName" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="customer" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times"
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
                                    <g:link controller="customer" action="edit" id="${list.id}"
                                            class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Edit</g:link>
                                </td>
                            </tr>
                        %{-- </g:if>--}%
                        </g:each>
                    </g:if>
                </table>
            </div>
                <div>
                <g:paginate controller="customer" action="list" total="${listCount}"> </g:paginate>
        </div>
        </div>
    </div>
</div>
</body>
</html>