<%-- 
    Document   : index
    Created on : Oct 28, 2016, 10:44:21 AM
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

        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 70%;
                margin: auto;
            }
        </style>



    </head>

    <body>

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
                            <br>
                            <br>
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                    <li data-target="#myCarousel" data-slide-to="3"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <img class="img-responsive img-circle" src="Images/carousel/donut11.jpg" alt="Donut" width="460" height="345">
                                        <div class="carousel-caption">
                                            <h3 style="color:gold">Glazed Donut</h3>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img class="img-responsive img-circle" src="Images/carousel/donut22.jpg" alt="Donut" width="460" height="345">
                                        <div class="carousel-caption">
                                            <h3 style="color:gold">Cake Donut</h3>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img class="img-responsive img-circle" src="Images/carousel/donut33.jpg" alt="Donut" width="460" height="345">
                                        <div class="carousel-caption">
                                            <h3 style="color:gold">Cake Donut</h3>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img class="img-responsive img-circle" src="Images/carousel/donut44.jpg" alt="Donut" width="460" height="345">
                                        <div class="carousel-caption">
                                            <h3 style="color:gold">Glazed Donut</h3>
                                        </div>
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="icon-prev"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="icon-next"></span>
                                    <span class="sr-only">Next</span>
                                </a>

                            </div>
                        </div>
                    </div>

                </div>
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
         
        
        <script src="Template/CustmizedTheme/js/index.js"></script>



    </body>
</html>
