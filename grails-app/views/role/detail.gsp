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

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>
    <div class="container-fluid">
        <div class="jumbotron">
            <h1>${detailRole.title}</h1>

            <h4 class="tab-content">Date Created:
                <common:dateFormatWithTime dateValue="${detailRole.dateCreated}"/></h4>
            <g:if test="${detailRole.dateModified != null}"><h4>Last Modified:
                <common:dateFormatWithTime dateValue="${detailRole.dateModified}"/></h4></g:if>
            <h3 class="alert alert-info">${detailRole.description}</h3>
            <table class="table table-responsive col-sm-2">
                <tr>
                    <th>
                        <g:link controller="role" action="edit" id="${detailRole.id}"
                                class="btn btn-success btn-sm">Edit</g:link>
                    </th>
                    <th class="bottom-right">
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="role" action="delete" id="${detailRole.id}" method="POST">
                            <button class="btn btn-danger btn-sm pull-right">Delete</button>
                        </g:form>
                    </th>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>