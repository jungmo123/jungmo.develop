$(function() {
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	}, function() {
		$(this).removeClass('open');
	});
})