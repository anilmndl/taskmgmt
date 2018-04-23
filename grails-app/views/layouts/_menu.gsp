<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
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

                        <li><g:link controller="task" action="create"><i class="fa fa-plus"
                                                                         aria-hidden="true"></i> New Task</g:link></li>
                        <li><g:link controller="task" action="list"><i class="fa fa-table"
                                                                       aria-hidden="true"></i> List Tasks</g:link></li>
                        <li><g:link controller="task" action="listCompleted"><i class="fa fa-suitcase"
                                                                                aria-hidden="true"></i> Completed task</g:link>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-tasks" aria-hidden="true"></i> Task Type<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="taskType" action="create"><i class="fa fa-plus"
                                                                             aria-hidden="true"></i> New TaskType</g:link>
                        </li>
                        <li><g:link controller="taskType" action="list"><i class="fa fa-table"
                                                                           aria-hidden="true"></i> List Task Type</g:link>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-tasks" aria-hidden="true"></i> Roles<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="Role" action="Create"><i class="fa fa-tags"
                                                                         aria-hidden="true"></i> New Roles</g:link></li>
                        <li><g:link controller="Role" action="list"><i class="fa fa-table"
                                                                       aria-hidden="true"></i> List Roles</g:link></li>

                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-tasks" aria-hidden="true"></i> Users<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="user" action="create"><i class="fa fa-user"
                                                                         aria-hidden="true"></i> New  Users</g:link>
                        </li>
                        <li><g:link controller="user" action="list"><i class="fa fa-table"
                                                                       aria-hidden="true"></i> List Users</g:link></li>

                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="fa fa-tasks" aria-hidden="true"></i> Customer<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="customer" action="create"><i class="fa fa-users"
                                                                             aria-hidden="true"></i> New Customer</g:link>
                        </li>
                        <li><g:link controller="customer" action="list"><i class="fa fa-table"
                                                                           aria-hidden="true"></i> List Customer</g:link>
                        </li>

                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <sec:ifLoggedIn>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>

                            <common:userFullName/>
                            %{--${sec.loggedInUserInfo(field: 'username').capitalize()}--}%


                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">

                            <li><g:link controller="logout">Logout</g:link></li>
                            <li><g:link controller="user" action="edit"
                                        id="${sec.loggedInUserInfo(field: 'id')}">Edit Profile</g:link></li>
                            <li><g:link controller="user" action="Vacation"
                                        id="${sec.loggedInUserInfo(field: 'id')}">Vacation Mode</g:link></li>
                            <li><g:link controller="user" action="UserInfo" id="${sec.loggedInUserInfo(field: 'id')}"
                                        value="">Change Password</g:link></li>

                        </ul>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <div class="nav navbar-btn nav-pill">
                        <g:link controller="login"
                                class="btn btn-success btn-md"><i class="fa fa-user"
                                                               aria-hidden="true"></i> Login </g:link>
                    </div>
                </sec:ifNotLoggedIn>

            </ul>

        </div>
    </div>
</nav>

