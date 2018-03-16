<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Tasktype</title>
</head>
<body>
<g:render template="/taskType/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1>Create Task Type</h1>
    <g:form controller="TaskType" action="save">
        <div class="form-group">
            %{--input attribute 'required'--}%
            <label><h3>Topic of Task Type*:</h3></label>
            <input type="text" class="form-control" name="title" placeholder="Task Type Description" required="required" >

        </div>
        <div class="form-group">
            %{--input attribute 'required'--}%
            <label><h3>Description*:</h3></label>
            <textarea class="form-control" placeholder="Detail Task" name="description" required="required"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
