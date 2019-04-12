$(function() {
	$(".nav-tabs li").hover(function() {
		$(".nav-tabs li").removeClass('active');
		$(".nav-tabs li a").attr('aria-expanded','false');
		$(this).addClass('active').trigger('show');
		$(this).find('a').attr('aria-expanded','true');
	});

	$("#bestProduct > div > div").hover(function() {
		$("#bestProduct > div > div").removeClass('activeDiv');
		$(this).addClass('activeDiv');
	});
})