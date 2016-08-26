var myApp = angular.module("app-slide-image", []);
myApp.controller("controller-slide-image", function($scope){
  $scope.init = function(image){
    // for(var i = 0, i < image.count, < i ++){
    //   console.log(image[i].url)
    // }
    $scope.slides = function(image, nb){
      var array = image.split(",");
      return array[nb]
    }
    $scope.currentIndex = 0;
    $scope.setCurrentSlideIndex = function (index) {
      $scope.currentIndex = index;
    };

    $scope.isCurrentSlideIndex = function (index) {
      return $scope.currentIndex === index;
    };
  }

});
