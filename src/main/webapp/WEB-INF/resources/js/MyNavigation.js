$(function() {
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	}, function() {
		$(this).removeClass('open');
	});
})
$(document).on("click","#SearchB",function(){
	var Search = $("#Search").val();
	var form = $("<form></form>");
	form.attr({
		action:"../unifiedSearch="+Search,
		method:"get"
	})
	$("body").append(form);
	form.submit();
})