var myApp = angular.module("myApp", ['ui.bootstrap', 'ngRoute', 'templates'])
myApp.config(['$httpProvider', function($httpProvider){
  $httpProvider.defaults.headers.common.Accept = 'application/json'
}])
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

myApp.controller("tabCtr", function($scope){
  $scope.number = 1
  $scope.setTab = function(number) {
    $scope.number = number;
  }
});


myApp.controller("blogsCtr", function($scope, $http, $location, $timeout){
  var url = $(location).attr('pathname');
  $scope.url = url;

  $scope.init = function(json){
    $scope.comments = JSON.parse(json);
  }
  $scope.postComment = function(blog_id, user_id){
    console.log($scope.conment)
    $http({
      url: '/blogs/' + blog_id + '/comments',
      method: 'POST',
      params: {blog_id: blog_id, content: $scope.comment, user_id: user_id}
    }).success(function(data){
      $scope.comment = "";
      $scope.comments = data
    })
  }

  $scope.deleteComment = function(blog_id, comment_id){
    $http({
      method: 'DELETE',
      url: '/blogs/' + blog_id + '/comments/' + comment_id
    }).success(function(data){
      $scope.comments = data;
      $(".modal-backdrop").remove();
      $("body").removeClass("modal-open");
      $scope.showMessage = 1;
      $scope.message = "Delete comment successfully";
      $timeout(function(){
        $scope.showMessage =  2;
      }, 5000);
    })
  }

  $scope.editComment = function(blog_id, comment_id){
    console.log(comment_id);
    $scope["des" + comment_id] = 'true';
    $scope.disable = comment_id;
    $scope.updateComment = function(keyEvent){
      if(keyEvent.which === 13){
        var content = $("#" + comment_id).val();
        console.log(content);
        $http({
          method: 'PUT',
          url: '/blogs/' + blog_id + '/comments/' + comment_id,
          params: {content: content}
        }).success(function(data){
          $scope.disable = "true";
          $scope["des" + comment_id] = 'false';
          $scope.comments = data;
        });
      }
    }
  }
});
