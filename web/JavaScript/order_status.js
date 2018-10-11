/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// create angular app
var orderCheckApp = angular.module('orderCheckApp', ['angular-loading-bar', 'ngAnimate', 'ui.bootstrap']);

// create angular controller
orderCheckApp.controller('mainController', function ($scope, $http){
    
   $scope.showMatchingRecordFound = false;
   $scope.showNoMatchingRecordFound = false;
   $scope.order={} ;
   
    // function to submit the form after all validation has occurred            
    $scope.searchOrder = function (isValid) {

        // check to make sure the form is completely valid
        if (isValid) {
                var res = $http.get('http://localhost:8080/DuncansDonuts/api/v1/orders/'+$scope.orderId);

            res.success(function (data) {

                $scope.showMatchingRecordFound = true;
                $scope.showNoMatchingRecordFound = false;
                
                var deliverAddress = data.houseNumber+",\n"+data.street+",\n"+data.city+",\n"+data.state;
                
                $scope.order.id = data.orderId;
                $scope.order.status = data.orderStatus;
                $scope.order.noOfCakeDonuts = data.noOfCakeDonuts;
                $scope.order.noOfGlazedDonuts = data.noOfGlazedDonuts;
                $scope.order.totalBill = data.total;
                $scope.order.deliveryDate = formatDate(data.orderDueDate);
                $scope.order.deliveryAddress = deliverAddress;
                
                
            });

            res.error(function (status) {

                $scope.showMatchingRecordFound = false;
                $scope.showNoMatchingRecordFound = true;
            });

           
        }

    };
    
    function formatDate(date){
        var d = new Date(date),
                month = ''+(d.getMonth()+1),
                day = ''+d.getDate(),
                year = d.getFullYear();
        
        if (month.length < 2 ) month = '0'+month;
        if (day.length < 2) day = '0'+day;
        
        return [year,month,day].join('-');
        
    }
    
    
    
});




