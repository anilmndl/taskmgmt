<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Task</title>
</head>

<body>
<g:render template="/task/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h2 class="alert-danger">${flash.message}</h2>
    <g:form controller="Task" action="save">
        <div class="form-group">
            <label><h4>Title of Task</h4></label>
            <input type="text" class="form-control" name="title" placeholder="Task Title">
        </div>

        <div class="form-group">
            <label><h4>Task type</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${taskTypeList}" name="taskType" optionKey="id"
                      optionValue="title" noSelection="['':'--Select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Username</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${userList}" name="users" optionKey="id"
                      optionValue="firstName" noSelection="['': '--Select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Due Date</h4></label>
            <g:datePicker name="dueDate" noSelection="[null:'--select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Detail</h4></label>
            <textarea class="form-control" placeholder="Detail Task" name="detail"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
