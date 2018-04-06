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
                    <td>
                        <g:if test="${tasks.users == null}">
                            <div class="label label-warning">No data</div>
                        </g:if>
                        <g:else>
                            <g:link controller="user" id="${tasks.users.id}"
                                    action="detail">

                                <mark>${tasks?.users?.firstName} ${tasks?.users?.lastName}</mark>

                            </g:link>
                        </g:else>
                    </td>
                </tr>
                <tr>
                    <td>Customer:</td>
                    <td>
                        <g:if test="${tasks.customer == null}">
                            <div class="label label-warning">No data</div>
                        </g:if>
                        <g:else>
                            <g:link controller="customer" id="${tasks.customer.id}"
                                    action="detail">

                                <mark>${tasks?.customer?.firstName} ${tasks?.customer?.lastName}</mark>

                            </g:link>
                        </g:else>
                    </td>
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
                        <g:if test="${tasks.taskStatus == taskmgmt.enums.TaskStatus.CREATED || tasks.taskStatus == taskmgmt.enums.TaskStatus.UNASSIGNED}">
                            <th>
                                <g:link controller="task" action="edit" id="${tasks.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-edit"
                                                                       aria-hidden="true"></i> Edit Task</g:link></th>
                            </th>
                            <th><g:link controller="task" action="assigned" id="${tasks.id}"
                                        class="btn btn-warning btn-sm"><i class="fa fa-lock"
                                                                          aria-hidden="true"></i> Assigned Task</g:link>
                            </th>
                        </g:if>
                        <g:elseif test="${tasks.taskStatus == taskmgmt.enums.TaskStatus.ASSIGNED}">
                            <th><g:link controller="task" action="unassigned" id="${tasks.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-unlock"
                                                                       aria-hidden="true"></i> Unassigned Task</g:link></th>
                            <th><g:link controller="task" action="inProgress" id="${tasks.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-inprogress"
                                                                       aria-hidden="true"></i> In_Progress Task</g:link>
                            </th>
                        </g:elseif>
                        <g:elseif test="${tasks.taskStatus == taskmgmt.enums.TaskStatus.IN_PROGRESS}">
                            <th><g:link controller="task" action="completed" id="${tasks.id}"
                                        class="btn btn-success btn-sm pull-left"><i class="fa fa-check"
                                                                                    aria-hidden="true"></i> Mark Completed</g:link>
                            </th>
                        </g:elseif>

                    </g:if>

                    <th class="bottom-right">
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="task" action="delete" id="${tasks.id}" method="POST">
                            <button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                    data-target="#taskDeleteModal"><i class="fa fa-trash"
                                                                      aria-hidden="true"></i> Delete Task
                            </button>
                        </g:form>
                    </th>
                </tr>
            </table>

            <!-- Modal -->
            <div class="modal fade" id="taskDeleteModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>

                            <h2 class="modal-title" id="exampleModalLongTitle">Delete Task</h2>
                        </div>

                        <div class="modal-body">
                            <h4>Are you sure you want to delete this task?</h4>
                        </div>

                        <div class="modal-footer">
                            <table class="table table-responsive">
                                <button type="button" class="btn btn-success" data-dismiss="modal"><i
                                        class="fa fa-times"
                                        aria-hidden="true"></i> No</button>
                                <g:form controller="task" action="delete" id="${tasks.id}"
                                        method="POST">
                                    <button class="btn btn-danger"><i class="fa fa-trash"
                                                                      aria-hidden="true"></i> Yes</button>
                                </g:form>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        %{--end Modal--}%

    </h4>
    </div>


    <fieldset>
        <div class="form-group">
            <label>Comment</label>
            <g:form controller="task" action="saveComment">
                <textarea class="form-control" placeholder="Post your Comment" name="comment"></textarea>
                <g:hiddenField name="task" value="${tasks.id}"/>
                <g:hiddenField name="users" value="${tasks.users.id}"/>
                <div class="bottom-right">

                        <button type="submit" class="btn btn-info btn-sm pull-right"
                                                                  aria-hidden="true"></i> Post </button>
            </g:form>
            <g:if test="${commentList}">
                <table class="table table-striped">
                    <g:each in="${commentList}" var="review">
                        <tr>
                            <td><common:dateFormatWithTime dateValue="${review.dateCreated}"/> </td>
                        </tr>
                        <tr>
                            <td>${review.comment}</td>
                        </tr>
                    </g:each>
                </table>
            </g:if>


        </div>
        </div>
    </fieldset>


</div>
</div>

</div>

</body>
</html>