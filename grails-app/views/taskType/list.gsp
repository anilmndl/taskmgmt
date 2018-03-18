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

    <form class="form-horizontal">
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="title" class="col-sm-3 control-label">TaskType:</label>

                <div class="col-sm-9">
                    <g:textField name="title" value="${params.title}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <div class="pull-right">
                    <g:link controller="TaskType" action="list" class="btn btn-danger btn-sm"><i class="fa fa-times"
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
                <div class="panel-heading"><strong>TasksType List</strong></div>
                <table class="table table-striped">
                    <tr>
                        <th>Task Type</th>
                        <th>Date Created</th>
                        <th>Date Modified</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${typeList}">
                        <g:each in="${typeList}" var="show">
                        %{--<g:if test="${show.dateDeleted == null}">--}%
                            <tr>
                                <td><g:link controller="taskType" action="detail"
                                            id="${show.id}">${show.title}</g:link></td>
                                <td><common:dateFormatWithTime dateValue="${show.dateCreated}"/></td>
                                <td><common:dateFormatWithTime dateValue="${show.dateModified}"/></td>
                                <td><g:link controller="taskType" action="detail" id="${show.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                           aria-hidden="true"></i> View Detail</g:link>
                                    <g:link controller="taskType" action="edit" id="${show.id}"
                                            class="btn btn-success btn-xs"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Edit</g:link>
                                </td>
                            </tr>
                        %{--</g:if>--}%
                        </g:each>

                    </g:if>

                </table>

            </div>

            <div>
                <g:paginate controller="taskType" action="list" total="${listCount}"></g:paginate>
            </div>
        </div>
    </div>
</div>
</body>
</html>