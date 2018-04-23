<%@ page import="taskmgmt.enums.TaskPriority" %>
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
        <h1>Update Task</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
        </g:if>

        <div class="form-group">
            <label><h4>Title of Task</h4></label>
            <input type="text" class="form-control" name="title" placeholder="Task Title" value="${editTask?.title}">
        </div>

        <div class="form-group">
            <label><h4>Task type*</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${taskTypeList}" name="taskType" optionKey="id"
                      optionValue="title" value="${editTask?.taskType?.id}" noSelection="['': '--Select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Username</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${userList}" name="user" optionKey="id"
                      optionValue="firstName" value="${editTask?.user?.id}" noSelection="['': '--Select--']"/>
        </div>
        <div class="form-group">
            <label><h4>Customer</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${customerList}" name="customer" optionKey="id"
                      optionValue="firstName" value="${editTask?.customer?.id}" noSelection="['': '--Select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Task Priority</h4></label>
            <g:select class="btn btn-default dropdown-toggle" from="${taskmgmt.enums.TaskPriority.values()}" name="taskPriority" optionKey="key"
                      optionValue="value"/></div>

        <div class="form-group">
            <label><h4>Due Date</h4></label>
            <g:datePicker name="dueDate" value="${editTask.dueDate}" precision="day" noSelection="[null:'--select--']"/>
        </div>

        <div class="form-group">
            <label><h4>Detail</h4></label>
            <textarea class="form-control" placeholder="Detail Task" name="detail">${editTask?.detail}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
