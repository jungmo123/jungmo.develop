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

$(function(){
	var godc =$("#latelyGoods a");
	$.each(godc,function(index,item){
		var godcNum = $(item).prop("id");
		var number = "#"+$(item).prop("class");
		$.ajax({ 
			url:"getLatelyGoods",
			data:{
				godcNum:godcNum
			},
			method:"post",
			success:function(data){
				$.each(data,function(index,item){
				var current = $(number);
				var div = $("<div class = 'latelyGoods'></div>");
				div.attr("id",item.godNum);
				var div1 = $("<div></div>");
				var div2 = $("<div></div>");
				var img = $("<img></img>");
				var span = $("<span></span>");
				var br = $("<br>");
				var span1 = $("<span></span>");		
				img.attr("src","upload/"+item.godListImageUrl);
				div1.append(img);
				div.append(div1);
				span.text(item.godName);
				span1.text(comma(item.godSellingPrice));
				div2.append(span);
				div2.append(br);
				div2.append(span1);
				div.append(div2);
				$(number).append(div);
				})			
			},
			error:function(a,b,errMsg){
				console.log("실패");
			}
		})
	})
})

$(document).on("click",".latelyGoods",function(){
	var godNum = $(this).prop("id");
	location.href = "/shoppingmall/goodsDetail"+ godNum;
})

$(document).on("click",".newGoods",function(){
	var godNum = $(this).prop("id");
	location.href = "/shoppingmall/goodsDetail"+ godNum;
})
