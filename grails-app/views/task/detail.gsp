<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task Details</title>
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
            <g:hiddenField name="id" value="${task.id}"/>

            <h2 class="text-center">${task.title}</h2>

            <hr>

            <h5>Date Created: <div class="label label-info"><common:dateFormatWithTime
                    dateValue="${task.dateCreated}"/></div></h5>
            <g:if test="${task.dateModified != null}">
                <h5>Last Modified: <div class="label label-default"><common:dateFormatWithTime
                        dateValue="${task.dateModified}"/></div></h5>
            </g:if>
            <h4 class="alert alert-info">${task.detail}</h4>
            <table class="table table-responsive">
                <h4><tr>
                    <td>Due Date:</td>
                    <g:if test="${task.dueDate == null}">
                        <td><common:dateFormatWithTime dateValue="${task.dueDate}"/></td>
                    </g:if>
                    <g:else>
                        <td><div class="label label-success"><common:dateFormatWithTime
                                dateValue="${task.dueDate}"/></div></td>
                    </g:else>
                </tr>
                </h4>
                <tr>
                    <td>Task Status:</td>
                    <td>${task.taskStatus}</td>
                </tr>
                <tr>
                    <td>Task Priority:</td>
                    <td>${task.taskPriority}</td>
                </tr>
                <tr>
                    <td>User:</td>
                    <td>
                        <g:if test="${task.user == null}">
                            <div class="label label-warning">No data</div>
                        </g:if>
                        <g:else>
                            <g:link controller="user" id="${task.user.id}"
                                    action="detail">

                                <mark>${task?.user?.firstName} ${task?.user?.lastName}</mark>

                            </g:link>
                        </g:else>
                    </td>
                </tr>
                <tr>
                    <td>Customer:</td>
                    <td>
                        <g:if test="${task.customer == null}">
                            <div class="label label-warning">No data</div>
                        </g:if>
                        <g:else>
                            <g:link controller="customer" id="${task.customer.id}"
                                    action="detail">

                                <mark>${task?.customer?.firstName} ${task?.customer?.lastName}</mark>

                            </g:link>
                        </g:else>
                    </td>
                </tr>
                <tr>
                    <td>Task-type:</td>
                    <td>${task.taskType.title}</td>
                </tr>
                <tr>
                    <td>Date Completed:</td>
                    <g:if test="${task.dateCompleted == null}">
                        <td><common:dateFormatWithTime dateValue="${task.dateCompleted}"/></td>
                    </g:if>
                    <g:else>
                        <td><div class="label label-success"><common:dateFormatWithTime
                                dateValue="${task.dateCompleted}"/></div></td>
                    </g:else>

                </tr>
            </table>
            <g:if test="${task.taskStatus != taskmgmt.enums.TaskStatus.COMPLETED && currentUser!=null}">
                <table class="table table-responsive">
                    <tr>
                        <g:if test="${task.dateCompleted == null}">
                            <th>
                                <g:link controller="task" action="edit" id="${task.id}"
                                        class="btn btn-info btn-sm"><i class="fa fa-edit"
                                                                       aria-hidden="true"></i> Edit Task</g:link>
                            </th>
                            </th>
                            <g:if test="${task.taskStatus == taskmgmt.enums.TaskStatus.CREATED || task.taskStatus == taskmgmt.enums.TaskStatus.UNASSIGNED}">
                                <th><g:form controller="task" action="assigned" id="${task.id}" method="POST">
                                    <button type="button" class="btn btn-success btn-sm pull-left" data-toggle="modal"
                                            data-target="#assignUserModal"><i class="fa fa-male"
                                                                              aria-hidden="true"></i> Assign User
                                    </button>
                                </g:form>
                                    <g:render template="/task/assignUserModal"/>
                                </th>
                            </g:if>
                            <g:elseif test="${task.taskStatus == taskmgmt.enums.TaskStatus.ASSIGNED}">
                                <th><g:link controller="task" action="unassigned" id="${task.id}"
                                            class="btn btn-warning btn-sm"><i class="fa fa-ticket"
                                                                              aria-hidden="true"></i> Unassign User</g:link>
                                </th>
                                <th><g:link controller="task" action="inProgress" id="${task.id}"
                                            class="btn btn-success btn-sm"><i class="fa fa-flag"
                                                                              aria-hidden="true"></i> Mark as "In-Progress"</g:link>
                                </th>
                            </g:elseif>
                            <g:elseif test="${task.taskStatus == taskmgmt.enums.TaskStatus.IN_PROGRESS}">
                                <th><g:link controller="task" action="completed" id="${task.id}"
                                            class="btn btn-success btn-sm pull-left"><i class="fa fa-check"
                                                                                        aria-hidden="true"></i> Mark Completed</g:link>
                                </th>
                            </g:elseif>

                        </g:if>
                        <g:if test="${task.taskStatus == taskmgmt.enums.TaskStatus.ASSIGNED}">
                            <th>
                                <g:form controller="task" action="reassignTask" id="${task.id}" method="POST">
                                    <button type="button" class="btn btn-primary btn-sm pull-left" data-toggle="modal"
                                            data-target="#assignUserModal"><i class="fa fa-male"
                                                                              aria-hidden="true"></i> Reassign User
                                    </button>
                                </g:form>
                            </th>
                        </g:if>

                        <th class="bottom-right">
                        %{--sends delete request as POST form submission--}%
                            <g:form controller="task" action="delete" id="${task.id}" method="POST">
                                <button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                        data-target="#taskDeleteModal"><i class="fa fa-trash"
                                                                          aria-hidden="true"></i> Delete Task
                                </button>
                            </g:form>
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
                                                        class="fa fa-male"
                                                        aria-hidden="true"></i> No</button>
                                                <g:form controller="task" action="delete" id="${task.id}"
                                                        method="POST">
                                                    <button class="btn btn-danger"><i class="fa fa-trash"
                                                                                      aria-hidden="true"></i> Yes
                                                    </button>
                                                </g:form>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            %{--end Modal--}%
                        </th>

                    </tr>
                </table>
            </g:if>

        </h4>
        </div>

        <g:if test="${task.taskStatus != taskmgmt.enums.TaskStatus.COMPLETED}">
            <fieldset>
                <div class="form-group">
                    <div class="panel panel-body">
                        <label><h3>Comment</h3></label>
                        <g:form controller="task" action="saveComment">
                            <textarea class="form-control" placeholder="Post your Comment" name="content"></textarea>
                            <g:hiddenField name="task" value="${task.id}"/>
                            <g:hiddenField name="user" value="${currentUser?.id}"/>
                            <div class="bottom-right">

                                <button type="submit" class="btn btn-info btn-lg pull-right"
                                        aria-hidden="true"></i> Post</button></div>
                        </g:form>
                    </div>
                    <g:if test="${commentList}">
                        <table class="table table-striped">
                            <g:each in="${commentList}" var="commentText">
                                <tr>
                                    <td><blockquote class="blockquote"><b class="text-success"><g:if
                                            test="${commentText.user == null}">Anynomous</g:if>
                                        <g:else>
                                            <g:link controller="user" id="${commentText.user.id}"
                                                    action="detail">
                                                ${commentText.user.firstName} ${commentText.user.lastName}
                                            </g:link>
                                        </g:else></b> ${commentText.content}<footer>
                                        <common:dateFormatWithTime dateValue="${commentText.dateCreated}"/>
                                    </footer></blockquote></td>
                                </tr>
                            </g:each>
                        </table>
                    </g:if>

                </div>
            </fieldset>
        </g:if>

    </div>
</div>

</div>

</body>
</html>