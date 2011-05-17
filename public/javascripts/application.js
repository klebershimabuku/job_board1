$(document).ready(function() {
   $('#flash').delay(500).fadeIn('slow', function() {
      $(this).delay(4000).fadeOut();
   });
});