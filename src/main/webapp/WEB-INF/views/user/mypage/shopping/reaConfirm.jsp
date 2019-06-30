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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<style>
	body{
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;	
	}
	body .container .form-control{
		font-size:14px;
	}
	body .container .btn{
		border-color: #ccc;
	}
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container #title .btn-group-justified{
		 display: table;
	}
	.container #title .btn-group-justified button{
		 font-size:14px;
	}
	.container #title .btn-group-justified ul li{
		 font-size:14px;
		 width:160px;
	}
	.container #title .dropdown-toggle::after{
		display:none;
	}
	.container{
		width:1200px;
		max-width:1200px;
		margin-top:30px;
	}
	.contai
	#content > strong{
		font-size:20px;
	}
	#content > hr{
		margin:10px 0 10px 0;
	}
	#content{
		width:1100px;
	}
	#navbar{
		display: inline-block;
	    float: left;		
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
	#sArContent{
		padding:10px;
	}
	#firstTable{
		margin-top:10px;
		width:800px;
	}
	#firstTable td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	#firstTable tr td:nth-child(1){
		width:140px;
		text-align:right;
		border-right:1px solid grey;
	}
	#firstTable tr td:nth-child(1) strong{
		margin-right:10px;
	}
	#firstTable tr td:nth-child(2){
		padding:10px;
	}
	#firstTable tr td:nth-child(2) span label{
		margin-right:10px;
	}
	textarea{
		width:640px;
		height:130px;
		resize:none;
	}
	#buttonGroup button{
		float:right;
		font-size:14px;
	}
	.custom-file-label::after{
	    content: "찾아보기";
	}
	.custom-file-label{
		font-size:12px;
	}
	.custom-file{
	    display: inline-block;
	    width: 500px;
	    padding: 0 !important;
	    margin: 5px 0px 5px 10px;
	}
	.imagP button{
	 border:0px;
	 background-color:white;
	 color:black;
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
						<a href = "orderHistory1" class= "activeMenu"><span>> 주문 내역</span></a>
						<a href = "cart"><span>> 장바구니</span></a>
						<a href = "pointLogs"><span>> 포인트 이용 내역</span></a>
					</div>
					<p>게시판 이용 내역</p>
					<hr>
					<div>
						<a href = "oneTwoOne"><span>> 1:1 문의</span></a>
						<a href = "goodsReview"><span>> 나의 상품평</span></a>
						<a href = "goodsQuestion"><span>> 나의 상품 문의</span></a>
					</div>
					<p>개인정보 수정</p>
					<hr>
					<div>
						<a href = "#"><span onclick = "location.href = '../MYINFO/02.html'">> 개인정보 수정</span></a>
						<a href = "#"><span onclick = "location.href = '../MYINFO/03.html'">> 비밀번호 변경</span></a>
					</div>
					<a href = "#"><span onclick = "location.href = '../MYINFO/04.html'">회원탈퇴</span></a>
				</div>
			</div>		
		</div>
			<div id = "tableDiv">
				<strong>&#124;&nbsp;교환 환불 신청</strong>
				<div id="sAr">
					<hr>
					<div id = "sArContent">
						<table id = "firstTable">
							<tr>
								<td>						
									<strong>상품명</strong>
								</td>
								<td>
									<span>${ordName}</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>처리상태</strong>
								</td>
								<td>
									<span>${rea.reState}</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>사유</strong>
								</td>
								<td>
									<span>
										${rea.reaName}
									</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>내용</strong>
								</td>
								<td>
									<div style="white-space:pre;">${rea.reContent}</div>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>이미지</strong>
								</td>
								<td>
									<c:forEach var = "img" items = "${imgList.reaList}">
									<p class = "imagP"> <a href="../upload/${img.imageUrl}" download><button>${img.imageUrl}</button></a></p>
									</c:forEach>
								</td>
							</tr>
						</table>				
					</div>
					<div id = "buttonGroup">
						<button class = "btn btn-default"  onclick = "location.href='/shoppingmall/mypage/orderHistory1'">목록</button>		
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">

	</script>

</body>
</html>