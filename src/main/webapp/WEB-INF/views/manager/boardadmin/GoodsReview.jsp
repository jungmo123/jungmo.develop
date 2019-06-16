<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/AdminCss.css" />">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style>
	#productSearch{
		text-align:center;
		margin:10px 0px 20px 0px;
	}
	#productSearch input[type="text"]{
		display:inline;
		width:350px;
	}
	#productSearch select{
		display:inline-block;
		width:130px;
		position:relative;
		top:1px;		
	}
	#productSearch button{
		width:100px;
		position:relative;
		bottom:2px;
	}
	#productTable{
		margin-bottom:0;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
	}
	#pagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
	}
	.none{
		display:none;
	}
	.view{
		width:780px;
		height:140px;
		padding:10px;
	}
	.view > div:nth-child(1) > p{
		display:inline-block;
		width:38px;
		height:130px;
		line-height:150px;
		text-align:center;
		float:left;
		margin-bottom:0px;
	}
	.view > div:nth-child(1) div:nth-child(2){
		display:inline-block;
		width:90px;
		height:130px;
		margin:0px 10px 0px 0px;
		float:left;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(1) span{
		font-weight:bold;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(1) button{
		display: inline-block;
		width: 70px;
		padding: 0;
		height: 20px;
		font-size: 10px;
		font-weight: bold;
		margin-left: 10px;	
	}
	.view > div:nth-child(1) div:nth-child(3){
		display:inline-block;
		width:470px;
		height:130px;
		float:left;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(1),
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(2){
		height:20px;
	}
	.view > div:nth-child(1) div:nth-child(4){
		display:inline-block;
		width:150px;
		height:130px;
		line-height:150px;
		text-align:center;
		float:left;
	}
	img{
		width:90px;
		height:130px;
	}
	.review{
		margin-top:20px;
		border-top:1px dotted grey;
		border-bottom:1px dotted grey;
		background-color:#F2F5F7;
	}
	.review div{
		display:inline-block;
	}
	.review div:nth-child(1){
		width:673px;
		padding:20px 10px 20px 10px;
	}
	.review div:nth-child(2){
		float:right;
		padding:10px 10px 10px 0px;
	}
	.review div:nth-child(2) button{
		width:42px;
		height:22px;
		padding:0;
		font-size:12px;
		font-weight:bold;
	}
	.open,
	.clo{
		background-color: white;
	    border: 0;
	    height:20px;
	    line-height:15px;
	}
	.rv{
		margin-top:10px;
		border-top:1px solid #F2F5F7;
	}
	#cke_49{
		display:none;
	}
</style>
<body>

<div class="container">
		<div id="title">
			<div id="logo">
				<a href="main"><span>LALA&nbsp;</span>MARKET</a>
				<div id="Admin">
					<h5>Administrator</h5>
				</div>
			</div>
			<div>
				<span> <i class="far fa-edit"></i>
				</span> <span>게시판 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="styleshop"><span>스타일 숍 공지</span></a> 
				<a href="cic"><span>고객센터 공지</span></a> 
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview" class="activeMenu"><span>상품평</span></a> 
				<a href="event"><span>이벤트</span></a>
				<a href="boardCategory"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판 관리 > 상품평 목록</p>
			</div>
			<hr>
			<div id = "productSearch">
				<form action = "goodsReviewSearch1" method = "post">
					<select class = "form-control" name = "godcNum">
						<option value = "0">카테고리 전체</option>
						<c:forEach var = "cate" items = "${category}">
							<option value = "${cate.godcNum}">${cate.godcName}</option>
						</c:forEach>
					</select>
					<input type = "text" class = "form-control" name = "godrSearch" />
					<button type = "submit" class = "btn btn-default">검색</button>
				</form>
			</div>
			<div	id = "product">
				<c:forEach var = "godr" items = "${posts}" varStatus = "state">
				<div class = "rv">
					<div class = "view">
						<div>
							<p>${godr.godrNum}</p>
							<div>
								<img src = "../upload/${godr.godListImageUrl}"/>
							</div>
							<div>
								<p><span>${godr.godcName} > ${godr.godName}</span><button class="form-control" onclick = "location.href = '../goodsDetail${godr.godNum}'">제품보기</button></p>
								<p><span>
									<c:forEach begin = "1" end = "${godr.satisLevel}" step = "1">★</c:forEach>
								</span></p>
								<p>
									<c:if test = '${fn:length((godr.godrContent).replaceAll("\\\<.*?\\\>"," ")) > 15}' >
										<c:out value='${fn:substring((godr.godrContent).replaceAll("\\\<.*?\\\>"," "),0,15)}' />...
									</c:if>
									<c:if test = '${fn:length((godr.godrContent).replaceAll("\\\<.*?\\\>"," ")) < 15}' >
										<c:out value='${godr.godrContent.replaceAll("\\\<.*?\\\>","")}' />
									</c:if>
								<p>
									<span>${godr.userId}</span>
									<span>&#124;</span>
									<span><fmt:formatDate value = "${godr.godrWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
								</p>
							</div>
							<div>
								<button class = "open">
									<span>보기</span>
									<span class="glyphicon glyphicon-triangle-bottom"></span>
								</button>
							</div>
					</div>		
				</div>
				<div class = "review none">
					<div>${godr.godrContent}</div>
					<div>
						<button class = "godrModify" class = "btn btn-default" data-toggle = "modal" data-target = "#godrm">수정</button>
						<button class = "godrDelete" class = "btn btn-default">삭제</button>
					</div>
				</div>
			</div>
			</c:forEach>
			 	<div id = "pagination">
					<div>
						<ul class = "pagination">
								<c:if test = "${pageMaker.prev}">
									<li><a href = "goodsReview${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
								</c:if>
								
								<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
									<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
										<a href = "goodsReview${type}${idx}">${idx}</a>
									</li>
								</c:forEach>
				
								<c:if test = "${pageMaker.next}">
									<li><a href = "goodsReview${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
								</c:if>
							</ul>
						</div>		
					</div>
			</div>
		</div>
	</div>
</div>

	<div class = "modal fade" id  ="godrm">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;상품 문의 답변/수정하기</h4>
					<hr>
				</div>
				<form id = "modifyForm" method = "post">
					<div class = "modal-body">
						<textarea id = "WriteContent" class = "form-control" name = "WriteContent" style="width:660px; height:275px;"></textarea>
						<input id = "godrNum" type = "text"  name = "godrNum" style = "display:none"/>
						<input id = "godrType" type = "text" name = "godrType"  style = "display:none"/>
						<input id = "idx" type = "text" name = "idx" value = "${pageMaker.page.currentPage}" style = "display:none" />
					</div>
					<div class ="modal-footer">
						<button type = "submit" class = "btn btn-default">작성완료</button>
						<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<script type = "text/javascript">
var modifyForm = function(godqNum,action){
	 var form = $("<form></form>");
	 form.attr({
		 action:action,
		 method:"post"
	 })
	 var num = $("<input></input>");
	 num.attr({
		 type:"text",
		 name:"godrNum"
	 })
	 num.val(godqNum);
	 var type = $("<input></input>");
	 type.attr({
		 type:"text",
		 name:"godrType"
	 })
	 type.val("${type}");
	 var idx = $("<input></input>");
	 idx.attr({
		 type:"text",
		 name:"idx"
	 })
	 idx.val("${pageMaker.page.currentPage}");
	 if($(".rv").length == 1){
		 if($(form).prop("action") == 'http://localhost/shoppingmall/admin/godrDelete'){
			 if($(idx).val() != 1){
				 $(idx).val($(idx).val()-1);
			 }
		 }
	 }
	 form.append(num);
	 form.append(type);
	 form.append(idx);
	 $("body").append(form);
	 form.submit();
}

	CKEDITOR.replace('WriteContent',{
	        toolbar: 'Full',
	        uiColor: '#F2F5F7',
	    }
	);
	
    $(".godrModify").click(function(){
    	$("#modifyForm").attr({
    		action:"godrModify"
    	})
    	$("#godrNum").val($(this).parents(".rv").find(".view > div > p").text());
    	CKEDITOR.instances.WriteContent.setData($($(this).parents(".review").find("div")[0]).html());
    	$("#godrType").val("${type}");
    })

	$(".godrDelete").click(function(){
		var godrNum = $(this).parents(".rv").find(".view > div > p").text();
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  type: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.value) {
					modifyForm(godrNum,"godrDelete");
			  }
			})			
	})    
    
	$(document).on("click",".open",function(event){
		var clo = $(".clo");
		clo.removeClass('clo');
		clo.addClass('open');
		clo.children("span:nth-child(1)").text("보기");
		clo.find(".glyphicon").addClass("glyphicon-triangle-bottom");
		clo.find(".glyphicon").removeClass("glyphicon-triangle-top");
		$(".review").addClass("none");
		$(this).removeClass('open');
		$(this).addClass("clo");
		$(this).children("span:nth-child(1)").text("닫기");
		$(this).find(".glyphicon").removeClass("glyphicon-triangle-bottom");
		$(this).find(".glyphicon").addClass("glyphicon-triangle-top");
		$(this).parents(".rv").find(".review").removeClass("none");
	})
	
	$(document).on("click",".clo",function(event){
		$(".review").addClass("none");
		$(this).removeClass('clo');
		$(this).addClass("open");
		$(this).children("span:nth-child(1)").text("보기");
		$(this).find(".glyphicon").removeClass("glyphicon-triangle-top");
		$(this).find(".glyphicon").addClass("glyphicon-triangle-bottom");
		$(this).parents(".rv").find(".review").addClass("none");
})
</script>

</body>
</html>