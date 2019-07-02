function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}

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

function getGoods(data){
		if(data.god == 0){
			var trr = $("<tr></tr>");
			var tdd = $("<td id = 'noProduct'></td>");
			var spann = $("<p><span class = 'glyphicon glyphicon-info-sign'></span></p>");
			var spann2 = $("<p><span>검색된 상품이 없습니다.</span></p>");
			tdd.append(spann);
			tdd.append(spann2);
			trr.append(tdd);
			$("#godTable").append(trr);
		}else{
			$("#godTable").text("");
			$("#godPagination").text("");
			$.each(data.god,function(index,item){
				var tr = $("<tr></tr>");
				tr.attr("class",item.godNum);
				var td1 = $("<td></td>");
				var div1 = $("<div></div>");
				var img = $("<img></img>");
				img.attr("src","upload/"+item.godListImageUrl);
				div1.append(img);
				td1.append(div1);
				var td2 = $("<td></td>");
				var div2 = $("<div></div>");
				var div3 = $("<div></div>");
				var div4 = $("<div></div>");
				var span1 = $("<span></span>");
				var strong1 = $("<strong></strong>");
				strong1.text(item.godName);
				span1.text(item.godIntroduce);
				div3.append(strong1);
				div4.append(span1);
				div2.append(div3);
				div2.append(div4);
				td2.append(div2);
				var td3 = $("<td></td>");
				var div5 = $("<div></div>");
				var strong2 = $("<strong></strong>");
				strong2.text(comma(item.godSellingPrice)+"원");
				div5.append(strong2);
				td3.append(div5);
				tr.append(td1);
				tr.append(td2);
				tr.append(td3);
				$("#godTable").append(tr);
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
			$("#godPagination").append(div);
		}		
	}

function getSGoodsReview(Search,idx){
	$.ajax({
		url:"getSGoodsReviews",
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

function getSGoods(Search,idx){
		$.ajax({
			url:"getSGoods",
			method:"post",
			data: {
				Search:Search,
				idx:idx
			},
			success:function(data){
				getGoods(data);
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

function getSPosts(Search,idx){
	$.ajax({
		url:"getSPosts",
		method:"post",
		data: {
			Search:Search,
			idx:idx
		},
		success:function(data){
			getPosts(data);
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

function getGoodsReviews(data){
	if(data.godr == 0){
		var trr = $("<tr></tr>");
		var tdd = $("<td id = 'noReview'></td>");
		var spann = $("<p><span class = 'glyphicon glyphicon-info-sign'></span></p>");
		var spann2 = $("<p><span>검색된 리뷰가 없습니다</span></p>");
		tdd.append(spann);
		tdd.append(spann2);
		trr.append(tdd);
		$("#godrTable").append(trr);
	}else{
		$("#godrTable").text("");
		$("#godrPagination").text("");
		var idx;
		if(data.pageMaker.currentPage == 1){
			idx = 1;
		}else{
			idx = (data.pageMaker.currentPage-1)*5+1;
		}
		$.each(data.godr,function(index,item){
			var tr = $("<tr class = 'product'></tr>");
			tr.attr("class",idx);
			var td1 = $("<td></td>");
			var span1 = $("<span class = 'number'></span>");
			span1.text(idx);
			td1.append(span1);
			var td2 = $("<td></td>");
			var div1 = $("<div></div>");
			var span2 = $("<span></span>");
			var span99 = $("<span></span>");
			var span98 = $("<span>&nbsp;&#124;&nbsp;</span>");
			span99.text(item.godName);
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
			div1.append(span99);
			div1.append(span98);
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
			div4.append(div5);
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

function getPosts(data){
	if(data.posts == 0){
		var trr = $("<tr></tr>");
		var tdd = $("<td id = 'noPosts'></td>");
		var spann = $("<p><span class = 'glyphicon glyphicon-info-sign'></span></p>");
		var spann2 = $("<p><span>검색된 게시글이 없습니다</span></p>");
		tdd.append(spann);
		tdd.append(spann2);
		trr.append(tdd);
		$("#postsTable").append(trr);
	}else{
		$("#postsTable").text("");
		$("#postsPagination").text("");
		$.each(data.posts,function(index,item){
			var tr = $("<tr></tr>");
			var td = $("<td></td>");
			var div1 = $("<div></div>");
			var div2 = $("<div></div>");
			var span1 = $("<span></span>");
			var span2 = $("<span></span>");
			var span3 = $("<span></span>");
			span1.text(item.borTitle);
			span2.text(" : "+item.posTitle);
			span3.text(item.posWritingDate);
			var text = item.posContent.replace(/<\p\>/ig, "\n"); 
			text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
			if(text.length > 130){
				text = text.substring(0,130) + "...";
			}
			div2.text(text);
			div1.append(span1);
			div1.append(span2);
			div1.append(span3);
			td.append(div1);
			td.append(div2);
			tr.append(td);
			$("#postsTable").append(tr);
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
		div.append(ul);
		$("#postsPagination").append(div);
	}
}

	$(function(){
		getSGoods(Search,"1");
		getSGoodsReview(Search,"1");
		getSPosts(Search,"1");
	})

		$(document).on("click","#godPagination .pagination > li > a",function(){
			var idx = $(this).prop("id");			
			getSGoods(Search,idx);
		})
		
		$(document).on("click","#godrPagination .pagination > li > a",function(){
			var idx = $(this).prop("id");			
			getSGoodsReview(Search,idx);
		})
		
		$(document).on("click","#postsPagination .pagination > li > a",function(){
			var idx = $(this).prop("id");			
			getSPosts(Search,idx);
		})
		
				$(document).on("click","#productReview table tr .tableButton",function(){
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
		
		$(document).on("click",".product",function(){
			var godNum = $(this).prop("class");
			location.href = "/shoppingmall/goodsDetail"+godNum;
		})