$(document).ready(function(){
  if ($('.review-product-list').length == 0) {
    $("#zoom-img").elevateZoom({
      scrollZoom    : true,
      zoomWindowWidth   : 500,
      zoomWindowHeight  : 500,
    });
  }
});
