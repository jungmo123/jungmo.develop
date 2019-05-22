$(function() {
	$(".drop").hover(function() {
		$(this).addClass('open').trigger('show');

	}, function() {
		$(this).removeClass('open');
	});
	
	$("#bannerTitle button").click(function(e){
		e.preventDefault();
		var div1 = $("<div id = 'bannerDiv'></div>");
		var div2 = $("<div id = 'bannerImage'></div>");
		var div3 = $("<div></div>");
		var imgDiv = $("<div id = 'banner1'></div>");
		imgDiv.append($("<img id = 'thumbnail' src = '#'>"))
		
		div2.append($("<input type = 'checkbox' name = 'banner1' />"));
		div2.append(imgDiv);
		
		var p1 = $("<p></p>");
		var p2 = $("<p></p>");
		var p3 = $("<p></p>");
		var p4 = $("<p></p>");
		p4.append($("<span>배너 이미지</span>"));
		p4.css('display','inline-block');
		p1.css({
			'display':'inline-block',
			'width':'500px'
		})
		p1.append($("<input id = 'getFile' type = 'file' class='custom-file-input' onchange = 'LoadImg(this)'>"));
		p1.append($("<label class='custom-file-label' for='inputGroupFile01'>"));		
		p2.append($("<span>링크 주소</span>"));
		p2.append($("<input type = 'text' class = 'form-control' name = 'linkAddress' />"));
		p2.append($("<input type = 'radio' name = 'bannerLink' id = 'blank' />"));
		p2.append($("<label for = 'blank'>새 창(Blank)</label>"));
		p2.append($("<input type = 'radio' name = 'bannerLink' id = 'self' />"));
		p2.append($("<label for = 'self'>본 창(Self)</label>"));
		
		p3.append($("<span>대체 텍스트</span>"));
		p3.append($("<input type = 'text' class = 'form-control' name = 'bannerAddress' />"));
		
		div3.append(p4);
		div3.append(p1);
		div3.append(p2);
		div3.append(p3);
		
		div1.append(div2);
		div1.append(div3);
		
		$(".bannerBody").append(div1);
		$(".bannerBody").append($("<hr>"));
	})
})