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

    <div class="container-fluid">
        <div class="jumbotron">
            <h1>${detailTaskType.title}</h1>

            <h4 class="tab-content">Date Created: ${detailTaskType.dateCreated}</h4>
            <g:if test="${detailTaskType.dateModified != null}"><h4>Last Modified: ${detailTaskType.dateModified}</h4></g:if>
            <h3>${detailTaskType.description}</h3>

            <table class="table-responsive col-sm-2">
                <tr>
                    <th>
                        <g:link controller="taskType" action="edit" id="${detailTaskType.id}"
                                class="btn btn-success btn-sm">Edit</g:link>
                    </th>
                    <th class="bottom-right">
                        <g:form controller="taskType" action="delete" id="${detailTaskType.id}" method="POST">
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </g:form>
                    </th>
                </tr>
            </table>
        </div>
    </div>

</div>

</body>
</html>