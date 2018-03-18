<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Task Type</title>
</head>

<body>
<g:render template="/task/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="Task" action="update" id="${editTask?.id}">
        <h2 class="alert-danger">${flash.message}</h2>
        <div class="form-group">
            <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control" name="title" placeholder="Task Title" value="${editTask?.title}">
        </div>

        <div class="form-group">
            <label><h4>Task type</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${taskTypeList}" name="taskType" optionKey="id"
                      optionValue="title" value="${editTask?.taskType?.id}" noSelection="['': '--Select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Username</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${userList}" name="users" optionKey="id"
                      optionValue="firstName" value="${editTask?.users?.id}" noSelection="['': '--Select--']"/>
        </div>

        <div class="form form-inline">
            <label><h4>Due Date</h4></label>
            <input type="date" class="form-control" name="dueDate" value="${editTask?.dueDate}">
        </div>

        <div class="form-group">
            <label><h2>Detail</h2></label>
            <textarea class="form-control" placeholder="Detail Task" name="detail">${editTask?.detail}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
