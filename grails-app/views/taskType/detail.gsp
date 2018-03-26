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
            <table class="table table-responsive">
                <tr>
                    <th>
                        <g:link controller="taskType" action="edit" id="${detailTaskType.id}"
                                class="btn btn-success btn-sm">Edit</g:link>
                    </th>
                    <th>
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="taskType" action="delete" id="${detailTaskType.id}" method="POST">
                            <button class="btn btn-danger btn-sm pull-right">Delete</button>
                        </g:form>
                    </th>
                </tr>
            </table>
        </div>
    </div>

</div>
</body>
</html>