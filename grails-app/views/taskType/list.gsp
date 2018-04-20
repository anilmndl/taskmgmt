<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task Type List</title>
</head>

<body>
<g:render template="/taskType/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Task Type List</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for tasktype:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
                <g:link controller="taskType" action="create" class="btn btn-primary  btn-xs"><i class="fa fa-plus"
                                                                                             aria-hidden="true"></i> New TaskType</g:link>
            </div>
        </g:form>
    </fieldset>


    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>TasksType List</strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>Task Type</th>
                        <th>Date Created</th>
                        <th>Date Modified</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${taskTypeList}">
                        <g:each in="${taskTypeList}" var="eachTaskType">
                        %{--<g:if test="${eachTaskType.dateDeleted == null}">--}%
                            <tr>
                                <td><g:link controller="taskType" action="detail"
                                            id="${eachTaskType.id}">${eachTaskType.title}</g:link></td>
                                <td><common:dateFormatWithTime dateValue="${eachTaskType.dateCreated}"/></td>
                                <td><common:dateFormatWithTime dateValue="${eachTaskType.dateModified}"/></td>
                                <td><g:link controller="taskType" action="detail" id="${eachTaskType.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                           aria-hidden="true"></i> View Detail</g:link>

                                </td>
                            </tr>
                        %{--</g:if>--}%
                        </g:each>

                    </g:if>

                </table>

            </div>

            <ul class="pagination pagination-sm">
                <li>
                    <g:paginate next="Forward" prev="Back" controller="taskType" action="list" total="${listCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>