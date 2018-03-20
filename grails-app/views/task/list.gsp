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

                                <g:if test="${show.taskStatus != taskmgmt.enums.TaskStatus.LOCKED}">
                                    <g:link
                                            controller="Task" action="edit" id="${show.id}"
                                            class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Edit
                                    </g:link>

                                </g:if>
                            </td>

                        </tr>
                    </g:each>
                %{--  </g:if>--}%

                </table>
            </div>

            <div>
                <g:paginate controller="task" action="list" total="${listCount}"></g:paginate>
            </div>
        </div>
    </div>
</div>
</body>
</html>