<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="task" action="list" class="navbar-brand"><i class="fa fa-home"></i></g:link>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-tasks" aria-hidden="true"></i> Task<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Option 1</a> </li>
                        <li><a href="#">Option 2</a> </li>
                        <li class="divider"></li>
                        <li><a href="#">Option 3</a> </li>
                        <li><a href="#">Option 4</a> </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
                        username
                        <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a href="#">Option 1</a> </li>
                        <li><a href="#">Option 2</a> </li>
                        <li class="divider"></li>
                        <li><a href="#">Option 3</a> </li>
                        <li><a href="#">Option 4</a> </li>
                    </ul>
                </li>

            </ul>

        </div>
    </div>
</nav>

