(function( $ ) {
	'use strict';

	/* BMI Calculator Start */
	if ( 1 == $('#bmi').length ) {
		initBmiCalculator();
	}

	/* Trainer Slider  Start */
	jQuery(document).ready(function () {
		jQuery('.btn-vertical-slider').on('click', function () {
			if (jQuery(this).attr('data-slide') == 'next') {
				jQuery('#myCarousel').carousel('next');
			}
			if (jQuery(this).attr('data-slide') == 'prev') {
				jQuery('#myCarousel').carousel('prev')
			}
		});
	});

})( jQuery );
