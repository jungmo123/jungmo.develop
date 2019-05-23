$(function() {
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	}, function() {
		$(this).removeClass('open');
	});
	
	$("#bannerTitle button").click(function(e){
		e.preventDefault();
		var bnnLocation = $(".nav-tabs > .active").prop("id");
		var form = $("<form id = 'uploadForm' enctype = 'multipart/form-data'></form>")
		var div1 = $("<div id = 'bannerDiv'></div>");
		var div2 = $("<div id = 'bannerImage'></div>");
		var div3 = $("<div></div>");
		var imgDiv = $("<div id = 'banner1'></div>");
		if(bnnLocation == 'top' || bnnLocation == 'main'){
			var imgX = $("<img id = 'thumbnailX'>")
			imgX.attr({
				"src":'../IMAGE/noSearchX.jpg'
			})
			imgDiv.append(imgX);
		}else{
			var imgY = $("<img id = 'thumbnailY'>")
			imgY.attr({
				"src":'../IMAGE/noSearchY.jpg'
			})
			$(imgY).rotate(-90);
			imgDiv.append(imgY);
		}
		div2.append(imgDiv);
		
		var bnnLocation = $(".nav-tabs").find('.active').prop("id");
		
		var p1 = $("<p id = 'imageUrl'></p>");
		var p2 = $("<p></p>");
		var p3 = $("<p></p>");
		var p4 = $("<p></p>");
		var p5 = $("<p></p>");
		p4.append($("<span>배너 이미지</span>"));
		p4.css('display','inline-block');
		p1.css({
			'display':'inline-block',
			'width':'500px'
		})
		var location = $("<input type = 'text' name = 'bnnLocation' style='display:none'>");
		location.val(bnnLocation);
		p1.append(location);
		p1.append($("<input id = 'getFile' type = 'file' name = 'file' class='custom-file-input' onchange = 'LoadImg(this)'>"));
		p1.append($("<label class='custom-file-label' for='inputGroupFile01'>"));	
		p2.append($("<span>링크 주소</span>"));
		p2.append($("<input type = 'text' class = 'form-control' name = 'linkAddress' />"));
		p2.append($("<input type = 'radio' name = 'bannerLink' value = 'blank' />"));
		p2.append($("<label for = 'blank'>새 창(Blank)</label>"));
		p2.append($("<input type = 'radio' name = 'bannerLink' value = 'self' />"));
		p2.append($("<label for = 'self'>본 창(Self)</label>"));
		
		p5.append($("<span>배너 설명</span>"));
		var explainment = $("<input type = 'text' class = 'form-control' name = 'bannerExplainment' />");
		p5.append(explainment);
		p5.append($("<button type = 'button' class = 'btn btn-deafult' id = 'bannerAdd' style='font-weight:bold'>저장하기</button>"));
		p5.append($("<button type = 'button' class = 'btn btn-deafult' id = 'Delete' style='font-weight:bold'>삭제하기</button>"));
		
		p3.append($("<span>노출 여부</span>"));
		var visible = $("<input type='radio' name='eventType' id='visible' value = 'visible'>");
		var unvisible = $("<input type='radio' name='eventType' id='unvisible' value = 'unvisible'>'");

		p3.append(visible);
		p3.append("<label for='visible'>노출</label>")
		p3.append(unvisible);
		p3.append("<label for='unvisible'>노출되지 않음</label>")
		
		div3.append(p4);
		div3.append(p1);
		div3.append(p2);
		div3.append(p3);
		div3.append(p5);
		
		div1.append(div2);
		div1.append(div3);
		form.append(div1);
		$(".bannerBody").append(form);
		$(".bannerBody").append($("<hr>"));
	})
})