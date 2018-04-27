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
                <p>

                <g:if test="${user.vacationMode== true}">
                    <h4 class="text-center"> ( Is on vacation) </h4>
                </g:if>
                <g:else>
                    <h4 class="text-center">(Is Working) </h4>
                </g:else>

                </p>
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

                                <g:if test="${subscribeTaskType}">
                                    <g:each var="taskType" in="${subscribeTaskType}">
                                        <g:form controller="user" action="subscribe" id="${user.id}"
                                                method="POST" class="form-inline">
                                            <div class=" list-group-item list-inline">


                                                <g:if test="${authority.authority == "ROLE_ADMIN" || authority.id == user.id}">
                                                    <g:hiddenField name="isSubscribe" value="false"/>
                                                    <g:hiddenField name="taskType" value="${taskType.id}"/>
                                                        <button type="submit" class="btn btn-default btn-sm">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                </g:if>
                                            </div>
                                        </g:form>
                                    </g:each>
                                </g:if>

                                <g:if test="${authority.authority == "ROLE_ADMIN" || authority.id == user.id}">
                                <div class="list-group-item list-inline">
                                    <g:form class="form-group" controller="user" action="subscribe" id="${user.id}"
                                            method="POST">
                                        <g:hiddenField name="isSubscribe" value="true"/>
                                        <div class="form-group form-inline">
                                            <g:select class="form-control dropdown-toggle" from="${unSubscribedTaskTypes}"
                                                      name="taskType"
                                                      optionKey="id" optionValue="title" required="required"
                                                      value="${unSubscribedTaskTypes?.id}"/>
                                            <button type="submit" class="btn btn-success">Subscribe</button>
                                        </div>

                                    </g:form>
                                </div>
                                </g:if>

                            </div>
                        </td>
                    </tr>
                    <h5>Date Created: <div class="label label-info"><common:dateFormatWithTime
                            dateValue="${user.dateCreated}"/></div></h5>
                </table>
                <table class="table table-responsive">
                    <tr>
                        <g:if test="${authority.authority == "ROLE_ADMIN" || authority.id == user.id}">
                            <th><g:link controller="user" action="edit" id="${user.id}"
                                        class="btn btn-success btn-sm"><i class="fa fa-edit"
                                                                          aria-hidden="true"></i> Edit</g:link></th>
                        </g:if>
                    <th class="bottom-right">
                        <g:if test="${authority.authority == "ROLE_ADMIN" || authority.id == user.id}">
                            <g:if test="${user.vacationMode==false}">
                                <th><g:link controller="user" action="Vacation" id="${user.id}"
                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"
                                                                              aria-hidden="true"></i>Turn On Vacation Mode</g:link>
                                </th>
                                <th class="bottom-right">
                            </g:if>
                            <g:else><th><g:link controller="user" action="Working" id="${user.id}"
                                                class="btn btn-info btn-sm"><i class="fa fa-edit"
                                                                                  aria-hidden="true"></i> Turn on Working Mode </g:link>
                            </th>
                                <th class="bottom-right"></g:else>
                            %{--sends delete request as POST form submission--}%

                            <g:form controller="user" action="delete" id="${user.id}" method="POST">
                                <button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                        data-target="#deleteModal"><i class="fa fa-trash"
                                                                          aria-hidden="true"></i> Delete
                                </button>
                            </g:form>
                            <g:render template="/layouts/deleteModal" model="[data:user]"/>
                         </g:if>
                    </th>
                    </tr>
                </table>
        </div>
    </div>
    </div>
    </div>
</g:if>

</div>

</body>
</html>