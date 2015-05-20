//= require layzr.js/dist/layzr
//= require jquery/dist/jquery
//= require lightcase/lightcase

var layzr = new Layzr({
  attr: 'data-layzr',
  retinaAttr: 'data-layzr-retina',
  threshold: 20,
  callback: null
});

jQuery(document).ready(function($) {
  $('a[data-rel^=lightcase]').lightcase({
    showTitle: false
  });
});
