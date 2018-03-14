<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Task</title>
</head>

<body>
<g:render template="/layouts/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <div class="alert alert-error" role="alert">${flash.message}</div>

    <g:form controller="Task" action="save">
        <div class="form-group">
            <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control" name="title" value="${params?.title}" placeholder="Task Title">
            <p class="form-control-static" id="hello"></p>
        </div>

        <div class="form-group">
            <g:select from="${taskTypeList}" name="taskType" optionKey="id" optionValue="title"/>
        </div>

        <div class="form-group">
            <g:select from="${userList}" name="users" optionKey="id" optionValue="firstName"/>
        </div>

        <div class="form-group">
            <label><h2>Detail</h2></label>
            <textarea class="form-control" placeholder="Detail Task" name="detail"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>

<g:javascript>
    $( document ).ready(function() {
        $("#hello").text("Hello amar");
    });
</g:javascript>

</body>
</html>
