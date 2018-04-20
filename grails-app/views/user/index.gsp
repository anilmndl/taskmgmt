<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User List</title>
</head>

<body>
<g:render template="/user/sidebar"/>

<div class="col-sm-10 col-md-offset-2 main">
    <div style="width: 220px;">
        <label>UserName: </label> <input type="text" name = "username"/>
        <label>Password: </label> <input type="password" name = "password"/>
        <label>&nbsp; </label> <input type="submit" value="login"/>
    </div>
</div>
</body>
</html>