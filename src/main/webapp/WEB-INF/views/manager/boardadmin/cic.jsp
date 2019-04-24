<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<style>
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
	table tr th,
	table tr td:nth-child(1),
	table tr td:nth-child(3){
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
		width:80px;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
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
				<a href="cic" class="activeMenu"><span>고객센터 공지</span></a> 
				<a href="05.html"><span>커뮤니티</span></a>
				<a href="08.html"><span>상품 문의</span></a> 
				<a href="09.html"><span>1:1문의</span></a> 
				<a href="11.html"><span>상품평</span></a> 
				<a href="12.html"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판 관리 > 공지사항</p>
			</div>
			<form>
			<div id = "searchBar">
				<select class = "form-control">
					<option>제목 + 내용</option>
				</select>
				<input type = "text" class = "form-control" name = "title" />
				<button type = "button" class = "btn btn-default">검색</button>
			</div>
			</form>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr onclick = "location.href='03.html'">
							<td><span class = "badge">중요</span></td>
							<td>폭설로 인한 배송 지연 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>10</td>
							<td>{제목표기}</td>
							<td>{작성일 표기</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>9</td>
							<td>택배사 물량 폭주로 배송 불가 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>8</td>
							<td>신용카드 무이자 할부 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>7</td>
							<td>신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>6</td>
							<td>오픈 숍 이용 시 주의사항 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>5</td>
							<td>신용카드 무이자 할부 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>4</td>
							<td>신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>3</td>
							<td>오픈 숍 이용 시 주의사항 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>2</td>
							<td>1월 신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='03.html'">
							<td>1</td>
							<td>게시글 제목이 표기 됩니다.</td>
							<td>2023-01-01</td>
						</tr>
					</tbody>
				</table>
				<button id = "write" class = "btn btn-default" onclick = "location.href='04.html'">글쓰기</button>
			</div>
			<div id = "pagination">
				<div>
					<a href = "#"><span class = "glyphicon glyphicon-chevron-left"></span></a>
					<a href = "#"  class = "currentPage">1</a>
					<a href = "#">2</a>
					<a href = "#">3</a>
					<a href = "#">4</a>
					<a href = "#">5</a>
					<a href = "#" ><span class = "glyphicon glyphicon-chevron-right"></span></a>
					<div id = "currentBar"></div>
				</div>		
			</div>
		</div>
	</div>
</div>

</body>
</html>