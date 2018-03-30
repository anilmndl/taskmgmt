<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task List</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Tasks</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for tasks by title:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
                <g:link controller="task" action="create" class="btn btn-primary  btn-xs"><i class="fa fa-plus"
                                                                                                 aria-hidden="true"></i> New Task</g:link>
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
                        <th>Date Created</th>
                        <th>Task Type</th>
                        <th>User</th>
                        <th>Customer</th>
                        <th>Due Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <g:each in="${tasks}" var="show">
                        <tr>
                            <td>${show.title}</td>
                            <td>
                                <div class="label label-primary">
                                    <common:dateFormatWithTime
                                            dateValue="${show.dateCreated}"/>
                                </div>
                            </td>
                            <td>${show.taskType.title}</td>
                            <td>
                                <g:if test="${show.users == null}">

                                    <div class="label label-warning">No data</div>
                                </g:if>
                                <g:else>
                                    <mark>${show?.users?.firstName} ${show?.users?.lastName}</mark>
                                </g:else>
                            </td>
                            <td>
                                <g:if test="${show.customer == null}">

                                    <div class="label label-warning">No data</div>
                                </g:if>
                                <g:else>
                                    <mark>${show?.customer?.firstName} ${show?.customer?.lastName}</mark>
                                </g:else>
                            </td>
                            <td>
                                <div class="label label-warning">
                                    <common:dateFormatWithTime dateValue="${show.dueDate}"/>
                                </div>
                            </td>
                            <td><strong><em>${show.taskStatus}</em></strong></td>

                            <td>
                                <g:link controller="Task" action="detail" id="${show.id}"
                                        class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                       aria-hidden="true"></i> View Details</g:link>
                            </td>

                        </tr>
                    </g:each>
                </table>
            </div>



                    <ul class="pagination pagination-lg">
                      <li>
                          <g:paginate next="Forward" prev="Back" maxsteps="0" controller="task" action="list" total="${listCount}"/>

                      </li>

                    </ul>
                    %{--<g:paginate controller="task" action="list" total="${listCount}"></g:paginate>--}%
        </div>
    </div>
</div>
</body>
</html>