var myApp = angular.module("myApp", ['ui.bootstrap']);
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
