<%-- 
    Document   : contact
    Created on : Oct 28, 2016, 10:47:30 AM
    Author     : senanayake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Duncan's Donuts</title>

        <link rel="stylesheet" href="Template/CustmizedTheme/css/normalize.css">

        <link rel='stylesheet' href='Template/Boostrap/css/bootstrap.min.css' media="screen">

        <link rel="stylesheet" href="Template/CustmizedTheme/css/style.css">



        <link rel='stylesheet' href='Template/Loadingbar/loading-bar.min.css' media="all">

    </head>

    <body ng-app="contactApp" ng-controller="mainController">

        <div id="wrapper">
            <div class="overlay"></div>
            <div class="container-fluid">
                <!-- Sidebar -->
                <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                    <ul class="nav sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="index.html">
                                Duncan's Donuts
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="new_order.jsp"><i class="fa fa-cutlery"></i> Order Donuts</a>
                        </li>
                        <li>
                            <a href="order_status.jsp"><i class="fa fa-fw fa-file-o"></i> Check Order Status</a>
                        </li>
                        <li>
                            <a href="change_order.jsp"><i class="fa fa-pencil-square-o"></i> Change Order</a>
                        </li>
                        <li>
                            <a href="cancel_order.jsp"><i class="fa fa-times"></i> Cancel Order</a>
                        </li>
                        <li>
                            <a href="about.jsp"><i class="fa fa-book"></i> About Us</a>
                        </li>
                        <li>
                            <a href="contact.jsp"><i class="fa fa-envelope-o"></i> Contact</a>
                        </li>
                    </ul>
                </nav>
                <!-- /#sidebar-wrapper -->

                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
                        <span class="hamb-top"></span>
                        <span class="hamb-middle"></span>
                        <span class="hamb-bottom"></span>
                    </button>
                    <div class="container-fliud">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-4">
                                <img class="img-responsive" src="Images/duncan.gif" alt="Duncan's Donuts" />
                            </div>
                        </div>

                        <div class="container">
                            <div class="panel panel-default col-lg-8 col-lg-offset-2">
                                <div class="panel-heading">
                                    Contact Us
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3">

                                            <!-- PAGE HEADER -->


                                            <!-- FORM -->
                                            <!-- pass in the variable if our form is valid or invalid -->
                                            <form name="contactForm" ng-submit="submitForm(contactForm.$valid)" novalidate> <!-- novalidate prevents HTML5 validation since we will be validating ourselves -->

                                                <!-- NAME -->
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" name="name" class="form-control" ng-model="contactData.userName" ng-maxlength="50" required>
                                                    <span style="color: red" ng-show="contactForm.name.$dirty && contactForm.name.$invalid">
                                                        <span ng-show="contactForm.name.$error.required">Your Name is required.</span>
                                                        <span ng-show="contactForm.name.$error.maxlength">Name should be less than 50 Characters.</span>
                                                    </span>
                                                </div>

                                                <!-- Subject -->
                                                <div class="form-group">
                                                    <label>Subject</label>
                                                    <input type="text" name="subject" class="form-control" ng-model="contactData.messageSubject" ng-maxlength="50" required>
                                                    <span style="color: red" ng-show="contactForm.subject.$dirty && contactForm.subject.$invalid">
                                                        <span ng-show="contactForm.subject.$error.required">Subject is required.</span>
                                                        <span ng-show="contactForm.subject.$error.maxlength">Subject should be less than 50 Characters.</span>
                                                    </span>
                                                </div>

                                                <!-- EMAIL -->
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" class="form-control" ng-model="contactData.userEmail" required>
                                                    <span style="color: red" ng-show="contactForm.email.$dirty && contactForm.email.$invalid">
                                                        <span ng-show="contactForm.subject.$invalid">Correct Email Address is required.</span>
                                                    </span>
                                                </div>

                                                <!-- MESSAGE -->
                                                <div class="form-group">
                                                    <label>Message</label>
                                                    <textarea style="resize: none" name="message" class="form-control" rows="10" ng-model="contactData.messageContent" required ng-maxlength="600">
                                                        
                                                    </textarea>
                                                    <span style="color: red" ng-show="contactForm.message.$dirty && contactForm.message.$invalid">
                                                        <span ng-show="contactForm.message.$error.required">Message is required.</span>
                                                        <span ng-show="contactForm.message.$error.maxlength">Message should be less than 600 Characters.</span>
                                                    </span>
                                                </div>
                                                <div class="alert alert-success text-center" ng-show="successMessage">
                                                    <a style="text-decoration: none" href="#" class="close" data-dismiss="alert" aria-label="close" ng-click="clearClick()">&times;</a>We have received your Message
                                                </div> 
                                                <div class="alert alert-danger text-center" ng-show="ErrorMessage">
                                                    <a style="text-decoration: none" href="#" class="close" data-dismiss="alert" aria-label="close" ng-click="clearClick()">&times;</a>Sorry your Message didn't reach us !
                                                </div> 
                                                <!-- SUBMIT BUTTON -->
                                                <div class='row'>
                                                    <div class='col-lg-4 col-lg-offset-2'>
                                                        <button type="submit" class="btn btn-primary btn-block" ng-disabled="contactForm.$invalid">Submit</button>
                                                    </div>
                                                    <div class='col-lg-4'>
                                                        <button type="button" id='clear' class="btn btn-warning btn-block" ng-disabled="contactForm.$persisted" ng-click="clearClick()">Clear</button>
                                                    </div>
                                                    
                                                    
                                                </div>
                                                <div>
                                                    
                                                </div>
                                                

                                            </form>
                                        </div><!-- col-sm-8 -->
                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->

                        </div><!-- /container -->
                        <div class="footer navbar-fixed-bottom">
                            <footer>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12 text-center">
                                            <p style="color:black">Copyright &copy; 2018</p>
                                        </div>
                                    </div>
                                </div>  
                            </footer>
                        </div>
                        <!-- /#page-content-wrapper -->
                    </div>


                </div>

                <!-- /#wrapper -->

                <script src='Template/JQuery/jquery.min.js'></script>

                <script src='Template/Boostrap/js/bootstrap.min.js'></script>

                <script src='Template/Angularjs/angular.min.js'></script>
                <script src='Template/Angularjs/angular-animate.min.js'></script>
                <script src='Template/Angularjs/angular-touch.min.js'></script>

                <script src='Template/Loadingbar/loading-bar.min.js'></script>

                <script src="Template/CustmizedTheme/js/index.js"></script>


                <script src="Template/BoostrapUi/ui-bootstrap-tpls-2.2.0.min.js"></script>

                <script src='JavaScript/contact.js'></script>



                </body>
                </html>