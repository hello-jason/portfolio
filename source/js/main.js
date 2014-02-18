$(document).ready(function() {

  $(".see-more").click(function() {
    $(this).next(".more-content").toggleClass("visible");
    $(this).addClass("cloak");
  });

  $(".see-less").click(function() {
    $(this).parent(".more-content").prev(".see-more").toggleClass("cloak");
    $(this).parent(".more-content").toggleClass("visible");
  });

  // Animate progress bars after a delay
  setTimeout(function(){
    $(".progress-bar").removeClass("nobar");
  }, 1000);

});