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
	#pointTitle {
		display: inline-block;
		width: 780px;
		height: 120px;
		text-align: center;
	}

#pointTitle>p span strong {
	margin-left: 40px;
	font-size: 30px;
}

#pointTitle>p {
	margin-bottom: 20px;
}

#pointTitle>div>span {
	margin: 0 10px 0 10px;
}

#input1, #input2 {
	display: inline-block;
}

#input1 input, #input2 input {
	border: 1px solid #c4c4c4;
	border-radius: 5px;
	background-color: #fff;
	padding: 3px 5px;
	box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);
	width: 120px;
}

[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}

#pointTitle button {
	padding: 0;
	width: 70px;
	height: 28px;
	position: relative;
	bottom: 2px;
	font-weight: bold;
	margin-left: 10px;
}

#pointTable {
	display: inline-block;
	width: 780px;
	padding: 10px;
}

#table {
	margin: 10px 0 0 0;
	border-top: 1px solid #878787;
	border-bottom: 1px solid #878787;
	border-top: 1px solid #878787;
}

#table thead tr:nth-child(1) {
	background-color: #F2F5F7;
}

#table thead tr {
	height: 50px;
}

#table thead tr th {
	padding-top: 0;
	padding-bottom: 15px;
}

#table tbody tr {
	height: 50px;
}

#table tbody tr td span {
	position: relative;
	top: 5px;
}

#table tr th, #table tr td {
	text-align: center;
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
							<a href = "pointLogs" class= "activeMenu"><span>> 포인트 이용 내역</span></a>
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
						<a href = "personalData"><span>> 개인정보 수정</span></a>
						<a href = "passwordModify"><span>> 비밀번호 변경</span></a>
					</div>
					<a href = "unregister"><span>회원탈퇴</span></a>
					</div>
				</div>
				<div id = "tableDiv">
					<strong>&#124;&nbsp;포인트 이용 내역</strong>
					<hr>
					<div id="pointTitle">
						<p>
							<span>보유 포인트<strong><fmt:formatNumber value="${totalPoint}" pattern="#,###" /></strong>원</span>
						</p>
						<form id = "registerForm" action = "pointLogsSearch1" method = "post">
						<div>
							<div id="input1">
								<input type="date" name="date1" class="dateInput">
							</div>
							<span>~</span>
							<div id="input2">
								<input type="date" name="date2" class="dateInput">
							</div>
							<button class="btn btn-default">조회</button>
						</div>
						</form>
					</div>
					<div id="pointTable">
						<c:if test = "${pointLogs[0] != null}">
						<table id="table" class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>날짜</th>
									<th>내용</th>
									<th>포인트 변동</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var = "pointLog" items = "${pointLogs}" varStatus = "state">
								<tr>
									<td><span>${state.index+1}</span></td>
									<td><span>${pointLog.userid}</span></td>
									<td><span><fmt:formatDate value = "${pointLog.polgDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
									<td><span>${pointLog.polgContent}</span></td>
									<td><span>${pointLog.polgChange}</span></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</c:if>
						<c:if test = "${pointLogs[0] == null}">
							<div id = "noOrder">
								<p><span class = 'glyphicon glyphicon-info-sign'></span></p>
								<p><span>검색 결과가 없습니다</span></p>
							</div>							
						</c:if>
					</div>
					<div id = "pagination">
						<div>
							<ul class = "pagination">
								<c:if test = "${pageMaker.prev}">
									<li><a href = "pointLogs${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
								</c:if>
													
								<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
									<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
										<a href = "pointLogs${type}${idx}">${idx}</a>
									</li>
								</c:forEach>
							
								<c:if test = "${pageMaker.next}">
									<li><a href = "pointLogs${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
								</c:if>
						</ul>
					</div>		
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>