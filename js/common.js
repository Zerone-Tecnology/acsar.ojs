jQuery(document).ready(function($){

	$('.main').waypoint(function(){
		$('.articles .article-block').addClass('animated fadeInUp')
	});

	//Chrome Smooth Scroll
	try {
		$.browserSelector();
		if($("html").hasClass("chrome")) {
			$.smoothScroll();
		}
	} catch(err) {

	};

	$("img, a").on("dragstart", function(event) { event.preventDefault(); });
	
});