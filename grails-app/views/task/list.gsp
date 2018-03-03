<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task List</title>
</head>

<body>
<g:render template="/layouts/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Tasks</h1>

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
                    <g:link controller="task" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times"
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
                <div class="panel-heading"><strong>Tasks</strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Date Created</th>
                        <th>Task Type</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${tasks}">
                        <g:each in="${tasks}" var="show">
                            %{--<g:if test="${show.flag != "deleted"  && show.flag != "completed"}">--}%
                                <tr>
                                    <td>${show.id}</td>
                                    <td>${show.title}</td>
                                    <td>${show.dateCreated}</td>
                                    <td>${show.taskType.title}</td>
                                    <td>
                                        <g:link controller="Task" action="detail" id="${show.id}"
                                                class="btn btn-default btn-xs"><i class="fa fa-eye"
                                                                                  aria-hidden="true"></i> View</g:link>
                                        <g:link controller="Task" action="edit" id="${show.id}"
                                                class="btn btn-default btn-xs"><i class="fa fa-edit"
                                                                                  aria-hidden="true"></i> Edit</g:link>
                                    </td>
                                </tr>
                           %{-- </g:if>--}%
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