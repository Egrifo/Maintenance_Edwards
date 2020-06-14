jQuery("document").ready(function(){
   //Counter script of homepage
    jQuery('.count').each(function () {
        jQuery(this).prop('Counter',0).animate({
          Counter: jQuery(this).text()
        },{
          duration: 30000,
          easing: 'swing',
          step: function (now) {
             jQuery(this).text(Math.ceil(now));
          }
        });
    });
});