<!doctype html>
<head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Contact US</title>
</head>
<asset:stylesheet src="Style.css"/>
<asset:stylesheet src="bootstrap.css"/>
<body>
<g:form controller="task" action="save">
    <div class="form-group">
        <h1>Create Task </h1>
        <input type="text" class="form-control"  name="title" placeholder="Your Task" >
    </div>
    <button type="submit" class="btn btn btn-primary">Add</button>
</g:form>
</body>