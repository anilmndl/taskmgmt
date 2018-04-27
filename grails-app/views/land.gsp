<!doctype html>
<html lang="en">
<!--
<head>
    <title>Task Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Mobland - Mobile App Landing Page Template">
    <meta name="keywords" content="HTML5, bootstrap, mobile, app, landing, ios, android, responsive">

    <!-- Font -->
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">

    <!-- Bootstrap CSS -->
<asset:stylesheet src="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Themify Icons -->
<asset:stylesheet src="css/themify-icons.css"/>
<link rel="stylesheet" href="css/themify-icons.css">
<!-- Owl carousel -->
<asset:stylesheet src="css/owl.carousel.min.css"/>
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- Main css -->
<asset:stylesheet src="css/style.css"/>
<link href="css/style.css" rel="stylesheet">
</head>

<body data-spy="scroll" data-target="#navbar" data-offset="30">

<!-- Nav Menu -->

<div class="nav-menu fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-dark navbar-expand-lg">
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link active" href="#home">HOME <span
                                    class="sr-only">(current)</span></a></li>
                            <li class="nav-item"><a class="nav-link" href="#features">FEATURES</a></li>
                            <li class="nav-item"><a class="nav-link" href="#gallery">GALLERY</a></li>
                            <sec:ifNotLoggedIn>
                                <li class="nav-item"><g:link controller="task" action="list"
                                                             class="btn btn-outline-light my-3 my-sm-0 ml-lg-3">Login</g:link></li>
                            </sec:ifNotLoggedIn>
                            <sec:ifLoggedIn>
                                <li class="nav-item"><g:link controller="task" action="list"
                                                             class="btn btn-outline-light my-3 my-sm-0 ml-lg-3">View Task</g:link></li>
                            </sec:ifLoggedIn>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<header class="bg-gradient" id="home">
    <div class="container mt-5">
        <h1>Task Management System</h1>

        <p class="tagline">Managing, assigning and tracking of the task is a tedious job in big organizations.</p>
    </div>
</header>

<div class="section light-bg" id="features">
    <div class="container">
        <div class="section-title">
            <small>HIGHLIGHTS</small>

            <h3>Features you love</h3>
        </div>

        <div class="row">
            <div class="col-12 col-lg-4">
                <div class="card features">
                    <div class="card-body">
                        <div class="media">
                            <span class="ti-face-smile gradient-fill ti-3x mr-3"></span>

                            <div class="media-body">
                                <h4 class="card-title">Simple</h4>

                                <p class="card-text">This Web Application is easy to use.It is a piece of cake even for a first time user. This application is user friendly and has been tested by people who were not in the development team.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="card features">
                    <div class="card-body">
                        <div class="media">
                            <span class="ti-settings gradient-fill ti-3x mr-3"></span>

                            <div class="media-body">
                                <h4 class="card-title">Customize</h4>

                                <p class="card-text">This app is fully dynamic and customizable.This app is not only dynamic but also responsive.It can be used in different platforms like IOS, Android, Windows and many more.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="card features">
                    <div class="card-body">
                        <div class="media">
                            <span class="ti-lock gradient-fill ti-3x mr-3"></span>

                            <div class="media-body">
                                <h4 class="card-title">Secure</h4>

                                <p class="card-text">We have used the encryption technique to store our password. It prevent the system from being hacked from known attacks such as Brute Force, SQL Injection and DoS Attack.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- // end .section -->
<div class="section light-bg">
    <div class="container">
        <div class="section-title">
            <small>FEATURES</small>

            <h3>Do more with our app</h3>
        </div>
        <ul class="nav nav-tabs nav-justified" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#communication">Communication</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#schedule">Scheduling</a>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="communication">
                <div class="d-flex flex-column flex-lg-row">
                    <div>
                        <h2>Communicate with ease</h2>

                        <p class="lead">The unique feature of this application is giving, receiving and sharing the feedback from the manager.</p>

                        <p>Admin can set tasks to employees, every task has a priority i.e. 1 to 10, 1 being the least important. The due dates are also color coded, green indicates the task is due after 7 days, orange (moderate phase) shows 3 to 7 days and finally red (critical phase) shows less than 3 days.</p>

                        <p></p>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="schedule">
                <div class="d-flex flex-column flex-lg-row">
                    <div>
                        <h2>Scheduling when you want</h2>
                        <p class="lead">Assigning different task periodically can make task challenging and interesting.</p>
                        <p>According to Forbes Magazine, "53% of American employees are unsatisfied with their current job." The main reason behind this is Job Enrichment. People are tired of doing the same job every day. This application helps to manage and assign different tasks to different users while tracking previously assigned task.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- // end .section -->
    <div class="section light-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-8 d-flex align-items-center">
                    <ul class="list-unstyled ui-steps">
                        <li class="media">
                            <div class="circle-icon mr-4">1</div>

                            <div class="media-body">
                                <h5>Task Creation</h5>

                                <p>Admin creates different tasks as requested by customers. Admin, from the recommendation of the manager, creates tasks focusing on needs of the organizations.</p>
                            </div>
                        </li>
                        <li class="media my-4">
                            <div class="circle-icon mr-4">2</div>

                            <div class="media-body">
                                <h5>Task Assignment</h5>

                                <p>Generally, Tasks are assigned in random manner but they can also be assigned to a specific employee with special request to the Admin/Manager.</p>
                            </div>
                        </li>
                        <li class="media">
                            <div class="circle-icon mr-4">3</div>

                            <div class="media-body">
                                <h5>Task Completion</h5>
                                <p>After tasks are completed, employees marks tasks as completed. Completed tasks can be found by clicking<span class="text-success"> Completed Task </span>Tab.</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- // end .section -->
    <div class="section light-bg" id="gallery">
        <div class="container">
            <div class="section-title">
                <small>GALLERY</small>

                <h3>App Screenshots</h3>
            </div>

            <div class="img-gallery owl-carousel owl-theme">
                <asset:image src="1.jpg" alt="image"/>
                <asset:image src="2.jpg" alt="image"/>
                <asset:image src="3.jpg" alt="image"/>
                <asset:image src="4.jpg" alt="image"/>
                <asset:image src="5.jpg" alt="image"/>
            </div>

        </div>

    </div>
    <!-- // end .section -->
    <footer class="my-5 text-center">
        <!-- Copyright removal is not prohibited! -->
        <p class="mb-2"><small>COPYRIGHT © 2018. ALL RIGHTS RESERVED. | INFO-4492 | Spring 2018 |Idaho State University</small>
        </p>
        <small>
            <a href="#" class="m-2">PRESS</a>
            <a href="#" class="m-2">TERMS</a>
            <a href="#" class="m-2">PRIVACY</a>
        </small>
    </footer>

    <!-- jQuery and Bootstrap -->
    <asset:javascript src="js/jquery-3.2.1.min.js"/>
    <asset:javascript src="js/bootstrap.bundle.min.js"/>
    <!-- Plugins JS -->
    <asset:javascript src="js/owl.carousel.min.js"/>
    <!-- Custom JS -->
    <asset:javascript src="js/script.js"/>

</body>

</html>
