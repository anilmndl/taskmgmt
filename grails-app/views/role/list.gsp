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
    <h4>${flash.message}</h4>
    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="title" class="col-sm-3 control-label">Role Title:</label>

                <div class="col-sm-9">
                    <g:textField name="title" value="${params.title}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="Role" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times"
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
                            <td>${show.dateCreated}</td>
                            <td>
                                <g:link controller="Role" action="detail" id="${show.id}"
                                        class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                       aria-hidden="true"></i> View Details</g:link>
                                <g:link controller="Role" action="edit" id="${show.id}"
                                        class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                          aria-hidden="true"></i> Edit</g:link>
                            </td>
                        </tr>
                    </g:each>
                %{--</g:if>--}%
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