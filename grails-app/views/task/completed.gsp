<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Completed Tasks</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Completed Tasks</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="listCompleted" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for tasks by title:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
            </div>
        </g:form>
    </fieldset>


    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <g:link controller="task" action="myTask">My task</g:link>
                        </li>
                        <li class="nav-item">
                            <g:link controller="task" action="listCompleted">Completed Task</g:link>
                        </li>
                        <li class="nav-item">
                            <g:link controller="task" action="list">All Task</g:link>
                        </li>
                    </ul>
                </strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>Title</th>
                        <th>Date Completed</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${tasks}">
                        <g:each in="${tasks}" var="show">
                            <tr>

                                <td>${show.title}</td>
                                <td><div class="label label-primary"><common:dateFormatWithTime dateValue="${show.dateCompleted}"/></div></td>
                                <td>
                                    <g:link controller="Task" action="detail" id="${show.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                           aria-hidden="true"></i> View Details</g:link>
                                </td>
                            </tr>
                        %{--</g:if>--}%
                        </g:each>
                    </g:if>
                </table>
            </div>

            <ul class="pagination pagination-sm">
                <li>
                    <g:paginate next="Forward" prev="Back" controller="task" action="listCompleted" total="${listCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>