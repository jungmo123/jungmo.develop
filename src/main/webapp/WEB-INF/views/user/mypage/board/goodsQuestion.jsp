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
<script src = "<c:url value = "/js/Navigation.js" />"></script>
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
	//공통 끝
hr {
	display: block;
	border-color: #BABABA;
	margin-top: 5px;
	margin-bottom: 5px;
	height: 1px;
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
.none{
	display:none;
}
	#pim .modal-header{
		border:0;
	}
	#pim .modal-body{
		padding:0px 15px 0px 15px;
	}
	#pim .modal-body textarea{
		resize: none;
	}
	#pim .modal-footer{
		border:0;
		text-align:center;
	}
	#pim .modal-title{
		font-weight:bold;
	}
	#pim hr{
		margin:5px;
	}
	.view{
		width:780px;
		height:120px;
	}
	.view > div:nth-child(1) > p{
		display:inline-block;
		width:38px;
		height:120px;
		line-height:125px;
		text-align:center;
		float:left;
		margin-bottom:0px;
	}
	.view > div:nth-child(1) div:nth-child(2){
		display:inline-block;
		width:90px;
		height:120px;
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
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:not(:nth-child(3)){
		height:40px;
		line-height:40px;
	}
	div > div:nth-child(1) div:nth-child(3) p:nth-child(2) span,
	div > div:nth-child(1) div:nth-child(3) p:nth-child(4) span{
		display:inline-block;
	}
	div > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:nth-child(1),
	div > div:nth-child(1) div:nth-child(3) p:nth-child(4) span:nth-child(1){
		width:300px;
		
	}
	div > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:nth-child(2),
	div > div:nth-child(1) div:nth-child(3) p:nth-child(4) span:nth-child(2){
		width:100px;
		text-align:center;
	}
	div > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:nth-child(3),
	div > div:nth-child(1) div:nth-child(3) p:nth-child(4) span:nth-child(3){
		width:75px;
		text-align:center;
	}
	.view > div:nth-child(1) div:nth-child(3){
		display:inline-block;
		width:490px;
		height:120px;
		float:left;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(1){
		height:20px;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:nth-child(3),
	.view div:nth-child(3) p:nth-child(4) span:nth-child(3){
		float:right;
	}
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(4){
		height:40px;
		line-height:20px;
		margin-top:10px;
	}
	.view > div:nth-child(1) div:nth-child(4){
		display:inline-block;
		width:150px;
		height:120px;
		line-height:150px;
		text-align:center;
		float:left;
	}
	img{
		width:90px;
		height:120px;
	}
	.top{
		margin-top:10px;
		height:100px;
		border-top:1px dotted grey;
		background-color:#F2F5F7;
	}
	.bottom{
		background-color:#F2F5F7;
	}
	.top  > span:first-child,
	.bottom > span:first-child{
		display:inline-block;
		width:100px;
		height:100px;
		line-height:100px;
		font-size:30px;
		color:#FF6F43;
		float:left;
		text-align:center;
	}
	.top > div{
		width:680px;
		display:inline-block;
		float:left;
		border-bottom: 1px dotted grey;
	}
	.top  > div span,
	.bottom > div span{
		display:inline-block;
		width:486px;
		height:100px;
		line-height:30px;
	}
	.top  > div > button,
	.bottom > div > button{
		float:right;
	    margin: 2px;
	    position: relative;
	    top: 55px;
	    right: 5px;
	}
	.open,
	.clo{
		background-color: white;
	    border: 0;
	    height:20px;
	    line-height:15px;
	}
	.none{
		display:none;
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
	.view hr{
		margin-bottom:5px;
		margin-top:5px;
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
							<a href = "goodsReview"><span>> 나의 상품평</span></a>
							<a href = "goodsQuestion" class= "activeMenu"><span>> 나의 상품 문의</span></a>
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
			<div id = "tableDiv">
				<strong>&#124;&nbsp;나의 상품 문의</strong>
				<div id="searchBar">
					<hr>
					<form id="delivery" action = "goodsQuestionSearch1" method = "post">
					<span>상품문의 검색</span>
					<select name = "godqType" class="form-control">
						<option value = "0">카테고리 전체</option>
						<c:forEach var = "cate" items = "${category}">
							<option value = "${cate.godcNum}">${cate.godcName}</option>
						</c:forEach>
					</select> <input type="text" class="form-control" name="godqSearch"
						placeholder="질문내용을 입력해 주세요." />
					<button class="btn btn-default">검색</button>
					</form>
					<hr>
				</div>
				<c:if test = "${godq[0] != null}">
				<c:set var = "idx" value = "1" />
					<c:if test = "${pageMaker.page.currentPage == 1}">
						<c:set var = "idx" value = "1" />
					</c:if>
					<c:if test = "${pageMaker.page.currentPage != 1}">
						<c:set var = "idx" value = "${(pageMaker.page.currentPage-1)*5+1}" />
					</c:if>
					<c:forEach var = "godq" items = "${godq}">
					<div class = "godq">
						<div class = "view">
							<div>
							<p id = "${godq.godqNum}">${idx}</p>
							<div>
								<img src = "..${godq.goods.godListImageUrl}"/>
							</div>
							<div>
								<p><span>${godq.goods.godc.godcName} > ${godq.goods.godName}</span><button class="form-control" onclick = "location.href = '../goodsDetail${godq.goods.godNum}'">제품보기</button></p>
								<p><span>Q.
									<c:if test = "${fn:length(godq.godqContent) > 15}" >
										<c:set var = "godqContent" value='${godq.godqContent.replaceAll("\\\<.*?\\\>"," ")}' />
										${fn:substring(godqContent,0,15)}...
									</c:if>
									<c:if test = "${fn:length(godq.godqContent) < 15}" >
										<c:out value='${godq.godqContent.replaceAll("\\\<.*?\\\>"," ")}' />
									</c:if>
								</span><span>${godq.userId}</span><span><fmt:formatDate value="${godq.godqWritingDate}" pattern="yyyy.MM.dd"/>
								<br><fmt:formatDate value="${godq.godqWritingDate}" pattern="kk:mm:ss"/></span></p>
								<hr>
								<p><span>A.
									<c:if test = "${fn:length(godq.goda.godaContent) < 15}" >
										<c:out value='${godq.goda.godaContent.replaceAll("\\\<.*?\\\>"," ")}' />
									</c:if>
									<c:if test = "${fn:length(godq.goda.godaContent) > 15}" >
										${fn:substring(godq.goda.godaContent,0,15)}...
									</c:if>
									<c:if test = "${fn:length(godq.goda.godaContent) == 0}" >
										등록된 답변이 없습니다.
									</c:if></span><span>${godq.goda.userId}</span>
								<span><fmt:formatDate value="${godq.goda.godaWritingDate}" pattern="yyyy.MM.dd"/>
								<br><fmt:formatDate value="${godq.goda.godaWritingDate}" pattern="kk:mm:ss"/></span></p>
							</div>
							<div>
								<button class = "open">
									<span>보기</span>
									<span class="glyphicon glyphicon-triangle-bottom"></span>
								</button></div>
							</div>
						</div>
						<div class = "none qa">
							<div class="top">
								<span>Q.</span>
									<div>
										<span>${godq.godqContent}</span>
										<button class="btn btn-default QuestionModify" data-toggle = "modal" data-target = "#pim">수정</button>
										<button class="btn btn-default QuestionDelete">삭제</button>
									</div>
								</div>
								<div class="bottom">
									<span>A.</span>
									<div>
										<span>
											<c:if test = "${fn:length(godq.goda.godaContent) != 0}" >
												${godq.goda.godaContent}
											</c:if>
											<c:if test = "${fn:length(godq.goda.godaContent) == 0}" >
												<c:out value = "등록된 답변이 없습니다." />
											</c:if>
										</span>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<c:set var = "idx" value = "${idx+1}" />
						</c:forEach>
						</c:if>
						<c:if test = "${godq[0] == null}">
							<div id = "noOrder">
								<p><span class = 'glyphicon glyphicon-info-sign'></span></p>
								<p><span>작성한 상품문의가 없습니다.</span></p>
							</div>							
						</c:if>
			 			<div id = "pagination">
							<div>
								<ul class = "pagination">
										<c:if test = "${pageMaker.prev}">
											<li><a href = "goodsQuestion${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
										</c:if>
										
										<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
											<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
												<a href = "goodsQuestion${type}${idx}">${idx}</a>
											</li>
										</c:forEach>
				
										<c:if test = "${pageMaker.next}">
											<li><a href = "goodsQuestion${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
										</c:if>
								</ul>
							</div>		
						</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id  ="pim">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;상품 문의 : 수정하기</h4>
					<hr>
				</div>
				<form id = "modalForm">
				<div class = "modal-body">
					<textarea id = "godqContent" class = "form-control" cols = "20" rows = "6" name = "godqContent"></textarea>
					<input id = "godqNum" type = "text"  name = "godqNum" style = "display:none"/>
					<input id = "godqType" type = "text" name = "godqType" value = "${type}"  style = "display:none"/>
					<input id = "idx" type = "text" name = "idx" value = "${pageMaker.page.currentPage}" style = "display:none" />
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default complete" data-dismiss = "modal">작성완료</button>
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
			 name:"godqNum"
		 })
		 num.val(godqNum);
		 var type = $("<input></input>");
		 type.attr({
			 type:"text",
			 name:"godqType"
		 })
		 type.val("${type}");
		 var idx = $("<input></input>");
		 idx.attr({
			 type:"text",
			 name:"idx"
		 })
		 idx.val("${pageMaker.page.currentPage}");
		 form.append(num);
		 form.append(type);
		 form.append(idx);
		 $("body").append(form);
		 form.submit();
	}
	
	$(document).on("click",".open",function(event){
			$(this).removeClass('open');
			$(this).addClass("clo");
			$(this).children("span:nth-child(1)").text("닫기");
			$(this).find(".glyphicon").removeClass("glyphicon-triangle-bottom");
			$(this).find(".glyphicon").addClass("glyphicon-triangle-top");
			$(this).parents(".godq").find(".qa").removeClass("none");
		})
		
		$(document).on("click",".clo",function(event){
			$(this).removeClass('clo');
			$(this).addClass("open");
			$(this).children("span:nth-child(1)").text("보기");
			$(this).find(".glyphicon").removeClass("glyphicon-triangle-top");
			$(this).find(".glyphicon").addClass("glyphicon-triangle-bottom");
			$(this).parents(".godq").find(".qa").addClass("none");
		})
		
		$(".QuestionModify").click(function(){
			var godqNum = $(this).parents(".godq").find(".view > div > p").prop("id");
			$("#modalForm").attr({
				action:"questionModify",
				method:"post"
			})
			$("#godqNum").val(godqNum);
		})
		
		$(".complete").click(function(){
				var Content = $("#godqContent").val();
				var lines = Content.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$("#godqContent").val(lines);
				$("#modalForm").submit();
		})
		
		$(".QuestionDelete").click(function(){
			var godqNum = $(this).parents(".godq").find(".view > div > p").prop("id");
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
						modifyForm(godqNum,"QuestionDelete");
				  }
				})			
		})
	</script>
</body>
</html>