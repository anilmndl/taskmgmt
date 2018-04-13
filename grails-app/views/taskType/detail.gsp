%{--Detail view page for task type--}%
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task List</title>
</head>

<body>
<g:render template="/taskType/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Task Type Detail</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>

    <div class="container-fluid">
        <div class="jumbotron">
            <h1>${detailTaskType.title}</h1>

            <h4 class="tab-content">Date Created: <common:dateFormatWithTime
                    dateValue="${detailTaskType.dateCreated}"/></h4>
            <g:if test="${detailTaskType.dateModified != null}"><h4>Last Modified:
                <common:dateFormatWithTime dateValue="${detailTaskType.dateModified}"/></h4></g:if>

            <span><h3 class="alert alert-info">${detailTaskType.description}</h3></span>

            <div class="form-inline ">
                <h2>TaskTypes</h2>
                <g:if test="${detailTaskType.linkedTaskTypes}">
                    <ul>
                        <g:each var="taskType" in="${detailTaskType.children}">
                            <li>${taskType.title}
                                <g:form controller="taskType" action="assign" id="${detailTaskType.id}"
                                        method="POST">
                                    <g:hiddenField name="isAssign" value="false"/>
                                    <g:hiddenField name="toAssign" value="${taskType.id}"/>
                                    <button type="submit" class="btn btn-default btn-sm ">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </g:form>
                            </li>
                        </g:each>
                    </ul>
                </g:if>
                <div class="list-inline">
                    <g:form class="form-group"
                            controller="taskType" action="assign" id="${detailTaskType.id}"
                            method="POST">
                        <g:hiddenField name="isAssign" value="true"/>
                        <div class="form-group form-inline">
                            <g:select from="${taskTypes}"
                                      name="taskType"
                                      optionKey="id" optionValue="title" required="required"
                                      value="${taskTypes.id}"/>
                            <button type="submit" class="btn btn-success">Assign</button>
                        </div>

                    </g:form>
                </div>
            </div>

            <table class="table table-responsive">
                <tr>
                    <th>
                        <g:link controller="taskType" action="edit" id="${detailTaskType.id}"
                                class="btn btn-success"><i class="fa fa-edit"
                                                           aria-hidden="true"></i> Edit</g:link>
                    </th>
                    <th class="bottom-right">
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="taskType" action="delete" id="${detailTaskType.id}" method="POST">
                            <button type="button" class="btn btn-danger pull-right"
                                    data-toggle="modal"
                                    data-target="#taskTypeDeleteModal"><i class="fa fa-trash"
                                                                          aria-hidden="true"></i> Delete
                            </button>
                        </g:form>
                    </th>
                </tr>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="taskTypeDeleteModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>

                            <h2 class="modal-title" id="exampleModalLongTitle">Delete TaskType</h2>
                        </div>

                        <div class="modal-body">
                            <h4>Are you sure you want to delete the Task Type?</h4>
                        </div>

                        <div class="modal-footer">
                            <table class="table table-responsive">
                                <button type="button" class="btn btn-success" data-dismiss="modal"><i
                                        class="fa fa-times"
                                        aria-hidden="true"></i> No</button>
                                <g:form controller="taskType" action="delete" id="${detailTaskType.id}"
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
    </div>
</body>
</html>