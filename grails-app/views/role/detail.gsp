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
                                class="btn btn-success btn-sm"><i class="fa fa-edit"
                                                                  aria-hidden="true"></i> Edit</g:link>
                    </th>
                    <th class="bottom-right">
                    %{--sends delete request as POST form submission--}%
                        <g:form controller="role" action="delete" id="${detailRole.id}" method="POST">
                            <button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                    data-target="#roleDeleteModal"><i class="fa fa-trash"
                                                                      aria-hidden="true"></i> Delete Task
                            </button>
                        </g:form>
                    </th>
                </tr>
            </table>

            <!-- Modal -->
            <div class="modal fade" id="roleDeleteModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>

                            <h2 class="modal-title" id="exampleModalLongTitle">Delete Role</h2>
                        </div>

                        <div class="modal-body">
                            <h4>Are you sure you want to delete this role?</h4>
                        </div>

                        <div class="modal-footer">
                            <table class="table table-responsive">
                                <button type="button" class="btn btn-success" data-dismiss="modal"><i
                                        class="fa fa-times"
                                        aria-hidden="true"></i> No</button>
                                <g:form controller="role" action="delete" id="${detailRole.id}"
                                        method="POST">
                                    <button class="btn btn-danger"><i class="fa fa-trash"
                                                                      aria-hidden="true"></i> Yes</button>
                                </g:form>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        %{--end Modal--}%

    </div>
</div>
</div>

</body>
</html>