<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task List</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Task Details</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>

    <div class="container-fluid">
        <div class="jumbotron">
            <g:hiddenField name="id" value="${tasks.id}"/>

            <h2 class="text-center">${tasks.title}</h2>

            <hr>

            <h5>Date Created: <div class="label label-info"><common:dateFormatWithTime
                    dateValue="${tasks.dateCreated}"/></div></h5>
            <g:if test="${tasks.dateModified != null}">
                <h5>Last Modified: <div class="label label-default"><common:dateFormatWithTime
                        dateValue="${tasks.dateModified}"/></div></h5>
            </g:if>
            <h4 class="alert alert-info">${tasks.detail}</h4>
            <table class="table table-responsive">
                <h4><tr>
                    <td>Due Date:</td>
                    <g:if test="${tasks.dueDate == null}">
                        <td><common:dateFormatWithTime dateValue="${tasks.dueDate}"/></td>
                    </g:if>
                    <g:else>
                        <td><div class="label label-success"><common:dateFormatWithTime
                                dateValue="${tasks.dueDate}"/></div></td>
                    </g:else>
                </tr>
                </h4>
                <tr>
                    <td>Task Status:</td>
                    <td><strong><em>${tasks.taskStatus}</em></strong></td>
                </tr>
                <tr>
                    <td>Task Priority:</td>
                    <td>${tasks.taskPriority}</td>
                </tr>
                <tr>
                    <td>User:</td>
                    <g:if test="${tasks.users == null}">
                        <td><div class="label label-warning">No data</div></td>
                    </g:if>
                    <td><mark>${tasks?.users?.firstName} ${tasks?.users?.lastName}</mark></td>
                </tr>
                <tr>
                    <td>Task-type:</td>
                    <td>${tasks.taskType.title}</td>
                </tr>
                <tr>
                    <td>Date Completed:</td>
                    <g:if test="${tasks.dateCompleted == null}">
                        <td><common:dateFormatWithTime dateValue="${tasks.dateCompleted}"/></td>
                    </g:if>
                    <g:else>
                        <td><div class="label label-success"><common:dateFormatWithTime
                                dateValue="${tasks.dateCompleted}"/></div></td>
                    </g:else>

                </tr>
            </table>
            <table class="table table-responsive">
                <tr>
                    <g:if test="${tasks.dateCompleted == null}">
                        <g:if test="${tasks.taskStatus != taskmgmt.enums.TaskStatus.LOCKED}">
                            <th>
                                <g:link controller="task" action="edit" id="${tasks.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-edit"
                                                                       aria-hidden="true"></i> Edit Task</g:link></th>
                            </th>
                            <th><g:link controller="task" action="locked" id="${tasks.id}"
                                        class="btn btn-warning btn-sm"><i class="fa fa-lock"
                                                                          aria-hidden="true"></i> Lock Task</g:link>
                            </th>
                        </g:if>
                        <g:else>
                            <th><g:link controller="task" action="unlocked" id="${tasks.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-unlock"
                                                                       aria-hidden="true"></i> Unlock Task</g:link></th>
                        </g:else>
                        <th><g:link controller="task" action="completed" id="${tasks.id}"
                                    class="btn btn-success btn-sm pull-left"><i class="fa fa-check"
                                                                                aria-hidden="true"></i> Mark Completed</g:link>
                        </th>
                    </g:if>
                    <th class="bottom-right">
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="task" action="delete" id="${tasks.id}" method="POST">
                            <button class="btn btn-danger btn-sm pull-right"><i class="fa fa-times"
                                                                                aria-hidden="true"></i> Delete Task
                            </button>
                        </g:form>
                    </th>
                </tr>
            </table>
        </h4>
        </div>
    </div>
</div>

</div>

</body>
</html>