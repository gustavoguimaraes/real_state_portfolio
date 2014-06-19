$(function(){
  $('.js-images').sortable({
    dropOnEmpty: false,
    cursor: 'hand',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
        type: 'post',
        data: $('.js-images').sortable('serialize'),
        dataType: 'script',
        url: $('.js-images').data('sort-url')
      });
    }
  });
});