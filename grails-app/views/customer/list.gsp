<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Customer List</title>
</head>

<body>
<g:render template="/customer/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <h1 class="page-header">Customer List</h1>

    <h2 class="alert-danger">${flash.message}</h2>

    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for Customer:</label>
                <g:textField name="query" value="${params.query}"/>
                <button id="submit-values" class="btn btn-small btn-success btn-xs" type="submit">
                    <i class="icon-ok"></i>
                    Search
                </button>
            </div>
        </g:form>
    </fieldset>

    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Customers</strong></div>
                <table class="table table-striped">
                    <tr>

                        <th>Full Name</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                    <g:if test="${customerList}">
                        <g:each in="${customerList}" var="customer">
                        %{--<g:if test="${show.flag != "deleted"  && show.flag != "completed"}">--}%
                            <tr>

                                <td>${customer.firstName} ${customer.lastName}</td>
                                <td><common:dateFormatWithTime dateValue="${customer.dateCreated}"/></td>
                                <td>
                                    <g:link controller="customer" action="detail" id="${customer.id}"
                                            class="btn btn-info btn-xs"><i class="fa fa-eye"
                                                                              aria-hidden="true"></i> View Details</g:link>
                                </td>
                            </tr>
                        %{-- </g:if>--}%
                        </g:each>
                    </g:if>
                </table>
            </div>
            <ul class="pagination pagination-sm">
                <li>
                    <g:paginate controller="customer" action="list" total="${listCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>