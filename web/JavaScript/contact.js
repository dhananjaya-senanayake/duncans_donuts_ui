/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// create angular app
var contactApp = angular.module('contactApp', ['angular-loading-bar', 'ngAnimate', 'ui.bootstrap']);

// create angular controller
contactApp.controller('mainController', function ($scope, $http){
    
    $scope.constructor = function(){
        $scope.contactData = {} ;
        
    };
    // function to submit the form after all validation has occurred            
    $scope.submitForm = function (isValid) {

        // check to make sure the form is completely valid
        if (isValid) {

            var res = $http.post('http://localhost:8080/DuncansDonuts/api/v1/messages', $scope.contactData);
            console.log($scope.contactData);
            res.success(function (data) {
                $scope.successMessage = data.responseMessage;
                $scope.ErrorMessage = null;
            });

            res.error(function (data, status) {
                $scope.successMessage = null;
                $scope.ErrorMessage = true;
                console.log(data);
                console.log(status);
            });

           
        }

    };
    
    $scope.clearClick = function () {

        location.reload();
    };
    
    
});

