/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var cancelOrderApp = angular.module('cancelOrderApp', ['angular-loading-bar', 'ngAnimate', 'ui.bootstrap']);

cancelOrderApp.controller('mainController', function ($scope, $http){
    
   $scope.showMatchingRecordFound = false;
   $scope.showNoMatchingRecordFound = false;
   $scope.isSearchDisabled = false ;
   $scope.inProgressShow = false ;
   $scope.inDeliveryShow = false ;
   
   $scope.cancelOrder = {};
   
    var dayAfterTomorrow = new Date();
    dayAfterTomorrow = dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);

    $scope.cancelOrder.orderDueDate = new Date(dayAfterTomorrow);

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
                $scope.cancelOrder= data;
                $scope.cancelOrder.orderDueDate = new Date(data.orderDueDate);
                
                if($scope.cancelOrder.orderStatus === 'In Progress'){
                    $scope.inProgressShow = true ;
                }else if($scope.cancelOrder.orderStatus === 'In Delivery'){
                    $scope.inDeliveryShow = true ;
                }
                console.log(data);

                
               
                
            });

            res.error(function (status) {

                $scope.showMatchingRecordFound = false;
                $scope.showNoMatchingRecordFound = true;
            });

           
        }

    };
    
    $scope.submitCancelOrder=function (isValid){
        if(isValid){
            $scope.cancelOrder.orderDate = new Date($scope.cancelOrder.orderDate);
            $scope.cancelOrder.orderTime = new Date($scope.cancelOrder.orderDate);
            console.log($scope.cancelOrder);
            
            var res = $http.delete('http://localhost:8080/DuncansDonuts/api/v1/orders/'+$scope.cancelOrder.orderId);

            res.success(function (data) {
                $scope.cancelClick();
                
            });

            res.error(function (data) {
                console.log(data);
            });
        }
    };
    
    ///---- Date Picker -----////
    //to set Current DateTime
    $scope.today = function () {
        $scope.cancelOrder.orderDueDate = dayAfterTomorrow;
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
    
    
    $scope.cancelClick = function () {

        location.reload();
    };
    
    
});


