jQuery(document).ready(function($){

	// $('.main').waypoint(function(){
	// 	$('.articles .article-block').addClass('animated fadeInUp')
	// });

	$('.mobile-menu').click(function(){
		$(this).find('#nav-icon').toggleClass('open');
		$('.nav-wrap').toggleClass('open')
	});

	$("a[href='#up']").click(function() {
		$("html, body").animate({ scrollTop: 0 }, "slow");
		return false;
	});
	
});