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
<script type="text/javascript" src= "../editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<style>
#orderitem {
	margin-bottom: 10px;
}

#orderitem table {
	width: 100%;
	text-align: center;
}

#orderitem table tr:not (.commentBox ){
	border-top: 1px solid #BABABA;
	height: 30px;
}

#orderitem table th {
	text-align: center;
	margin-left: 10px;
}

.br {
	margin-top: 10px;
}

select {
	width: 80px;
}

table tr td:nth-child(1), table tr td:nth-child(2) {
	width: 100px;
	line-height: 28px;
}

table tr td:nth-child(3) {
	width: 500px;
	height: 140px;
}

table tr td:nth-child(4) {
	width: 400px;
}

table tr td:nth-child(3) div {
	width: 100%;
	display: inline-block;
	text-align: left;
}

table tr td:nth-child(3) hr {
	width: 480px;
	float: left;
}

table tr td:nth-child(4) button {
	background-color: white;
	border: 0;
}

table tr td:nth-child(3) div:nth-child(1) div {
	width: 100%;
}

table tr td:nth-child(3) div:nth-child(2) div:nth-child(1), table tr td:nth-child(3) div:nth-child(4) div:nth-child(1)
	{
	width: 300px;
	display: inline-block;
	position: relative;
	bottom: 5px;
}

table tr td:nth-child(3) div:nth-child(2) div:nth-child(2), table tr td:nth-child(3) div:nth-child(4) div:nth-child(2)
	{
	width: 100px;
	display: inline-block;
	position: relative;
	bottom: 5px;
	text-align: center;
}

table tr td:nth-child(3) div:nth-child(4) div:nth-child(1) {
	width: 300px;
	display: inline-block;
}

table tr td:nth-child(3) div:nth-child(4) div:nth-child(2) {
	width: 100px;
	display: inline-block;
}

table tr td:nth-child(3) div:nth-child(4) div:nth-child(3), table tr td:nth-child(3) div:nth-child(2) div:nth-child(3)
	{
	width: 75px;
	display: inline-block;
	text-align: center;
}

table tr td:nth-child(3) button {
	display: inline-block;
	width: 70px;
	padding: 0;
	height: 20px;
	font-size: 10px;
	font-weight: bold;
	margin-left: 10px;
}

table tr td:nth-child(3) strong {
	margin-right: 5px;
}

table tr:nth-child(3) {
	background-color: #F2F5F7;
}

table tr:nth-child(3) td:nth-child(1) div {
	height: 150px;
}

table tr:nth-child(3) td:nth-child(2) div {
	height: 150px;
	text-align: left;
}

table tr:nth-child(3) td:nth-child(1) div span {
	font-size: 30px;
	position: relative;
	top: 30px;
}

table tr:nth-child(3) td:nth-child(2) div span {
	position: relative;
	top: 20px;
}

table tr:nth-child(3) td>div:nth-child(1) {
	border-top: 3px dotted #BABABA;
}

table tr:nth-child(3) td:nth-child(2)>div:nth-child(2) {
	margin-top: 3px;
	border-top: 3px dotted #BABABA;
}

table tr:nth-child(3) td:nth-child(1)>div:nth-child(2) {
	margin-top: 3px;
}

.questContent {
	float: left;
	margin-right: 5px;
}

.image {
	width: 80px;
	height: 100px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}

#delivery {
	text-align: center;
	margin: 20px 0px 20px 0px;
}

#delivery div:nth-child(1), #delivery div:nth-child(2) {
	display: inline-block;
}

#delivery div:nth-child(2) input {
	width: 400px;
	display: inline-block;
}

#delivery div:nth-child(2) button {
	width: 80px;
	display: inline-block;
}

.top button, .bottom button {
	float: right;
	margin: 2px;
	position: relative;
	top: 105px;
	right: 5px;
}

.spanDiv {
	display: inline-block;
	width: 60%;
}

#inquiryRegistration div {
	margin-top: 5px;
}

#inquiryRegistration div select {
	display: inline-block;
	width: 120px;
	font-size: 12px;
}

#inquiryRegistration div input:nth-child(2) {
	display: inline-block;
	width: 250px;
	margin-left: 2px;
	font-size: 12px;
}

#inquiryRegistration div input:nth-child(3) {
	display: inline-block;
	width: 100px;
	margin-left: 5px;
	font-size: 12px;
}

#inquiryRegistration>div:nth-child(3) {
	width: 800px;
	height: 65px;
}

