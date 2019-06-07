	function getTimeStamp(date) {
		  var d = date;
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
		}

		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
		
	function getGoodsReview(godNum,idx){
		$.ajax({
			url:"getGoodsReviews",
			method:"post",
			data: {
				godNum:godNum,
				idx:idx
			},
			success:function(data){
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
							button3 = $("<button class = 'btn btn-default'>삭제</button>");
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
	
	function goodsQuestion(godNum,idx){
		$.ajax({
			url:"getGoodsQuestion",
			method:"post",
			data: {
				godNum:godNum,
				idx:idx
			},
			success:function(data){
				if(data.godq == 0){
					$("#qnaTable").text("");
					var trr = $("<tr></tr>");
					var tdd = $("<td id = 'noReview'></td>");
					var spann = $("<p><span class = 'glyphicon glyphicon-info-sign'></span></p>");
					var spann2 = $("<p><span>작성된 문의가 없습니다</span></p>");
					tdd.append(spann);
					tdd.append(spann2);
					trr.append(tdd);
					$("#qnaTable").append(trr);
				}else{
				var first = $("#qnaTable tr")[0];
				$("#qnaTable").text("");
				$("#qnapagination").text("");
				$("#qnaTable").append(first);
				var userId = data.userId;
				var idx;
				if(data.pageMaker.currentPage == 1){
					idx = 1;
				}else{
					idx = (data.pageMaker.currentPage-1)*5+1;
				}
				$.each(data.godq,function(index,item){
					var tr = $("<tr></tr>");
					var td1 = $("<td rowspan = '2'></td>");
					var span1 = $("<span class = 'number'></span>");
					span1.text(idx);
					td1.append(span1);
					var td2 = $("<td></td>");
					var div1 = $("<div></div>");
					var span2 = $("<span class = 'questContent'></span>");
					var content = data.godq[index].godqContent;
					content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"");
					if(content.length > 15){
						span2.text(content.substring(0,15) + "...");
					}else{
						span2.text(content);
					}
					div1.append(span2);
					td2.append(div1);
					var td3 = $("<td></td>");
					var div2 = $("<div></div>")
					var span3 = $("<span></span>");
					span3.text(data.godq[index].godqUserId);
					div2.append(span3);
					td3.append(div2);
					var td4 = $("<td></td>");
					var div3 = $("<div></div>")
					var span4 = $("<span></span>");
					var d = new Date(item.godqWritingDate);
					var day = getTimeStamp(d);
					var ymd = day.substring(0,10);
					var hms = day.substring(10,20);
					span4.html(ymd + '<br>' + hms);
					div3.append(span4);
					td4.append(div3);
					var td5 = $("<td rowspan = '2'></td>");
					var div4 = $("<div></div>")
					var button1 = $("<button class = 'tableButton'><span>보기&nbsp;<span class = 'glyphicon glyphicon-triangle-bottom'></span></span></button>");
					div4.append(button1);
					td5.append(div4);
					tr.append(td1);
					tr.append(td2);
					tr.append(td3);
					tr.append(td4);
					tr.append(td5);
					$("#qnaTable").append(tr);
					
					tr1 = $("<tr></tr>");
					var td6 = $("<td></td>");
					var div5 = $("<div></div>")
					var span5 = $("<span class = 'questContent'></span>");
					var content1 = data.godq[index].godaContent;
					if(data.godq[index].godaContent != null){
						content1 = content1.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"");
						if(content1.length > 15){
							span5.text(content1.substring(0,15) + "...");
						}else{
							span5.text(content1);
						}
					}else{
						span5.text("등록된 답변이 없습니다.");
					}
					div5.append(span5);
					td6.append(div5);
					var td7 = $("<td></td>");
					var div6 = $("<div></div>")
					var span6 = $("<span></span>");
					if(data.godq[index].godaUserId != null){
						span6.text(data.godq[index].godaUserId);
					}
					div6.append(span6);
					td7.append(div6);
					var td8 = $("<td></td>");
					var div7 = $("<div></div>")
					var span7 = $("<span></span>");
					if(item.godaWritingDate != null){
						var d = new Date(item.godaWritingDate);
						var day = getTimeStamp(d);
						var ymd = day.substring(0,10);
						var hms = day.substring(10,20);
						span7.html(ymd + '<br>' + hms);	
					}
					div7.append(span7);
					td8.append(div7);
					tr1.append(td6);
					tr1.append(td7);
					tr1.append(td8);
					$("#qnaTable").append(tr1);
					
					var tr2 = $("<tr class = 'DocumentOpen none'></tr>");
					var td9 = $("<td></td>");
					var divv1 = $("<div class = 'divv'></div>");
					var divv2 = $("<div class = 'divv'></div>");
					var strong1 = $("<strong>Q</strong>");
					var strong2 = $("<strong>A</strong>");
					divv1.append(strong1);
					divv2.append(strong2);
					td9.append(divv1);
					td9.append(divv2);
					var td10 = $("<td colspan = '4'></td>");
					var div8 = $("<div></div>");
					var content2 = data.godq[index].godqContent;
					div8.html(content2);
					var button2;
					var button3;
					if(data.godq[index].godqUserId == userId){
						 button2 = $("<button class = 'btn btn-default'>수정</button>");
						 button3 = $("<button class = 'btn btn-default'>삭제</button>");
					}
					div8.append(button2);
					div8.append(button3);
					var div9 = $("<div></div>");
					if(data.godq[index].godaContent != null){
						var content3 = data.godq[index].godaContent;
						div9.html(content3);
					}else{
						div9.html("답변 준비중입니다. 신속하게 답변 드리겠습니다.");
					}
					td10.append(div8);
					td10.append(div9);
					tr2.append(td9);
					tr2.append(td10);
					$("#qnaTable").append(tr2);
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
				$("#qnapagination").append(div);
				}
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

		$(function(){
			var index = "0";
			getGoodsReview(godNum,index);
			goodsQuestion(godNum,index);
		})
		
		$(document).on("click","#godrPagination .pagination > li > a",function(){
			var idx = $(this).prop("id");			
			getGoodsReview(godNum,idx);
		})
		
		$(document).on("click","#qnapagination .pagination > li > a",function(){
			var idx = $(this).prop("id");			
			goodsQuestion(godNum,idx);
		})
		
				$(document).on("click","#evaluationTable table tr button",function(){
					var tr = $(this).parents("tr").next();
					if($(this).hasClass("op") === true){
						$(this).removeClass("op");
						$(this).addClass("cl");
						var first = $(this).find(":first-child");
						first.text("보기 ");
						var span = $("<span></span>");
						span.addClass("glyphicon glyphicon-triangle-bottom")
						first.append(span);
						tr.addClass("none");
					}else{
						$(this).removeClass("cl");
						$(this).addClass("op");
						var first = $(this).find(":first-child");
						first.text("닫기 ");
						var span = $("<span></span>");
						span.addClass("glyphicon glyphicon-triangle-top")
						first.append(span);
						tr.removeClass("none");
					}
				});
		
				$(document).on("click","#orderitem #qnaTable tr button",function(){
					var next = $(this).parents("tr").next().next();
					if($(this).hasClass("op") === true){
						$(this).removeClass("op");
						$(this).addClass("cl");
						var first = $(this).find(":first-child");
						first.text("보기 ");
						var span = $("<span></span>");
						span.addClass("glyphicon glyphicon-triangle-bottom")
						first.append(span);
						
						next.addClass("none");
					}else{
						$(this).removeClass("cl");
						$(this).addClass("op");
						var first = $(this).find(":first-child");
						first.text("닫기 ");
						var span = $("<span></span>");
						span.addClass("glyphicon glyphicon-triangle-top")
						first.append(span);
						next.removeClass("none");
					}
				})
				
				$(document).on("click",".godrM",function(){
					var div = $(this).parents("div")[1];
					var id = $(div).prop("id");
					var content = $(div).find("div")[0];
					var satisLevel = $(this).siblings("input[name='satisLevel']").val();
					CKEDITOR.instances.GoodsReview.setData($(content).html());
					var grade = $("#grade input[name='grade']");
					var godrNum = $(this).siblings("input[name='godrNum']").val();
					$.each(grade,function(index,item){
						if($(item).val()==satisLevel){
							$(item).prop("checked",true);
						}
					})
					$("input[name='godr']").val(godrNum);
					$("input[name='currentNum']").val(id);
				})

				$(document).on("click","#godrComplete",function(){
					var grade = $("input[name='grade']:checked").val();
					var godrNum = $("input[name='godr']").val();
					var godrContent = CKEDITOR.instances.GoodsReview.getData();
		  			$.ajax({
						url:"modifyGoodsReview",
						method:"post",
						data: {
							grade:grade,
							godrNum:godrNum,
							godrContent:godrContent,
						},
						success:function(list){
							Swal.fire({
								  position: 'top',
								  type: 'success',
								  title: '수정되었습니다',
								  showConfirmButton: false,	
								  timer: 1500
								});
							var tr = $("." + $("input[name='currentNum']").val());
							var satis = $($(tr).find("td")[2]).find("span");
							var satisLevel = "";
							for(var i = 0 ; i < grade ; i++){
								satisLevel += "★";
							}
							satis.text(satisLevel);
							var div = $("#" + $("input[name='currentNum']").val()).find("div")[0];
							var content = godrContent;
							$(div).text("");
							$(div).html(content);
							content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"");
							if(content.length > 15){
								content = content.substring(0,15) + "...";
							}
							$($(tr).find("td")[1]).find("p").text(content);
						},
						error:function(a,b,errMsg){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: '수정에 실패하였습니다',
								  showConfirmButton: false,	
								  timer: 1500
								});
						}
					})
				})