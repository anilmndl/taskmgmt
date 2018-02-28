<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Tasktype</title>
</head>
<body>
<g:render template="/layouts/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="TaskType" action="save">
        <div class="form-group">
           <label><h1>Topic of Task Type</h1></label>
            <input type="text" class="form-control" name="title" placeholder="Task Type Description" >
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
