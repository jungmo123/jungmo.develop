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
	#searchBar{
		text-align:center;
		margin-top:10px;
	}
	input[type="text"]{
		display:inline;
		width:250px;
	}
	select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	#table tr td:not(:nth-child(3)),
	#table tr th{
		text-align:center;
	}
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	table tr{
		border:1px solid #F2F5F7;
		cursor:pointer;
	}
	table tr th{
		background-color:#F2F5F7;
	}
	tbody tr:last-child{
		border-bottom:1px solid #878787;
	}
	#write{
		float:right;
		width:110px;
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
	#table tr td:nth-child(1){
		width:53px;
	}
	#table tr td:nth-child(2){
		width:88px;
	}
	#table tr td:nth-child(3){
		width:459px;
	}
	#table tr td:nth-child(4){
		width:88px;
	}
	#table tr td:nth-child(5){
		width:111px;
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
							<a href = "oneTwoOne" class= "activeMenu"><span>> 1:1 문의</span></a>
							<a href = "#"><span onclick = "location.href = '../BOARD/04.html'">> 나의 상품평</span></a>
							<a href = "#"><span onclick = "location.href = '../BOARD/05.html'">> 나의 상품 문의</span></a>
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
				<strong>&#124;&nbsp;1:1 문의</strong>
				<hr>
				<form id = "registerForm" action = "oneTwoOneSearch1" method = "post">
					<div id="searchBar">
						<select class="form-control">
							<option>제목 + 내용</option>
						</select>
						<input type="text" class="form-control" name="otoqContent" />
						<button class="btn btn-default">검색</button>
					</div>
				</form>
					<div>
						<table id="table" class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>질문 유형</th>
									<th>제목</th>
									<th>답변 여부</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "idx" value = "1" />
								<c:if test = "${pageMaker.page.currentPage == 1}">
									<c:set var = "idx" value = "1" />
								</c:if>
								<c:if test = "${pageMaker.page.currentPage != 1}">
									<c:set var = "idx" value = "${(pageMaker.page.currentPage-1)*5+1}" />
								</c:if>
								<c:forEach  var = "post" items= "${otoq}" varStatus = "state">
								<tr id = "${post.otoqNum}" class = "${post.otocNum}">
									<td>${idx}</td>
									<td>${post.otocName}</td>
									<td>${post.otoqTitle}</td>
									<td>
										<c:if test = "${post.otoa == null}">
											미답변
										</c:if>
										<c:if test = "${post.otoa != null}">
											답변완료
										</c:if>
									</td>
									<td>${post.otoqWritingDate}</td>
								</tr>
								<c:set var = "idx" value = "${idx+1}" />
								</c:forEach>
							</tbody>
						</table>
						<button id="write" class="btn btn-default" onclick="location.href='03.html'">1:1 문의하기</button>
					</div>
			 			<div id = "pagination">
							<div>
								<ul class = "pagination">
										<c:if test = "${pageMaker.prev}">
											<li><a href = "oneTwoOne${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
										</c:if>
										
										<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
											<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
												<a href = "oneTwoOne${type}${idx}">${idx}</a>
											</li>
										</c:forEach>
				
										<c:if test = "${pageMaker.next}">
											<li><a href = "oneTwoOne${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
										</c:if>
								</ul>
							</div>		
						</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	$("table tr").click(function(){
		var otoqNum = $(this).attr("id");
		location.href="/shoppingmall/mypage/oneTwoOneRead";
	})	
	</script>
</body>
</html>