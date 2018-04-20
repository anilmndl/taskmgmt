<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User detail</title>
</head>

<body>
<g:render template="/user/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
<h1 class="page-header">User Details</h1>

<g:if test="${flash.message}">
    <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
</g:if>
<g:if test="${user}">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="jumbotron"
                <g:hiddenField name="id" value="${user.id}"/>
                <p>

                <h3 class="text-center">${user.firstName}</h3></p>
                <hr>
                <table class="table table-responsive">
                    <label>Details:</label>
                    <tr>
                        <td>First Name:</td>
                        <td><strong><em>${user.firstName}</em></strong></td>
                    </tr>
                    <tr>
                        <td>Middle Name:</td>
                        <td><strong><em>${user.middleName}</em></strong></td>
                    </tr>


                    <tr>
                        <td>
                            Last Name:</td>
                        <td><strong><em>${user.lastName}</em></strong></td>
                    </tr>

                    <tr>
                        <td>
                            UserName:</td>
                        <td><strong><em>${user.username}</em></strong></td>
                    </tr>

                    <tr>
                        <td>Address:</td>
                        <td><address>
                            ${user.address?.line1}<br/>
                            ${user.address?.line2}<br/>
                            ${user.address?.city}, ${user.address?.state}, ${user.address?.postalCode}<br/>
                            ${user.address?.country}
                        </address></td>
                    </tr>

                    <tr>
                        <td>Phone Number:</td>
                        <td><strong><em>${user.phoneNumber}</em></strong></td>
                    </tr>

                    <tr>
                        <td>Task Types</td>
                        <td>
                            <div class="list-group">

                                <g:if test="${user.taskTypes}">
                                    <g:each var="taskType" in="${user.taskTypes}">
                                        <g:form controller="user" action="subscribe" id="${user.id}"
                                                method="POST" class="form-inline">
                                            <div class=" list-group-item list-inline">${taskType.title}
                                            <g:hiddenField name="isSubscribe" value="false"/>
                                            <g:hiddenField name="taskType" value="${taskType.id}"/>
                                                <button type="submit" class="btn btn-default btn-sm">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </g:form>
                                    </g:each>
                                </g:if>
                                <div class="list-group-item list-inline">
                                    <g:form class="form-group" controller="user" action="subscribe" id="${user.id}"
                                            method="POST">
                                        <g:hiddenField name="isSubscribe" value="true"/>
                                        <div class="form-group form-inline">
                                            <g:select class="form-control dropdown-toggle" from="${taskTypes}"
                                                      name="taskType"
                                                      optionKey="id" optionValue="title" required="required"
                                                      value="${taskTypes?.id}"/>
                                            <button type="submit" class="btn btn-success">Subscribe</button>
                                        </div>

                                    </g:form>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <h5>Date Created: <div class="label label-info"><common:dateFormatWithTime
                            dateValue="${user.dateCreated}"/></div></h5>
                </table>
                <table class="table table-responsive">
                    <tr>
                        <th><g:link controller="user" action="edit" id="${user.id}"
                                    class="btn btn-success btn-sm"><i class="fa fa-edit"
                                                                      aria-hidden="true"></i> Edit</g:link></th>
                    <th class="bottom-right">
                        <g:if test="${user.vacationMode==false}">
                            <th><g:link controller="user" action="Vacation" id="${user.id}"
                                        class="btn btn-success btn-sm"><i class="fa fa-edit"
                                                                          aria-hidden="true"></i> Vacataion Mode ON</g:link>
                            </th>
                            <th class="bottom-right">
                        </g:if>
                        <g:else><th><g:link controller="user" action="Working" id="${user.id}"
                                            class="btn btn-success btn-sm"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i> Working Mode ON</g:link>
                        </th>
                            <th class="bottom-right"></g:else>
                        %{--sends delete request as POST form submission--}%
                        <g:form controller="user" action="delete" id="${user.id}" method="POST">
                            <button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                    data-target="#userDeleteModal"><i class="fa fa-trash"
                                                                      aria-hidden="true"></i> Delete Task
                            </button>
                        </g:form>
                    </th>
                    </tr>
                </table>

                <!-- Modal -->
                <div class="modal fade" id="userDeleteModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                                <h2 class="modal-title" id="exampleModalLongTitle">Delete User</h2>
                            </div>

                            <div class="modal-body">
                                <h4>Are you sure you want to delete this user?</h4>
                            </div>

                            <div class="modal-footer">
                                <table class="table table-responsive">
                                    <button type="button" class="btn btn-success" data-dismiss="modal"><i
                                            class="fa fa-times"
                                            aria-hidden="true"></i> No</button>
                                    <g:form controller="user" action="delete" id="${user.id}"
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
    </div>
</g:if>

</div>

</body>
</html>