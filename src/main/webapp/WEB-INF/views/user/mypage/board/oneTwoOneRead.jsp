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
	.Dtitle{
		font-weight:bold;
		position:relative;
		left:15px;
	}
	.Dtitle span{
		position:relative;
		bottom:5px;
	}
	#requestContent,#responseContent{
		line-height:25px;
		padding-left:15px;
		margin-bottom:10px;
	}
	#requestTitle hr,#responseTitle hr,#footerDiv hr{
		margin:15px 0px 15px 0px;
	}
	#requestTitle strong,#responseTitle strong{
		font-size:30px;
		color:#FF6F43;
		margin-right:20px;
	}
	#requestTitle div,#responseTitle div{
		display:inline-block;
	}
	.Titleinfo{
		float:right;
		font-weight:bold;
		position:relative;
		right:15px;
		top:10px;
	}
	.buttonBox{
		width:100%;
		height:100px;
	}
	.buttonBox button{
		display:inline-block;
		position:relative;
		top:75px;
		width:50px;
		height:25px;
		padding:0;
		margin-right:5px;
		float:right;
	}
	#addAnser{
		display:inline-block;
		position:relative;
		top:75px;
		width:80px;
		height:25px;
		padding:0;
		margin-right:5px;
		float:right;		
	}
	.glyphicon::before{
		position:relative;
		top:2px;
	}
	#footerDiv button{
		float:right;
	}
	#otom .modal-header{
		border:0;
	}
	#otom .modal-body{
		padding:0px 15px 0px 15px;
	}
	#otom .modal-body textarea{
		resize: none;
	}
	#otom .modal-footer{
		border:0;
		text-align:center;
	}
	#otom .modal-title{
		font-weight:bold;
	}
	#otom hr{
		margin:5px;
	}
	.modal-content{
		width:600px;
	}
	.modal-body div:first-child{
		width:100%;
		border-top:1px solid lightgrey;
		border-left:1px solid lightgrey;
		border-right:1px solid lightgrey;
		text-align:center;
		line-height:30px;
	}
	#cke_49{
		display:none;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/mypageHeader.jsp" %>
		<div id = "content">
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
							<a href = "oneTwoOne" class = "activeMenu"><span>> 1:1 문의</span></a>
							<a href = "goodsReview"><span>> 나의 상품평</span></a>
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
			<div id = "tableDiv">
				<strong>&#124;&nbsp;1:1 문의</strong>
					<div id = "requestTitle">
						<hr>
						<span class = "Dtitle"><strong>Q</strong><span>[${oto.otocName}] ${oto.otoqTitle}</span></span>
						<div class = "Titleinfo">
							<span class = "Did">${oto.userId}</span>
							<span>&#124;</span>
							<span class = "Ddate"><fmt:formatDate value = "${oto.otoqWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
						</div>
						<hr>
					</div>
					<div id = "requestContent">
							${oto.otoqContent}
						<div class = "buttonBox">
							<button id = "questionModify" class = "form-control">수정</button>
							<button class = "form-control">삭제</button>
						</div>
					</div>
					<div id = "responseTitle">
						<hr>
						<c:if test = "${oto.otoa == null}">
						<span class = "Dtitle"><strong>A</strong><span>답변 준비중</span></span>
						<div class = "Titleinfo">
							<span class = "Did"></span>
							<span></span>
							<span class = "Ddate"></span>
						</div>
						</c:if>
						<c:if test = "${oto.otoa != null}">
						<span class = "Dtitle"><strong>A</strong><span>답변 완료</span></span>
						<div class = "Titleinfo">
							<span class = "Did">${oto.otoa.userId}</span>
							<span>&#124;</span>
							<span class = "Ddate"><fmt:formatDate value = "${oto.otoa.otoaWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
						</div>
						</c:if>
						<hr>
					</div>
					<div id = "responseContent">
					<c:if test = "${oto.otoa == null}">
						답변을 준비 중입니다.
						신속한 답변을 원하신다면 고객센터로 문의해 주세요.<br>
						<span class = "glyphicon glyphicon-triangle-right">고객센터 : 070-0000-0000</span>
					</c:if>
					<c:if test = "${oto.otoa != null}">
						${oto.otoa.otoaContent}
					</c:if>
					</div>
					<div id = "footerDiv">
						<hr>
						<button class = "btn btn-default left" onclick = "location.href = '/shoppingmall/admin/OtoIndex'">목록 보기</button>
					</div>
				</div>
		</div>
	</div>
	
<script type="text/javascript">
var otoqNum = "${oto.otoqNum}"
var otoqTitle = "${oto.otoqTitle}"
var otoqContent = "${fn:trim(oto.otoqContent)}"
var otocNum = "${oto.otocNum}"
    
    $("#questionModify").click(function(){
    	var form = $("<form action = 'otoqModify' method = 'post' style = 'display:none'></form>");
    	var input1 = $("<input type = 'text' name = 'otoqNum'></input>");
    	var input2 = $("<input type = 'text' name = 'otocNum'></input>");
    	var input3 = $("<input type = 'text' name = 'otoqTitle'></input>");
    	var input4 = $("<input type = 'text' name = 'otoqContent'></input>");
    	input1.val(otoqNum);
    	input2.val(otocNum);
    	input3.val(otoqTitle);
    	input4.val(otoqContent);
    	form.append(input1);
    	form.append(input2);
    	form.append(input3);
    	form.append(input4);
    	$("body").append(form);
    	form.submit();
    })
</script>
</body>
</html>