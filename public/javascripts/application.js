$(document).ready(function() {
   $('#flash').delay(500).fadeIn('slow', function() {
      $(this).delay(4000).fadeOut();
   });

   if ($.browser.msie) {
	    $("#download_chrome_message").jmNotify({
		methodIn : 'slideDown',
		methodOut : 'slideUp ',
		delay : 20000
	});
   }
});


window.___gcfg = {lang: 'pt-BR'};

(function() {
  var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
  po.src = 'https://apis.google.com/js/plusone.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();