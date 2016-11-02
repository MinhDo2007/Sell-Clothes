var myApp = angular.module("myApp", ['ui.bootstrap', 'ngRoute', 'templates'])
myApp.controller('ImageSliderController', function ($scope) {
  $scope.myInterval =  3000;
  $scope.init = function(image){
    $scope.slides = image.split(',');
  }
});

myApp.controller("ctrMap", function ($scope){
  $scope.mapStyle = true;
  $scope.showMap = function(){
    $scope.mapStyle = false;
    setTimeout(function(){
      map = handler.getMap();
      var center = map.getCenter();
      google.maps.event.trigger(map, 'resize');
      map.setCenter(center);
    });
  };
});

$(document).keydown(function(event){
  if (event.keyCode == 27) {
    $(".image_modal").modal('hide');
  }
});

myApp.controller("ctrShowProduct", function ($scope, $http){
  $scope.init = function(img){
    $scope.img = img;
  }
  $scope.imageHover = function(image_hover){
    $scope.img = image_hover;
    var ez = $("#zoom-img").data('elevateZoom');
    ez.swaptheimage($scope.img, image_hover);
  }
});

myApp.controller("fadeCtr", function($scope){
  $scope.active = 0;
  $scope.fade = function(active, old_number){
    $scope.active = active;
    for(var i = 0; i < 3; i++) {
      if (i == old_number) {
        $scope.old_number = old_number;
      }

      if (i < active) {
        $scope["page" + i] = 'true';
      } else {
        $scope["page" + i] = 'false';
      }
    }
  }
});

myApp.controller("blogsCtr", function($scope, $location){
  var url = $(location).attr('pathname');
  $scope.url = url;
});

myApp.controller("tabCtr", function($scope){
  $scope.number = 1
  $scope.setTab = function(number) {
    $scope.number = number;
  }
});
