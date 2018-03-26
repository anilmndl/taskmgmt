<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Tasktype</title>
</head>

<body>
<g:render template="/taskType/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h1>Create Task Type</h1>
    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>
    <g:form controller="taskType" action="update" id="${taskType.id}">
        <div class="form-group">
            %{--input attribute 'required'--}%
            <label><h3>Task-type Title*</h3></label>
            <input type="text" class="form-control" name="title" placeholder="Task Type Description" required="required"
                   value="${taskType.title}">
        </div>

        <div class="form-group">
            %{--input attribute 'required'--}%
            <label><h3>Description*</h3></label>
            <textarea class="form-control" placeholder="Detail Task"
                      name="description" required="required">${taskType.description}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
