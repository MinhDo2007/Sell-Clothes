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
