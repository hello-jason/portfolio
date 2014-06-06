$(document).ready(function() {
  var jump = function(event){
    //prevent the default action for the click event
    event.preventDefault();
    //get the full url - like mysitecom/index.htm#home
    var full_url = this.href;
    //split the url by # and get the anchor target name - home in mysitecom/index.htm#home
    var parts = full_url.split('#');
    var trgt = parts[1];
    //get the top offset of the target anchor
    var target_offset = $('#'+trgt).offset();
    var target_top = target_offset.top;
    //goto that anchor by setting the body scroll top to anchor top
    $('html, body').animate({scrollTop:target_top}, 560);
  };

  $('body.home').scrollspy({
    target: '#primary-navigation',
  });
  
  $('body.home #primary-navigation a').click(jump);
  $('a.totop').click(jump);

  $(function () {
    setInterval(function() {
      $('.progress-bar')
        .filter(':onScreen')
          .removeClass('nobar')
      }, 800)
    $("[data-toggle='popover']").popover();
  });

  // Context-specific image technique.
  // Offers smaller images to mobile devices and larger images to desktops
  var queries = [
    {
      context: 'xsmall',
      callback: function() {
          $('img').each(function(index) {
              var small = $(this).attr('src');
              $(this).attr('src',small);
          });
      }
    },
    {
      context: 'small',
      callback: function() {
          $('img').each(function(index) {
              var medium = $(this).data('medium');
              $(this).attr('src',medium);
          });
      }
    }
  ];
  MQ.init(queries);

});
