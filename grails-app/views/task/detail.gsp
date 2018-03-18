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

    <g:if test="${tasks}">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:hiddenField name="id" value="${tasks.id}"/>
                        <p>

                        <h1 class="text-center">${tasks.title}</h1></p>
                        <table class="table table-responsive">
                            <tr>
                                <th><g:link controller="task" action="unlocked" id="${tasks.id}"
                                            class="btn btn-danger btn-sm">Unlocked</g:link></th>
                                <th><g:link controller="task" action="locked" id="${tasks.id}"
                                            class="btn btn-danger btn-sm">Locked</g:link></th>
                                <th><g:link controller="task" action="completed" id="${tasks.id}"
                                            class="btn btn-success btn-sm">Completed</g:link></th>
                                <th class="bottom-right">
                                %{--sends delete request as POST form submission--}%
                                    <g:form controller="task" action="delete" id="${tasks.id}" method="POST">
                                        <button class="btn btn-danger btn-sm pull-right">Delete</button>
                                    </g:form>
                                </th>
                            </tr>
                        </table>
                        <hr>

                        <h3>Details: ${tasks.detail}</h3>

                        <h4>Date Created: <common:dateFormatWithTime dateValue="${tasks.dateCreated}"/></h4>
                        <g:if test="${tasks.dateModified != null}">
                            <h4>Date Modified: <common:dateFormatWithTime dateValue="${tasks.dateModified}"/></h4>
                        </g:if>
                        <h4>Due Date: <common:dateFormatWithTime dateValue="${tasks.dueDate}"/></h4>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</div>

</body>
</html>