#inquiryRegistration>div:nth-child(3)>div:first-child {
	display: inline-block;
	width: 490px;
	float: left;
}

#inquiryRegistration>div:nth-child(3)>div:last-child {
	display: inline-block;
	width: 100px;
	float: left;
}

#inquiryRegistration>div:nth-child(3)>div:last-child button {
	width: 100px;
	height: 61px;
}

#inquiryRegistration div textarea {
	width: 483px;
	height: 60px;
	resize: none;
}

#inquiryRegistration div:last-child span {
	position: relative;
	left: 400px;
	color: grey;
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
		height:140px;
	}
	.view > div:nth-child(1) > p{
		display:inline-block;
		width:38px;
		height:140px;
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
	.view > div:nth-child(1) div:nth-child(3) p:nth-child(2) span:not(:nth-child(3)){
		h+eight:40px;
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
		height:140px;
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
		height:140px;
		line-height:150px;
		text-align:center;
		float:left;
	}
	img{
		width:90px;
		height:140px;
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
</style>
</head>
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
				<a href="goodsQuestion" class="activeMenu"><span>상품 문의</span></a> 
				<a href="09.html"><span>1:1문의</span></a> 
				<a href="11.html"><span>상품평</span></a> 
				<a href="12.html"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
			<div id="AllContent">
				<div id="menuBar">
					<p id="menuName">Board Managament</p>
					<p id="currentIdx">&#124; 게시판 관리 > 상품 문의 목록</p>
				</div>
				<hr>
				<form id="delivery">
					<div>
						<label for="noCommentSearch">답변 없는 문의만 보기</label> <input
							type="checkbox" id="noCommentSearch" />
					</div>
					<div>
						<input class="form-control" type="text" name="orderSearch" />
						<button class="form-control" type="submit">검색</button>
					</div>
				</form>
					<c:forEach var = "godq" items = "${godq}">
					<div class = "godq">
						<div class = "view">
							<div>
							<p>${godq.godqNum}</p>
							<div>
								<img src = "..${godq.goods.godListImageUrl}"/>
							</div>
							<div>
								<p><span>${godq.goods.godc.godcName} > ${godq.goods.godName}</span><button class="form-control">제품보기</button></p>
								<p><span>Q.
									<c:if test = "${fn:length(godq.godqContent) > 15}" >
										<c:out value = "${fn:substring(godq.godqContent,0,15)}..." />
									</c:if>
									<c:if test = "${fn:length(godq.godqContent) < 15}" >
										<c:out value = "${godq.godqContent}" />
									</c:if>
								</span><span>${godq.userId}</span><span><fmt:formatDate value="${godq.godqWritingDate}" pattern="yyyy.MM.dd"/>
								<br><fmt:formatDate value="${godq.godqWritingDate}" pattern="kk:mm:ss"/></span></p>
								<hr>
								<p><span>A.
									<c:if test = "${fn:length(godq.goda.godaContent) < 15}" >
										<c:out value = "${godq.goda.godaContent}" />
									</c:if>
									<c:if test = "${fn:length(godq.goda.godaContent) > 15}" >
										<c:out value = "${fn:substring(godq.goda.godaContent,0,15)}..." />
									</c:if>
									<c:if test = "${fn:length(godq.goda.godaContent) == 0}" >
										<c:out value = "등록된 답변이 없습니다." />
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
										<button class="btn btn-default" data-toggle = "modal" data-target = "#pim">수정</button>
										<button class="btn btn-default">삭제</button>
									</div>
								</div>
								<div class="bottom">
									<span>A.</span>
									<div>
										<span>
											<c:if test = "${fn:length(godq.goda.godaContent) != 0}" >
												<c:out value = "${godq.goda.godaContent}" />
											</c:if>
											<c:if test = "${fn:length(godq.goda.godaContent) == 0}" >
												<c:out value = "등록된 답변이 없습니다." />
											</c:if>
										</span>
									<button class="btn btn-default">수정</button>
									<button class="btn btn-default">삭제</button>
									<c:if test = "${godq.goda == ''  || godq.goda eq null}">
										<button class="btn btn-default" data-toggle = "modal" data-target = "#pim">답변하기</button>
									</c:if>
									</div>
								</div>
							</div>
						</div>
						<hr>
						</c:forEach>
					</div>
			</div>
		</div>
	
	<div class = "modal fade" id  ="pim">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;상품 문의 답변/수정하기</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<textarea class = "form-control" cols = "20" rows = "6" name = "modifyComment"></textarea>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성완료</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
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
	</script>

</body>
</html>