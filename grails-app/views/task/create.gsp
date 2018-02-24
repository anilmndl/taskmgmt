<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Task</title>
</head>
<body>
<g:render template="/task/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="task" action="save">
        <div class="form-group">
           <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control"  name="title" placeholder="Task Title" >
        </div>
        <div class="form-group">
            <label><h2>Detail</h2></label>
            <textarea class = "form-control" placeholder="Detail Task" name ="detail"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>