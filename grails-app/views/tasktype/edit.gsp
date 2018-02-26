<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Tasktype</title>
</head>
<body>
<g:render template="/tasktype/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="Tasktype" action="update" id="${taskType.id}">
        <div class="form-group">
            <label><h1>Update Task Type</h1></label>
            <input type="text" class="form-control" name="tag" placeholder="Task Tag" value="${taskType.tag}" >
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
