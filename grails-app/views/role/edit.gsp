<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Role</title>
</head>

<body>
<g:render template="/role/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h2>Update Role</h2>

    <div class="alert-info">
        <h5>Date Created: ${editRole.dateCreated}</h5>
        <g:if test="${editRole.dateModified != null}"><h5>Last Modified: ${editRole.dateModified}</h5></g:if>
    </div>
    <g:form controller="Role" action="update" id="${editRole.id}">
        <div class="form-group">
            <label><h4>Role Title</h4></label>
            <input type="text" class="form-control" name="title" placeholder="Role Title" value="${editRole.title}">
        </div>

        <div class="form-group">
            <label><h4>Role Description(optional)</h4></label>
            <textarea class="form-control" placeholder="Role Description"
                      name="description">${editRole.description}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
