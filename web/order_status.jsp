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

    <body ng-app="orderCheckApp" ng-controller="mainController">

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
                            <a href="index.html"><i class="fa fa-fw fa-home"></i> Home</a>
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
                                    Check Order Status
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-10 col-lg-offset-1">

                                            <!-- PAGE HEADER -->


                                            <!-- FORM -->
                                            <!-- pass in the variable if our form is valid or invalid -->
                                            <form name="searchStatusForm" novalidate> <!-- novalidate prevents HTML5 validation since we will be validating ourselves -->

                                                <!-- Order ID -->
                                                <div class="form-group input-group">
                                                    <input type="text" name="orderId" class="form-control text-right" ng-model="orderId" placeholder="Enter Order ID" ng-maxlength="10" required="">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" ng-click="searchOrder(searchStatusForm.$valid)"  ng-disabled="!searchStatusForm.orderId.$dirty || searchStatusForm.orderId.$invalid"><span class="glyphicon glyphicon-search"></span>
                                                        </button>
                                                    </span>
                                                    
                                                </div>
                                                <div class="text-right">
                                                    <span class="text-right" style="color: red" ng-show="searchStatusForm.orderId.$dirty && searchStatusForm.orderId.$invalid">
                                                        <span ng-show="searchStatusForm.orderId.$error.required">Order ID is required to search.</span>
                                                        <span ng-show="searchStatusForm.orderId.$error.maxlength">Order ID is too long.</span>
                                                    </span>
                                                </div>
                                            </form>
                                                <div class="row"></div>
                                                <div class="form-group bg-info" ng-show="showMatchingRecordFound">
                                                    <fieldset class="well-lg">
                                                        <legend>Order Details</legend>
                                                        <!-- Order Id -->
                                                        <label>Order ID</label>
                                                        <div class="form-group ">
                                                            <input type="text" class="form-control" ng-model="order.id" ng-readonly="true">
                                                        </div>
                                                        <!-- Order Status -->
                                                        <label>Order Status</label>
                                                        <div class="form-group ">
                                                            <input type="text" class="form-control" ng-model="order.status" ng-readonly="true">
                                                        </div>
                                                        <!-- # of Cake Donuts -->
                                                        <label># of Cake Donuts</label>
                                                        <div class="form-group ">
                                                            <input type="text" class="form-control" ng-model="order.noOfCakeDonuts" ng-readonly="true">
                                                        </div>
                                                        <!-- # of Glazed Donuts -->
                                                        <label># of Glazed Donuts</label>
                                                        <div class="form-group ">
                                                            <input type="text" class="form-control" ng-model="order.noOfGlazedDonuts" ng-readonly="true">
                                                        </div>
                                                        <!-- Total Bill -->
                                                        <label>Total Bill</label>
                                                        <div class="form-group input-group">
                                                            <span class="input-group-addon">Rs</span>
                                                            <input type="text" class="form-control text-right" ng-model="order.totalBill" ng-readonly="true">
                                                        </div>
                                                        <!-- Delivery Date -->
                                                        <label>Delivery Date</label>
                                                        <div class="form-group ">
                                                            <input type="text" class="form-control text-right" ng-model="order.deliveryDate" ng-readonly="true">
                                                        </div>
                                                        <!-- MESSAGE -->
                                                        <div class="form-group">
                                                            <label>Delivery Address</label>
                                                            <textarea style="resize: none" name="message" class="form-control" ng-model="order.deliveryAddress" rows="5" ng-readonly="true">

                                                            </textarea>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="well-lg bg-danger text-center" ng-show="showNoMatchingRecordFound">
                                                    No Matching Record Found
                                                </div>
                                                
                                            
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

                <script src='JavaScript/order_status.js'></script>



    </body>
</html>