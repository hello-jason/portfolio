$(document).ready(function() {

  var owl = $(".carousel");
  var time = 4; // time in seconds
  var $progressBar,
      $bar, 
      $elem, 
      isPause, 
      tick,
      percentTime;
 
    //Init the carousel
    owl.owlCarousel({
      slideSpeed:       500,
      paginationSpeed:  500,
      singleItem:       true,
      pagination:       false,
      afterInit:        progressBar,
      afterMove:        moved,
      startDragging:    pauseOnDragging,
      transitionStyle:  "fade",
      lazyLoad:         true,
      mouseDrag:        false,
      touchDrag:        false
    });

    //Custom trigger controls
    $("#hero-controls .hero-prev").click(function() {
      owl.trigger("owl.prev");
    });
    $("#hero-controls .hero-next").click(function() {
      owl.trigger("owl.next");
    });
 
    //Init progressBar where elem is $("#owl-demo")
    function progressBar(elem){
      $elem = elem;
      //build progress bar elements
      buildProgressBar();
      //start counting
      start();
    }
 
    //create div#progressBar and div#bar then prepend to $("#owl-demo")
    function buildProgressBar(){
      $progressBar = $("<div>",{
        id:"progressBar"
      });
      $bar = $("<div>",{
        id:"bar"
      });
      $progressBar.append($bar).insertAfter($elem);
    }
 
    function start() {
      //reset timer
      percentTime = 0;
      isPause = false;
      //run interval every 0.01 second
      tick = setInterval(interval, 10);
    };
 
    function interval() {
      if(isPause === false){
        percentTime += 1 / time;
        $bar.css({
           width: percentTime+"%"
         });
        //if percentTime is equal or greater than 100
        if(percentTime >= 100){
          //slide to next item 
          $elem.trigger('owl.next')
        }
      }
    }
 
    //pause while dragging 
    function pauseOnDragging(){
      isPause = true;
    }
 
    //moved callback
    function moved(){
      //clear interval
      clearTimeout(tick);
      //start again
      start();
    }
 
    // pause on mouseover 
    // $elem.on('mouseover',function(){
    //   isPause = true;
    // })
    // $elem.on('mouseout',function(){
    //   isPause = false;
    // })

  // Toggle hero carousel height
    $(".hero-toggle").click(function() {
      owl.toggleClass("expanded");
    });

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