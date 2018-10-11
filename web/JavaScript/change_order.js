/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// create angular app
var changeOrderApp = angular.module('changeOrderApp', ['angular-loading-bar', 'ngAnimate', 'ui.bootstrap']);

changeOrderApp.controller('mainController', function ($scope, $http){
    
   $scope.showMatchingRecordFound = false;
   $scope.showNoMatchingRecordFound = false;
   $scope.isSearchDisabled = false ;
   $scope.message = false ;
   $scope.inProgressMessage = false ;
   $scope.inDeliveryMessage = false ;
   
   $scope.changeOrder = {};
   
    var dayAfterTomorrow = new Date();
    dayAfterTomorrow = dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);

    $scope.changeOrder.orderDueDate = new Date(dayAfterTomorrow);

    var lastDay = new Date();
    lastDay = lastDay.setMonth(lastDay.getMonth() + 2);
   
    // function to submit the form after all validation has occurred            
    $scope.searchOrder = function (isValid) {
         // check to make sure the form is completely valid
        if (isValid) {
              
                var res = $http.get('http://localhost:8080/DuncansDonuts/api/v1/orders/'+$scope.orderId);

            res.success(function (data) {
                $scope.isSearchDisabled = true ;
                
                $scope.showMatchingRecordFound = true;
                $scope.showNoMatchingRecordFound = false;
                $scope.changeOrder= data;
                $scope.changeOrder.orderDueDate = new Date(data.orderDueDate);
                
                if($scope.changeOrder.orderStatus === 'In Progress'){
                    $scope.isDisableInProgressInputs = true ;
                    $scope.inProgressMessage = true ;
                }else if($scope.changeOrder.orderStatus === 'In Delivery'){
                    $scope.isDisableInDeliveryInputs = true ;
                    $scope.inDeliveryMessage = true ;
                }
                
               
                
            });

            res.error(function (status) {

                $scope.showMatchingRecordFound = false;
                $scope.showNoMatchingRecordFound = true;
            });

           
        }

    };
    
    $scope.submitChangeOrder=function (isValid){
        if(isValid){
            
            $scope.changeOrder.orderDate = new Date();
            $scope.changeOrder.orderTime = new Date();
            
            var res = $http.put('http://localhost:8080/DuncansDonuts/api/v1/orders/',$scope.changeOrder);
            
            res.success(function (data) {
                $scope.searchOrder(true);
                $scope.message = true;
                
            });

            res.error(function (data) {
                console.log(data);
                
            });
        }
    };
    
    ///---- Date Picker -----////
    //to set Current DateTime
    $scope.today = function () {
        $scope.changeOrder.orderDueDate = dayAfterTomorrow;
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
            var noCakeDonuts = parseInt($scope.changeOrder.noOfCakeDonuts, 10);
            var noGlazedDonuts = parseInt($scope.changeOrder.noOfGlazedDonuts, 10);
            $scope.changeOrder.subTotal = ((noCakeDonuts + noGlazedDonuts) * 10.25).toFixed(2);
            $scope.changeOrder.tax = (((noCakeDonuts + noGlazedDonuts) * 10.25) * 0.15).toFixed(2);
            $scope.changeOrder.total = parseFloat($scope.changeOrder.subTotal) + parseFloat($scope.changeOrder.tax);
        } else {
            $scope.changeOrder.subTotal = "0.00";
            $scope.changeOrder.tax = "0.00";
            $scope.changeOrder.total = "0.00";
        }

    };
    
    $scope.cancelClick = function () {

        location.reload();
    };
    
    
});


