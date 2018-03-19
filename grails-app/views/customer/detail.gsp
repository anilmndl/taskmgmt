<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Customer Detail</title>
</head>

<body>
<g:render template="/customer/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">${customer.firstName}'s Detail</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-danger" role="alert"><h2>${flash.message}</h2></div>
    </g:if>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <p>

                    <h3 class="text-center">${customer.firstName} ${customer.lastName}</h3></p>

                    <hr>

                    <p>Email: ${customer.email}</p>

                    <p>Phone Number: ${customer.phoneNumber}</p>

                    <p>Address: ${customer.address}</p>

                    <p>Date Created: <common:dateFormat dateValue="${customer.dateCreated}"/></p>

                    <table class="table table-responsive">
                        <tr>
                            <th>
                                <g:link controller="customer" action="edit" id="${customer.id}"
                                        class="btn btn-success"><i class="fa fa-edit"
                                                                aria-hidden="true"></i> Edit</g:link>
                            </th>
                            <th class="bottom-right">
                            %{--sends delete request as POST form submission--}%
                                <g:form controller="customer" action="delete" id="${customer.id}" method="POST">
                                    <button type="button" class="btn btn-danger pull-right"
                                            data-toggle="modal"
                                            data-target="#customerDeleteModal"><i class="fa fa-trash"
                                                                                  aria-hidden="true"></i> Delete
                                    </button>
                                </g:form>
                            </th>
                        </tr>
                    </table>

                    <!-- Modal -->
                    <div class="modal fade" id="customerDeleteModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h2 class="modal-title" id="exampleModalLongTitle">Delete Customer</h2>
                                </div>

                                <div class="modal-body">
                                    <h4>Are you sure you want to delete the Customer?</h4>
                                </div>

                                <div class="modal-footer">
                                    <table class="table table-responsive">
                                        <button type="button" class="btn btn-success" data-dismiss="modal"><i
                                                class="fa fa-times"
                                                aria-hidden="true"></i> No</button>
                                        <g:form controller="customer" action="delete" id="${customer.id}"
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
</div>

</body>
</html>