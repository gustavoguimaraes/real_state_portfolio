$(function () {
  var $container = $('.js-rentals-container');

  $container.masonry({
    itemSelector: '.js-listing-box'
  });

  $container.imagesLoaded(function(){
    $container.masonry();
  });
});