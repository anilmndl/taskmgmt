<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Task</title>
</head>

<body>
<g:render template="/layouts/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="Task" action="save">
        <div class="form-group">
            <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control" name="title" placeholder="Task Title">
        </div>

        <div class="form-group">
            <g:select from="${taskTypeList}" name="taskType" optionKey="id" optionValue="title"/>
        </div>

        <div class="form-group">
            <g:select from="${users}" name="users" optionKey="id" optionValue="${users.firstName} ${users.lastName}"/>
        </div>

        <div class="form-group">
            <label><h2>Detail</h2></label>
            <textarea class="form-control" placeholder="Detail Task" name="detail"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
