<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task Type List</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Task Type List</h1>


    <div class="row">
    <div class="col-sm-12">
        <div class="panel panel-default">
            <div class="panel-heading"><strong>Tasks</strong></div>
            <table class="table table-striped">
                <tr>
                    <th>Task Type</th>
                    <th>Date Created</th>
                    <th>Date Modified</th>
                    <th>Action</th>
                </tr>
                <g:if test="${typeList}">
                    <g:each in="${typeList.reverse()}" var="show">
                        <g:if test="${show.flag != "deleted"}">
                            <tr>
                                <td><g:link controller="Task" action="detail">${show.title}</g:link></td>
                                <td>${show.dateCreated}</td>
                                <td><g:link controller="TaskType" action="edit" id="${show.id}"
                                            class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Edit</g:link>
                                </td>
                                <td><g:link controller="TaskType" action="delete" id="${show.id}"
                                            class="btn btn-danger btn-xs"><i class="fa fa-times"
                                                                              aria-hidden="true"></i> Delete</g:link>

                                </td>
                            </tr>
                        </g:if>
                    </g:each>

                </g:if>

            </table>
        </div>
    </div>
    </div>
</div>
</body>
</html>