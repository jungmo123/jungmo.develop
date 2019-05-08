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
	table tr td:nth-child(1){
		width:49px;
	}
	table tr td:nth-child(2){
		width:48px;
	}
	table tr td:nth-child(3){
		width:429px;
	}
	table tr td:nth-child(4){
		width:71px;
	}
	table tr td:nth-child(5){
		width:79px;
	}
	table tr td:nth-child(6){
		width:103px;
	}
	#write{
		float:right;
		width:80px;
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
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event"><span>이벤트</span></a>
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
			<form action = "oneTwoOneSearch1" method = "post">
			<div id = "searchBar">
				<div>
					<label for = "noCommentSearch">답변 없는 문의만 보기</label>
					<input type = "checkbox" id = "noCommentSearch"  name = "otoqType"/>			
					<select class = "form-control">
						<option>제목 + 내용</option>
					</select>
					<input type = "text" class = "form-control" name = "otoqSearch" />
					<button type = "submit" class = "btn btn-default">검색</button>
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
						<c:forEach  var = "post" items= "${posts}" varStatus = "state">
						<tr id = "${post.otoqNum}" class = "${post.otocNum}">
							<td>${post.otoqNum}</td>
							<td>${post.otocName}</td>
							<td>${post.otoqTitle}</td>
							<td>${post.userId}</td>
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
						</c:forEach>						
						</tbody>
						</table>
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

		location.href="/shoppingmall/admin/oneTwoOneRead" + otoqNum;
	})	
	</script>

</body>
</html>