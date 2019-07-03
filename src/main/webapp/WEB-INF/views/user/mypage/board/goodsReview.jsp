<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src = "<c:url value = "/js/MyNavigation.js" />"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#content > strong{
		font-size:20px;
	}
	#content > hr{
		margin:10px 0 10px 0;
	}
	#content{
		width:1100px;
	}
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:470px;
		border:1px solid grey;
		float:left;
	}
	#nav hr{
		margin:5px;
	}
	#nav #navTitle{
		width:100%;
		height:40px;
		text-align:center;
		font-weight:bold;
		padding:10px 5px 5px 5px;
		border-bottom:1px solid grey;
		background-color:#F2F5F7;
	}
	#nav #navContent{
		padding:5px;
	}
	#nav #navContent div{
		line-height:30px;
		margin-bottom: 10px;
	}
	#nav #navContent div > a{
		display:block;
		padding-left:10px;
		color:black;
	}
	#nav #navContent > p{
		font-weight:bold;
	}
	#navContent > a{
		color:black;
		font-weight:bold;
	}
	#nav #navContent div > .activeMenu{
		color:red !important;
	}
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
#searchBar {
	display: inline-block;
	width: 780px;
	text-align: center;
	margin-top: 10px;
}

#searchBar span {
	font-size: 16px;
	font-weight: bold;
	margin-right: 20px;
}
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
<!--모달-->
	.modal-body{
		height:460px;
	}
	.modal-footer{
		border:0;
		text-align:center;
	}
	#selectDiv{
		padding:10px 10px 0px 10px;
	}
	#selectDiv span{
		float:right;
	}
	#textBox{
		display:inline-block;
		width:565px;
		padding:5px 10px 10px 10px
	}
	#textBox div:first-child{
		height:30px;
		background-color:#F2F5F7;
		text-align:center;
		border:1px solid grey;
		border-bottom:0;
	}
	#textBox textarea{
		width:545px;
		height:150px;
		resize:none;
		border-color:grey;
		border-top:0;
	}
	#grade{
		width:568px;
		height:100px;
		padding:10px;
	}
	#grade > div{
		width:548px;
		height:70px;
		border:1px solid grey;
	}
	#grade div > div{
		display:inline-block;
	}
	#grade div > div:first-child{
		width:50px;
		float:left;
		text-align:center;
		position:relative;
		top:25px;
		margin-right:10px;
	}
	#grade div > div:last-child{
		position:relative;
		bottom:10px;
		width:490px;
		float:right;
	}
	#grade div > div:last-child p:first-child label{
		margin-right:30px;
	}
	#grade div > div:last-child p:last-child label{
		margin-right:104px;
	}
	#reference{
		padding:10px;
		line-height:25px;
	}
	form{
		display: inline-block;
	}
	#noOrder{
		border:0px;
		text-align:center;
		margin-top:50px
	}
	#noOrder p span{
		font-size:35px;
		color:#BABABA;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../../header/mypageHeader.jsp" %>
		<div id="content">
			<div id = "navbar">
				<div id="nav">
					<div id="navTitle">
						<span>마이 페이지</span>
					</div>
					<div id="navContent">
						<p>쇼핑 이용 정보</p>
						<hr>
						<div>
							<a href = "orderHistory1"><span>> 주문 내역</span></a>
							<a href = "cart"><span>> 장바구니</span></a>
							<a href = "pointLogs"><span>> 포인트 이용 내역</span></a>
						</div>
						<p>게시판 이용 내역</p>
						<hr>
						<div>
							<a href = "oneTwoOne"><span>> 1:1 문의</span></a>
							<a href = "goodsReview" class = "activeMenu"><span>> 나의 상품평</span></a>
							<a href = "goodsQuestion"><span>> 나의 상품 문의</span></a>
						</div>
						<p>개인정보 수정</p>
						<hr>
						<div>
						<a href = "personalData"><span>> 개인정보 수정</span></a>
						<a href = "passwordModify"><span>> 비밀번호 변경</span></a>
					</div>
					<a href = "unregister"><span>회원탈퇴</span></a>
					</div>
				</div>		
			</div>
			<div id= "tableDiv">
				<strong>&#124;&nbsp;나의 상품평</strong>
				<div id="searchBar">
					<hr>
					<span>상품평 검색</span>
					<form action = "goodsReviewSearch1" method = "post">
					<select class = "form-control" name = "godcNum">
						<option value = "0">카테고리 전체</option>
						<c:forEach var = "cate" items = "${category}">
							<option value = "${cate.godcNum}">${cate.godcName}</option>
						</c:forEach>
					</select>
					<input type="text" class="form-control" name="godrSearch"
						placeholder="상품명을 입력해 주세요." />
					<button class="btn btn-default">검색</button>
					</form>
					<hr>
				</div>
				<div	id = "product">
					<c:if test = "${posts[0] != null}">
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
							<button class = "godrM" class = "btn btn-default" data-toggle = "modal" data-target = "#godrModify">수정</button>
							<button class = "godrDelete" class = "btn btn-default">삭제</button>
							<input type = 'number' name = 'satisLevel' value = "${godr.satisLevel}" style = 'display:none'/>
							<input type = 'number' name = 'godrNum' value = "${godr.godrNum}" style = 'display:none'/>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
				<c:if test = "${posts[0] == null}">
					<div id = "noOrder">
						<p><span class = 'glyphicon glyphicon-info-sign'></span></p>
						<p><span>작성한 상품평이 없습니다.</span></p>
					</div>				
				</c:if>
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
	
	<div class = "modal fade" id = "godrModify">
		<div class = "modal-dialog modal-md">
			<div class = "modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">X</button>
					<strong>&#124;&nbsp;상품평 수정하기</strong>
					<span>Write Review</span>
				</div>
				<div class = "modal-body">
					<div id = "editor">
						<div id = "textBox">
							<div>
								<input type = 'number' name = 'currentNum' style = 'display:none'>
								<input type = 'number' name = 'godr' style = 'display:none'>
								<textarea id = "GoodsReview" name = "GoodsReview"></textarea>
							</div>
						</div>						
					</div>
					<div id = "grade">
						<div>
							<div>
								<span>평점</span>
							</div>
							<div>
								<p>
									<input type = 'radio' name = "grade" value = "5" />
									<label for = "wellContent">매우 만족 ☆☆☆☆☆</label>
									<input type = 'radio' name = "grade" value = "4" />
									<label for = "content"> 만족 ☆☆☆☆</label>
									<input type = 'radio' name = "grade" value = "3" />
									<label for = "normal">보통 ☆☆☆</label>
								</p>
								<p>
									<input type = 'radio' name = "grade" value = "2" />
									<label for = "highlyUnsatisfactory">불만 ☆☆</label>
									<input type = 'radio' name = "grade" value = "1 " />
									<label for = "unsatisfactory"> 매우 불만 ☆</label>
								</p>
							</div>						
						</div>
					</div>
					<div id = "reference">
						<strong>※ 참고하세요!</strong>
						<br>
						<span>- 상품평은 상품당 1회만 작성 할 수 있습니다.</span>
						<br>
						<span>- 작성한 상품평은 [마이 페이지 > 상품평]에서 수정할 수 있습니다..</span>
					</div>
				</div>
				<div class = "modal-footer">
					<button id = "godrComplete" class = "btn btn-default"  data-dismiss = "modal">작성 완료</button>
					<button class = "btn btn-default"  data-dismiss = "modal">작성 취소</button>
				</div>
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

	CKEDITOR.replace('GoodsReview',{
	        toolbar: 'Full',
	        uiColor: '#F2F5F7',
	    }
	);
	
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
							location.href = "goodsReview" + list;
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