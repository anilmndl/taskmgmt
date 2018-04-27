<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task List</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">
        <g:if test="${actionName == "myTask"}">
            <g:if test="${currentUser == null}">
                My Tasks
            </g:if>
            <g:else>
                Tasks assigned to ${currentUser.firstName} ${currentUser.lastName}
            </g:else>
        </g:if>
        <g:elseif test="${actionName == "listCompleted"}">
            Tasks Completed
        </g:elseif>
        <g:else>
            All Tasks
        </g:else>
    </h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for tasks by title:</label>
                <g:textField name="query" value="${params.query}"/>
                <label class="control-label" for="query">Date after:</label>
                <g:datePicker name="date" default="none" precision="day" noSelection="[null: '--select--']"/>
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
                        <th>Task Type</th>
                        <th>User</th>
                        <th>Customer</th>
                        <th>Due Date</th>
                        <th>Task Priority</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <g:each in="${tasks}" var="eachTask">
                        <tr>
                            <td><span class="d-inline-block" data-toggle="tooltip" data-placement="top"
                                      title="${eachTask.detail}">${eachTask.title}
                                <g:if test="${eachTask.taskStatus == taskmgmt.enums.TaskStatus.COMPLETED}">
                                    <i class="fa fa-check"
                                       aria-hidden="true"></i>
                                </g:if></span></td>
                           <td>${eachTask.taskType.title}</td>
                        <td>
                        <g:if test="${eachTask.user == null}">
                                <div class="label label-warning">No data</div>
                        </g:if>
                            <g:else>
                                <mark>${eachTask?.user?.firstName} ${eachTask?.user?.lastName}</mark>
                            </g:else>
                            </td>
                            <td>
                                <g:if test="${eachTask.customer == null}">
                                    <div class="label label-warning">No data</div>
                                </g:if>
                                <g:else>
                                    <mark>${eachTask?.customer?.firstName} ${eachTask?.customer?.lastName}</mark>
                                </g:else>
                            </td>
                            <td>
                                    <common:dueDate dateValue="${eachTask?.dueDate}"/>
                            </td>
                            <td>
                                ${eachTask.taskPriority}
                            </td>
                            <td>${eachTask.taskStatus}</td>

                            <td>
                                <g:link controller="Task" action="detail" id="${eachTask.id}"
                                        class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                       aria-hidden="true"></i> View Details</g:link>
                            </td>
                            </tr>
                    </g:each>
                </table>
            </div>
            <ul class="pagination pagination-md">
                <li>
                    <g:paginate next="Next" prev="Prev" maxsteps="0" controller="task" action="list"
                                total="${listCount}"/>
                </li>

            </ul>

        </div>
    </div>
</div>
</body>
</html>