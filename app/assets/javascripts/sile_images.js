var myApp = angular.module("myApp", ['ui.bootstrap']);
myApp.controller('ImageSliderController', function ($scope) {
  $scope.myInterval =  3000;
  $scope.slides = [];
  $scope.init = function(image){
    $scope.slides = ["http://ia.media-imdb.com/images/M/MV5BMjMxNjc1NjI0NV5BMl5BanBnXkFtZTgwNzA0NzY0ODE@._V1_SY230_CR18,0,307,230_AL_.jpg", "http://ia.media-imdb.com/images/M/MV5BMjMxNjc1NjI0NV5BMl5BanBnXkFtZTgwNzA0NzY0ODE@._V1_SY230_CR18,0,307,230_AL_.jpg"]
  };
});
