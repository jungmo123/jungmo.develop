$(function() {
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	}, function() {
		$(this).removeClass('open');
	});
	//6페이지
	$("#commentDiv button:nth-child(3)").bind("click", function() {
		$("#commentDiv > form").removeClass("none");
	})
	// 6페이지
	$("#commentDiv button:nth-child(4)").bind("click", function() {
		$("#commentDiv > form").addClass("none");
	})
	//8페이지
	$("#orderitem table tr:nth-child(2) td:nth-child(4) button").click(
			function() {
				if ($(this).hasClass("op") === true) {
					$(this).removeClass("op");
					$(this).addClass("cl");
					var first = $(this).find(":first-child");
					first.text("보기 ");
					var span = $("<span></span>");
					span.addClass("glyphicon glyphicon-triangle-bottom")
					first.append(span);

					$(".commentBox").addClass("none");
				} else {
					$(this).removeClass("cl");
					$(this).addClass("op");
					var first = $(this).find(":first-child");
					first.text("닫기 ");
					var span = $("<span></span>");
					span.addClass("glyphicon glyphicon-triangle-top")
					first.append(span);

					$(".commentBox").removeClass("none");
				}
			});
	//13 페이지
	$("#product table tr td:nth-child(4) button").click(function(){
		if($(this).hasClass("op") === true){
			$(this).removeClass("op");
			$(this).addClass("cl");
			$(this).text("");
			$(this).text("보기 ")
			var span = $("<span></span>");
			span.addClass("glyphicon glyphicon-triangle-top")
			$(this).append(span);			
			
			$("#commentRead").addClass("none");
		}else{
			$(this).removeClass("cl");
			$(this).addClass("op");
			var first = $(this).find(":first-child");
			$(this).text("");
			$(this).text("닫기 ")
			var span = $("<span></span>");
			
			span.addClass("glyphicon glyphicon-triangle-bottom")
			$(this).append(span);	

			$("#commentRead").removeClass("none");
		}
	});

	//13 페이지
	$("#writeButton").bind("click", function() {
		$("#writeForm").removeClass("none");
	});

	//13 페이지
	$("#writeCancel").bind("click", function() {
		$("#writeForm").addClass("none");
	});
	
	// 14페이지
	$("#searchMenu button:nth-child(2)").bind("click",function(e){
		e.preventDefault();
		var searchList = $(".searchList");
		if(searchList.length == "5"){
			$("#Alert").modal();
		}else{
			var $searchList = $("<div></div>");
			var $div = $("<div></div>");
			$searchList.addClass("searchList");
			$div.append($("<input type = 'checkbox'></input>"));
			$div.append($("<input type = 'text' class = 'form-control' placeholder = '검색어 입력'></input>"));
			$div.append($("<input type = 'text' class = 'form-control' placeholder = 'URL 입력'></input>"));
			$searchList.append($div);
			
			$("#searchOption").append($searchList);			
		}
	})
	
	//14페이지
	$("#searchMenu button:nth-child(3)").bind("click",function(e){
		e.preventDefault();
		var $searchList = $(".searchList input[type='checkbox']:checked").parents(".searchList").remove();
		
	});
	
	//14페이지
	$("#resultTableC div:first-child button").bind("click",function(e){
		e.preventDefault();
		if($(this).hasClass("op") === true){
			$(this).removeClass("op");
			$(this).addClass("cl");
			$(this).text("");
			$(this).text("열기")
			var span = $("<span></span>");
			span.addClass("glyphicon glyphicon-triangle-top")
			$(this).append(span);			
			
			$("#openTable").addClass("none");
		}else{
			$(this).removeClass("cl");
			$(this).addClass("op");
			var first = $(this).find(":first-child");
			$(this).text("");
			$(this).text("닫기")
			var span = $("<span></span>");
			span.addClass("glyphicon glyphicon-triangle-bottom");
			$(this).append(span);	

			$("#openTable").removeClass("none");
		}
	});
	
	$("#openTable > div > button:first-child").bind("click",function(e){
		e.preventDefault();
	})
	
	//GOODSADMIN 05
	$("#categoryBox > button").click(function(){
		$("#categoryTable").removeClass("none");
	})
})
