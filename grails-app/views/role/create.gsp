<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Create Role</title>
</head>

<body>
<g:render template="/role/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h2>Create Role</h2>
    <g:form controller="Role" action="save">
        <div class="form-group">
            <label><h4>Role Title</h4></label>
            <input type="text" class="form-control" name="title" placeholder="Role Title" required>
        </div>

        <div class="form-group">
            <label><h4>Role Description(optional)</h4></label>
            <textarea class="form-control" placeholder="Role Description" name="description"></textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Add</button>
    </g:form>
</div>
</body>
</html>
