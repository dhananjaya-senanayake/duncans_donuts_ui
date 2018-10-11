/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var newOrderApp = angular.module('newOrderApp', ['angular-loading-bar', 'ngAnimate', 'ui.bootstrap']);

// create angular controller
newOrderApp.controller('mainController', function ($scope, $http) {


    $scope.newOrder = {};
    $scope.orderId =null;

    $scope.newOrder.orderDate = new Date();
    $scope.newOrder.orderTime = new Date();
    $scope.newOrder.orderStatus = "Pending";

    var dayAfterTomorrow = new Date();
    dayAfterTomorrow = dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);

    $scope.newOrder.orderDueDate = new Date(dayAfterTomorrow);

    var lastDay = new Date();
    lastDay = lastDay.setMonth(lastDay.getMonth() + 2);

    $scope.newOrder.subTotal = "0.00";
    $scope.newOrder.tax = "0.00";
    $scope.newOrder.total = "0.00";

    $scope.newOrder.noOfCakeDonuts = 0;
    $scope.newOrder.noOfGlazedDonuts = 0;

    $scope.warningMessage = false;


    $scope.hideWarningMessage = function () {
        $scope.warningMessage = !$scope.warningMessage;
    };


    // function to submit the form after all validation has occurred            
    $scope.submitNewOrder = function (isValid) {


        // check to make sure the form is completely valid
        if (isValid) {
            
            console.log($scope.newOrder);


                var res = $http.post('http://localhost:8080/DuncansDonuts/api/v1/orders', $scope.newOrder);

                res.success(function (data) {
                    $scope.orderId = data.responseMessage;
                    console.log(data);
                });

                res.error(function (data, status) {
//                    $scope.successMessage = null;
//                    $scope.ErrorMessage = true;
                    console.log(data);
                    console.log(status);
                });


        }




    };



    ///---- Date Picker -----////
    //to set Current DateTime
    $scope.today = function () {
        $scope.newOrder.orderDueDate = dayAfterTomorrow;
    };

    $scope.dateOptions = {
        formatYear: 'yy',
        maxDate: lastDay,
        minDate: dayAfterTomorrow,
        startingDay: 1
    };

    $scope.openDatePicker = function () {
        $scope.popup.opened = true;
    };

    $scope.open = function () {
        $scope.popup.opened = true;
    };

    $scope.popup = {
        opened: false
    };
    ///---- Date Picker -----////





    //to auto calculate the sub total ,tax and total
    $scope.doCalculations = function (isValidNoOfCakeDonuts, isValidNoOfGlazedDonuts) {


        if (isValidNoOfCakeDonuts && isValidNoOfGlazedDonuts) {
            var noCakeDonuts = parseInt($scope.newOrder.noOfCakeDonuts, 10);
            var noGlazedDonuts = parseInt($scope.newOrder.noOfGlazedDonuts, 10);
            $scope.newOrder.subTotal = ((noCakeDonuts + noGlazedDonuts) * 10.25).toFixed(2);
            $scope.newOrder.tax = (((noCakeDonuts + noGlazedDonuts) * 10.25) * 0.15).toFixed(2);
            $scope.newOrder.total = parseFloat($scope.newOrder.subTotal) + parseFloat($scope.newOrder.tax);
        } else {
            $scope.newOrder.subTotal = "0.00";
            $scope.newOrder.tax = "0.00";
            $scope.newOrder.total = "0.00";
        }

    };

    $scope.clearClick = function () {

        location.reload();
    };


});

