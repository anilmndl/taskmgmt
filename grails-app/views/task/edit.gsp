<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Task Type</title>
</head>
<body>
<g:render template="/layouts/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <g:form controller="Task" action="update" id="${editTask.id}">
        <div class="form-group">
            <label><h1>Title of Task</h1></label>
            <input type="text" class="form-control"  name="title" placeholder="Task Title" value="${editTask.title}">
        </div>
        <div class="form-group">

            <select class="selectpicker" name="taskType">
               %{-- <option name="${editTask.taskType.title}"    value="taskTypes">${editTask.taskType.title}</option>--}%
                <g:each in="${taskTypeList}" var="taskTypes">
                    <option name="${taskTypes.title}"    value="taskTypes">${taskTypes.title}</option>
                </g:each>
            </select>
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
