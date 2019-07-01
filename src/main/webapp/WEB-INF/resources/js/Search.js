	function getGoodsReviews(data){
		if(data.godr == 0){
			var trr = $("<tr></tr>");
			var tdd = $("<td id = 'noReview'></td>");
			var spann = $("<p><span class = 'glyphicon glyphicon-info-sign'></span></p>");
			var spann2 = $("<p><span>작성된 리뷰가 없습니다</span></p>");
			tdd.append(spann);
			tdd.append(spann2);
			trr.append(tdd);
			$("#godrTable").append(trr);
		}else{
			$("#godrTable").text("");
			$("#godrPagination").text("");
			var userId = data.userId;
			var idx;
			if(data.pageMaker.currentPage == 1){
				idx = 1;
			}else{
				idx = (data.pageMaker.currentPage-1)*5+1;
			}
			$.each(data.godr,function(index,item){
				var tr = $("<tr></tr>");
				tr.attr("class",idx);
				var td1 = $("<td></td>");
				var span1 = $("<span class = 'number'></span>");
				span1.text(idx);
				td1.append(span1);
				var td2 = $("<td></td>");
				var div1 = $("<div></div>");
				var span2 = $("<span></span>");
				var d = new Date(item.godrWritingDate);
				span2.text(getTimeStamp(d));
				var span3 = $("<span>&nbsp;&#124;&nbsp;</span>");
				var span4 = $("<span></span>");
				span4.text(item.userId);
				var br1 = $("<br>");
				var p = $("<p style='margin: 5px 0 0px;'></p>");
				var content = data.godr[index].godrContent;
				content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"").substring(0,40);
				if(content.length > 15){
					p.text(content.substring(0,15) + "...");
				}else{
					p.text(content);
				}						
				div1.append(span2);
				div1.append(span3);
				div1.append(span4);
				div1.append(br1);
				div1.append(p);
				td2.append(div1);
				var td3 = $("<td></td>");
				var div2 = $("<div></div>");
				var satisLevel = "";
				for(var i = 0 ; i < item.satisLevel ; i++){
					satisLevel += "★";
				}
				var span5 = $("<span></span>");
				span5.text(satisLevel);
				div2.append(span5);
				td3.append(div2);
				var td4 = $("<td></td>");
				var div3 = $("<div></div>");
				var button1 = $("<button class = 'tableButton'></button>");
				button1.append("<span>보기&nbsp;<span class = 'glyphicon glyphicon-triangle-bottom'></span></span>");
				div3.append(button1);
				td4.append(div3);
				tr.append(td1);
				tr.append(td2);
				tr.append(td3);
				tr.append(td4);
				$("#godrTable").append(tr);
				
				var tr2 = $("<tr class = 'commentTr none'></tr>");
				var td5 = $("<td></td>");
				var td6 = $("<td colspan = '3'></td>");
				var div4 = $("<div></div>");
				div4.attr({id:idx});
				var div5 = $("<div></div>'");
				var span6 = $(data.godr[index].godrContent);
				div5.append(span6);
				var div6 = $("<div></div>");
				var button2;
				var button3;
				var satisLevel;
				var godrNum;
				if(userId == item.userId){
					button2 = $("<button class = 'btn btn-default godrM' data-toggle = 'modal' data-target = '#godrModify'>수정</button>");
					button3 = $("<button id = 'deleteGodr' class = 'btn btn-default'>삭제</button>");
					satisLevel = $("<input type = 'number' name = 'satisLevel' style = 'display:none'></input>");
					godrNum = $("<input type = 'number' name = 'godrNum' style = 'display:none'></input>");
					satisLevel.val(item.satisLevel);
					godrNum.val(item.godrNum);
				}
				div6.append(button2);
				div6.append(button3);
				div6.append(satisLevel);
				div6.append(godrNum);
				div4.append(div5);
				div4.append(div6);
				td6.append(div4);
				tr2.append(td5);
				tr2.append(td6);
				$("#godrTable").append(tr2);
				idx++;
			})
			var div = $("<div></div>");
			var ul = $("<ul class = 'pagination'></ul>");
			if(data.pageMaker.prev){
				var li = $("<li></li>");
				var a = $("<a></a>");
				var span = $("<span class = 'glyphicon glyphicon-chevron-left'></span>");
				a.attr({
					id:data.pageMaker.startPage-1
				});
				a.append(span);
				li.append(a);
				ul.append(li);
			}
			for(i = data.pageMaker.startPage-1; i < data.pageMaker.endPage ; i++){
				if(data.pageMaker.currentPage-1 == i){
					var li = $("<li class = 'active'></li>");
					var a = $("<a></a>");
					a.attr({
						id:i+1
					});
					a.text(i+1);
					li.append(a);
					ul.append(li);
				}else{
					var li = $("<li></li>");
					var a = $("<a></a>");
					a.attr({
						id:i+1
					});
					a.text(i+1);
					li.append(a);
					ul.append(li);
				}
			}
			if(data.pageMaker.next){
				var li = $("<li></li>");
				var a = $("<a></a>");
				var span = $("<span class = 'glyphicon glyphicon-chevron-right'></span>");
				a.attr({
					id:data.pageMaker.endPage+1
				});
				a.append(span);
				li.append(a);
				ul.append(li);
			}
			div.append(ul);
			$("#godrPagination").append(div);
		}		
	}

function getGoodsReview(Search,idx){
		$.ajax({
			url:"getGoodsReviews",
			method:"post",
			data: {
				Search:Search,
				idx:idx
			},
			success:function(data){
				getGoodsReviews(data);
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	}