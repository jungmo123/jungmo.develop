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
	table tr th:nth-child(1),
	table tr td:nth-child(1),
	table tr th:nth-child(2),
	table tr td:nth-child(2),
	table tr th:nth-child(3),
	table tr th:nth-child(4),
	table tr td:nth-child(4),
	table tr th:nth-child(5),
	table tr td:nth-child(5),
	table tr th:nth-child(6),
	table tr td:nth-child(6){
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
				<a href="cic"><span>고객센터 공지</span></a> 
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne" class="activeMenu"><span>1:1문의</span></a> 
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
				<p id = "currentIdx">&#124; 게시판 관리 > 1:1 문의 목록</p>
			</div>
			<form>
			<div id = "searchBar">
				<div>
					<label for = "noCommentSearch">답변 없는 문의만 보기</label>
					<input type = "checkbox" id = "noCommentSearch" />			
					<select class = "form-control">
						<option>제목 + 내용</option>
					</select>
					<input type = "text" class = "form-control" name = "title" />
					<button type = "button" class = "btn btn-default">검색</button>
				</div>
			</div>
			</form>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>답변여부</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr onclick = "location.href='10.html'">
							<td>10</td>
							<td>판매</td>
							<td>판매자님께 문의 드립니다.</td>
							<td>like10</td>
							<td>미답변</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>9</td>
							<td>결제</td>
							<td>모바일에서 결제는 주문이 되었다고 했는데요.</td>
							<td>like9</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>8</td>
							<td>입금</td>
							<td>오픈 숍에서 구매는 입금은 어떻게 하면 되나요</td>
							<td>like8</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>7</td>
							<td>입금</td>
							<td>상품평을 등록 하려고 하는데,주문내용을 확인할 수 ...</td>
							<td>like7</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>6</td>
							<td>판매</td>
							<td>주문 취소 했는데 결제한 카드는 언제 취소되나요?</td>
							<td>like6</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>5</td>
							<td>결제</td>
							<td>구매 했는데 적립금이 적립이 안되었어요!</td>
							<td>like5</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>4</td>
							<td>기타</td>
							<td>포인트는 어떻게 사용하나요?</td>
							<td>like4</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>3</td>
							<td>배송</td>
							<td>제주도인데 배송이 되나요?</td>
							<td>like3</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>2</td>
							<td>환불</td>
							<td>옷이 사진과 많이 다른데 환불이 가능한가요?</td>
							<td>like2</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
						<tr onclick = "location.href='10.html'">
							<td>1</td>
							<td>판매</td>
							<td>관리자님께 문의 드립니다.</td>
							<td>like1</td>
							<td>답변완료</td>
							<td>2023-01-01</td>
						</tr>
					</tbody>
				</table>
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