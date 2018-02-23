<%@ page import="groovyx.gpars.dataflow.Dataflow" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Edit Task</title>
</head>
<body>
<g:render template="/task/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="task" action="update" id="${editTask.id}">
        <div class="form-group">
            <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control"  name="title" placeholder="Task Title" value="${editTask.title}">
        </div>
        <div class="form-group">
            <label><h2>Detail</h2></label>
            <textarea class = "form-control" placeholder="Detail Task" name ="detail">${editTask.detail}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
