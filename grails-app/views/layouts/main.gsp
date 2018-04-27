<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Task Management System"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="display.js"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" media="all">
    <g:layoutHead/>
</head>

<body>
<div id="wrapper">
    <g:render template="/layouts/menu"/>
    <div class="container-fluid">
        <div class="row">
            <g:layoutBody/>
        </div>
    </div>
</div>

<asset:javascript src="application.js"/>
</body>
</html>
