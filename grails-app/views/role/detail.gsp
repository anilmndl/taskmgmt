<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Role Details</title>
</head>

<body>
<g:render template="/role/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Role Details</h1>

    <div class="container-fluid">
        <div class="jumbotron">
            <h1>${detailRole.title}</h1>

            <h4 class="tab-content">Date Created: ${detailRole.dateCreated}</h4>
            <g:if test="${detailRole.dateModified != null}"><h4>Last Modified: ${detailRole.dateModified}</h4></g:if>
            <h3 class="alert-info">${detailRole.description}</h3>
            <g:link controller="Role" action="delete" id="${detailRole.id}"
                    class="btn btn-danger btn-sm pull-right">Delete</g:link>
            <g:link controller="Role" action="edit" id="${detailRole.id}"
                    class="btn btn-success btn-sm">Edit</g:link>
        </div>
    </div>
</div>

</body>
</html>