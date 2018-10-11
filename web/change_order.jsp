<%-- 
    Document   : index
    Created on : Oct 7, 2016, 2:45:16 PM
    Author     : senanayake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html >
    <head>
        <title>Duncan's Donuts</title>


        <link rel="stylesheet" href="Template/CustmizedTheme/css/normalize.css">

        <link rel='stylesheet' href='Template/Boostrap/css/bootstrap.min.css' media="screen">

        <link rel="stylesheet" href="Template/CustmizedTheme/css/style.css">



        <link rel='stylesheet' href='Template/Loadingbar/loading-bar.min.css' media="all">

    </head>

    <body ng-app="changeOrderApp" ng-controller="mainController">

        <div id="wrapper">
            <div class="overlay"></div>
            <div class="container-fluid">
                <!-- Sidebar -->
                <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                    <ul class="nav sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="index.jsp">
                                Duncan's Donuts
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="new_order.jsp"><i class="fa fa-cutlery" areahidden="true"></i> Order Donuts</a>
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
                                    Change Donuts Order
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <!-- Order ID -->
                                        <form name="searchStatusForm" novalidate>
                                            <div class="form-group input-group col-lg-8 col-lg-offset-4">
                                                <input type="text" name="orderId" class="form-control text-right" ng-model="orderId" placeholder="Enter Order ID" ng-maxlength="10" ng-disabled="isSearchDisabled" required="">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button" ng-click="searchOrder(searchStatusForm.$valid)"  ng-disabled="!searchStatusForm.orderId.$dirty || searchStatusForm.orderId.$invalid||isSearchDisabled"><span class="glyphicon glyphicon-search"></span>
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
                                        <div class="bg-info" ng-show="showMatchingRecordFound">
                                            <form name="changeOrderForm"  novalidate> <!-- novalidate prevents HTML5 validation since we will be validating ourselves -->
                                                <div class="col-lg-6">
                                                    <!-- # of Cake Donuts -->
                                                    <div class="form-group">
                                                        <label># of Cake Donuts</label>
                                                        <input type="number" name="noCakeDonuts" class="form-control" ng-model="changeOrder.noOfCakeDonuts" ng-change="doCalculations(changeOrderForm.noCakeDonuts.$valid, changeOrderForm.noGlazedDonuts.$valid)" ng-min="0" ng-max="999"  ng-maxlength="50" ng-disabled="isDisableInProgressInputs||isDisableInDeliveryInputs" required>
                                                        <span style="color: red" ng-show="changeOrderForm.noCakeDonuts.$dirty && changeOrderForm.noCakeDonuts.$invalid">
                                                            <span ng-show="changeOrderForm.noCakeDonuts.$error.required"># of Cake Donuts is required.</span>
                                                            <span ng-show="changeOrderForm.noCakeDonuts.$error.min"># of Cake Donuts should not be minus.</span>
                                                            <span ng-show="changeOrderForm.noCakeDonuts.$error.max">if # of Cake Donuts greater than 1000 visit our outlets.</span>
                                                        </span>
                                                    </div>

                                                    <!-- # of Glazed Donuts -->
                                                    <div class="form-group">
                                                        <label># of Glazed Donuts</label>
                                                        <input type="number" name="noGlazedDonuts" class="form-control" ng-pattern="/^[0-9]*$/" ng-model="changeOrder.noOfGlazedDonuts" ng-change="doCalculations(changeOrderForm.noCakeDonuts.$valid, changeOrderForm.noGlazedDonuts.$valid)" ng-min="0" ng-max="999" ng-maxlength="50" ng-disabled="isDisableInProgressInputs||isDisableInDeliveryInputs" required>
                                                        <span style="color: red" ng-show="changeOrderForm.noGlazedDonuts.$dirty && changeOrderForm.noGlazedDonuts.$invalid">
                                                            <span ng-show="changeOrderForm.noGlazedDonuts.$error.required"># of Glazed Donuts is required.</span>
                                                            <span ng-show="changeOrderForm.noGlazedDonuts.$error.min"># of Glazed Donuts should not be minus.</span>
                                                            <span ng-show="changeOrderForm.noGlazedDonuts.$error.max">if # of Cake Donuts greater than 1000 visit our outlets.</span>
                                                        </span>
                                                    </div>

                                                    <!-- NAME -->
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <input type="text" name="customerName" class="form-control" style="text-transform: capitalize" ng-pattern="/^[a-zA-Z\s]*$/"  ng-model="changeOrder.customerName" ng-maxlength="50" required>
                                                        <span style="color: red" ng-show="changeOrderForm.customerName.$dirty && changeOrderForm.customerName.$invalid">
                                                            <span ng-show="changeOrderForm.customerName.$error.required">Your Name is required.</span>
                                                            <span ng-show="changeOrderForm.customerName.$error.maxlength">Name should be less than 50 Characters.</span>
                                                            <span ng-show="changeOrderForm.customerName.$error.pattern">Only Alphabetic Characters Allowed</span>
                                                        </span>
                                                    </div>

                                                    <!-- EMAIL -->
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="email" name="email" class="form-control" ng-model="changeOrder.customerEmail" required>
                                                        <span style="color: red" ng-show="changeOrderForm.email.$dirty && changeOrderForm.email.$invalid">
                                                            <span ng-show="changeOrderForm.email.$invalid">Correct Email Address is required.</span>
                                                        </span>
                                                    </div>

                                                    <!-- Contact -->
                                                    <div class="form-group">
                                                        <label>Contact Number</label>
                                                        <input type="text" name="contact" class="form-control" ng-model="changeOrder.customerContact" ng-pattern="/^(\+)?[0-9]*$/" ng-maxlength="15" ng-minlength="3" required>
                                                        <span style="color: red" ng-show="changeOrderForm.contact.$dirty && changeOrderForm.contact.$invalid">
                                                            <span ng-show="changeOrderForm.contact.$error.required">Contact Number is required.</span>
                                                            <span ng-show="!changeOrderForm.contact.$error.pattern && changeOrderForm.contact.$error.maxlength">Contact Number is too long.</span>
                                                            <span ng-show="!changeOrderForm.contact.$error.pattern && changeOrderForm.contact.$error.minlength">Contact Number is too short.</span>
                                                            <span ng-show="changeOrderForm.contact.$error.pattern">Contact Number should be in a correct Format.</span>
                                                        </span>
                                                    </div>
                                                    
                                                    


                                                    <!--Required Date-->
                                                    <div>
                                                        <label>Required Date</label>
                                                        <p class="input-group">
                                                            <input type="text" name="orderDueDate" class="form-control text-right" uib-datepicker-popup="yyyy-MMMM-dd" ng-model="changeOrder.orderDueDate" is-open="popup.opened" datepicker-options="dateOptions" ng-required="true"  ng-readonly="true" close-text="Close" popup-placement="bottom-right" />
                                                            <span class="input-group-btn ">
                                                                <button type="button" class="btn btn" ng-click="open()" ng-disabled="isDisableInProgressInputs||isDisableInDeliveryInputs" ><i class="glyphicon glyphicon-calendar" ></i></button>
                                                            </span>
                                                        </p>
                                                        <span style="color: red" ng-show="changeOrderForm.orderDueDate.$dirty && changeOrderForm.orderDueDate.$invalid">
                                                            <span ng-show="changeOrderForm.orderDueDate.$invalid">Required Date is mandatory.</span>
                                                        </span>
                                                    </div>
                                                    
                                                    <!-- Order Placed Date -->
                                                    <label>Order Placed Date</label>
                                                    <div class="form-group ">
                                                        <input type="text" class="form-control text-right" ng-model="changeOrder.orderDate" ng-readonly="true">
                                                    </div>
                                                    <!-- Order Placed Time -->
                                                    <label>Order Placed Time</label>
                                                    <div class="form-group ">
                                                        <input type="text" class="form-control text-right" ng-model="changeOrder.orderTime" ng-readonly="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <fieldset class="well" style="background-color: gold">
                                                        <!-- Subtotal-->
                                                        <label>Subtotal</label>
                                                        <div class="form-group input-group">
                                                            <span class="input-group-addon">Rs</span>
                                                            <input type="text" name="subTotal" class="form-control text-right" ng-model="changeOrder.subTotal" ng-maxlength="50" ng-readonly="true">
                                                        </div>

                                                        <!-- Tax -->
                                                        <label>Tax</label>
                                                        <div class="form-group input-group">
                                                            <span class="input-group-addon">Rs</span>
                                                            <input type="text" class="form-control text-right" name="tax" ng-model="changeOrder.tax" ng-maxlength="50" ng-readonly="true">
                                                        </div>

                                                        <!-- Total -->
                                                        <label>Total</label>
                                                        <div class="form-group input-group">
                                                            <span class="input-group-addon">Rs</span>
                                                            <input type="text" class="form-control text-right" name="total" ng-model="changeOrder.total" ng-maxlength="50" ng-readonly="true">
                                                        </div>
                                                    </fieldset>

                                                    <fieldset>
                                                        <legend>Address</legend>
                                                        <div class="row">
                                                            <!-- House No. -->
                                                            <div class="form-group col-lg-6">
                                                                <label>House No.</label>
                                                                <input type="text" name="houseNo" class="form-control" ng-model="changeOrder.houseNumber" ng-maxlength="10" ng-disabled="isDisableInDeliveryInputs" required>
                                                                <span style="color: red" ng-show="changeOrderForm.houseNo.$dirty && changeOrderForm.houseNo.$invalid">
                                                                    <span ng-show="changeOrderForm.houseNo.$error.required">House No. is required.</span>
                                                                    <span ng-show="changeOrderForm.houseNo.$error.maxlength">House No. is too long.</span>
                                                                </span>
                                                            </div>
                                                            <!-- Zip Code -->
                                                            <div class="form-group col-lg-6">
                                                                <label>Zip Code</label>
                                                                <input type="text" name="zipCode" class="form-control" ng-model="changeOrder.zipCode" ng-maxlength="10" ng-disabled="isDisableInDeliveryInputs" required>
                                                                <span style="color: red" ng-show="changeOrderForm.zipCode.$dirty && changeOrderForm.zipCode.$invalid">
                                                                    <span ng-show="changeOrderForm.zipCode.$error.required">Zip Code is required.</span>
                                                                    <span ng-show="changeOrderForm.zipCode.$error.maxlength">Zip Code is too long.</span>
                                                                </span>
                                                            </div>
                                                        </div>

                                                        <!--Street -->
                                                        <div class="form-group">
                                                            <label>Street</label>
                                                            <input type="text" name="street" class="form-control" ng-model="changeOrder.street" ng-maxlength="50" ng-disabled="isDisableInDeliveryInputs" required>
                                                            <span style="color: red" ng-show="changeOrderForm.street.$dirty && changeOrderForm.street.$invalid">
                                                                <span ng-show="changeOrderForm.street.$error.required">Street is required.</span>
                                                                <span ng-show="changeOrderForm.street.$error.maxlength">Street is too long.</span>
                                                            </span>
                                                        </div>
                                                        <!--City -->
                                                        <div class="form-group">
                                                            <label>City</label>
                                                            <input type="text" name="city" class="form-control" ng-model="changeOrder.city" ng-maxlength="50" ng-disabled="isDisableInDeliveryInputs" required>
                                                            <span style="color: red" ng-show="changeOrderForm.city.$dirty && changeOrderForm.city.$invalid">
                                                                <span ng-show="changeOrderForm.city.$error.required">City is required.</span>
                                                                <span ng-show="changeOrderForm.city.$error.maxlength">City is too long.</span>
                                                            </span>
                                                        </div>
                                                        <!--State -->
                                                        <div class="form-group">
                                                            <label>State</label>
                                                            <input type="text" name="state" class="form-control" ng-model="changeOrder.state" ng-maxlength="50" ng-disabled="isDisableInDeliveryInputs" required>
                                                            <span style="color: red" ng-show="changeOrderForm.state.$dirty && changeOrderForm.state.$invalid">
                                                                <span ng-show="changeOrderForm.state.$error.required">State is required.</span>
                                                                <span ng-show="changeOrderForm.state.$error.maxlength">State is too long.</span>
                                                            </span>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="well text-center text-danger" ng-if="changeOrder.total === '0.00'">
                                                    Please at least order one type of Dounuts to place order
                                                </div>
                                                <div class="well text-center text-danger" ng-show="inProgressMessage">
                                                    Your Order is In Progress, so you can't change # of Donuts
                                                </div>
                                                <div class="well text-center text-danger" ng-show="inDeliveryMessage">
                                                    Your Order is In Progress, so you can't change # of Donuts and your Address
                                                </div>
                                                <div class="well text-center text-info" ng-show="message">
                                                    Placed Order has been Successfully Updated
                                                </div>
                                                <!-- SUBMIT BUTTON -->
                                                <div class='row'>
                                                    <div class='col-lg-4 col-lg-offset-2'>
                                                        <button type="button" class="btn btn-primary btn-block" ng-click="submitChangeOrder(changeOrderForm.$valid)" ng-disabled="changeOrderForm.$invalid || (changeOrder.total === '0.00') || changeOrderForm.$pristine">Change Order</button>
                                                    </div>
                                                    <div class='col-lg-4'>
                                                        <button type="button" id='clear' class="btn btn-warning btn-block" ng-click="cancelClick()">Cancel</button>
                                                    </div>


                                                </div>
                                            </form>
                                        </div>
                                        
                                        
                                        <div class="well-lg bg-danger text-center" ng-show="showNoMatchingRecordFound">
                                            No Matching Record Found
                                        </div>
                                    </div>
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

            <script src='JavaScript/change_order.js'></script>



    </body>
</html>
