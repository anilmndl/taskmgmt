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
                    <g:link controller="task" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> Clear</g:link>
                    <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-search" aria-hidden="true"></i> Search</button>
                </div>
            </div>
        </div>
    </form>

    <g:if test="${tasks}">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${tasks.id}"/>
                        <p><h3 class="text-center">${tasks.title}</h3></p>
                        <g:link controller="task" action="delete" id="${tasks.id}" class="btn btn-danger btn-sm pull-right">Delete</g:link>
                        <g:link controller="task" action="completed" id="${tasks.id}" class="btn btn-success btn-sm">Completed</g:link>
                        <hr>
                        <p>Details: ${tasks.detail}</p>
                        <p>Date Created: ${tasks.dateCreated}</p>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</div>


</body>
</html>