<!doctype html>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Update Role</title>
</head>

<body>
<g:render template="/role/sidebar"/>
<div class="col-sm-10 col-md-offset-2 main">
    <h1>Update Role</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>

    <div>
        <h5>Date Created: <common:dateFormatWithTime dateValue="${editRole.dateCreated}"/></h5>
        <g:if test="${editRole.dateModified != null}"><h5>Last Modified:
            <common:dateFormatWithTime dateValue="${editRole.dateModified}"/></h5></g:if>
    </div>
    <g:form controller="Role" action="update" id="${editRole.id}">
        <div class="form-group">
            <label><h4>Role Title*</h4></label>
            <input type="text" class="form-control" name="title" placeholder="Role Title" value="${editRole.title}" required="required">
        </div>

        <div class="form-group">
            <label><h4>Role Description</h4></label>
            <textarea class="form-control" placeholder="Role Description"
                      name="description">${editRole.description}</textarea>
        </div>
        <button type="submit" class="btn btn btn-primary">Update</button>
    </g:form>
</div>
</body>
</html>
