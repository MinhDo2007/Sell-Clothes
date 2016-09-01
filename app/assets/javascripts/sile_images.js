var myApp = angular.module("myApp", ['ui.bootstrap']);
myApp.controller('ImageSliderController', function ($scope) {
  $scope.myInterval =  3000;
  $scope.init = function(image){
    $scope.slides = image.split(',');
  }
});
