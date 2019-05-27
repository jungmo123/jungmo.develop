$(function(){
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	},function() {
		$(this).removeClass('open');
	});
	
	$("#searchBar > #detail").bind("click",function(){
		if($(this).hasClass("op") === true){
			$(this).removeClass("op");
			$(this).addClass("cl");
			$(this).text("");
			$(this).text("상세 검색 열기")
			var span = $("<span></span>");
			span.addClass("glyphicon glyphicon-triangle-top")
			$(this).append(span);			
			
			$("#detailBox").addClass("none");
		}else{
			$(this).removeClass("cl");
			$(this).addClass("op");
			var first = $(this).find(":first-child");
			$(this).text("");
			$(this).text("상세 검색 닫기")
			var span = $("<span></span>");
			span.addClass("glyphicon glyphicon-triangle-bottom");
			$(this).append(span);	

			$("#detailBox").removeClass("none");
		}		
	});
	
	$("form > div > #table tr td button").click(function(e){
		e.preventDefault();
	})
})