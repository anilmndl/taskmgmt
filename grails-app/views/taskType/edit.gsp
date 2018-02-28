<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Tasktype</title>
</head>
<body>
<g:render template="/layouts/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="taskType" action="update" id="${taskType.id}">
        <div class="form-group">
            <label><h1>Update Task Type</h1></label>
            <input type="text" class="form-control" name="title" placeholder="Task Type Description" value="${taskType.title}" >
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
