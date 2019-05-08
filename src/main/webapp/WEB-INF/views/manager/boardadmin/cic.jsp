<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	table tr td:nth-child(1){
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
	table tr td:nth-child(3){
		text-align:right;;
		padding-right:20px;
	}
	table tr th:nth-child(3){
		text-align:right;;
		padding-right:60px;
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

<div class="container" id = "${type}">
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
				<a href=community><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
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
				<p id = "currentIdx">&#124; 게시판 관리 > 공지사항</p>
			</div>
			<form id = "searchForm" action = "cicSearch1" method = "post">
			<div id = "searchBar">
				<select id = "cicCategory" class = "form-control" name = "searchCategory">
					<option value = "0">카테고리 선택</option>
					<c:forEach var = "cicCategory" items = "${categories}" varStatus = "state">
						<option value = "${cicCategory.poscNum}">${cicCategory.poscName}</option>
					</c:forEach> 
				</select>
				<select id = "cicSearch" class = "form-control" name = "searchType">
					<option value = "1">제목 + 내용</option>
				</select>
				<input id = "searchContent" type = "text" name = "searchContent" class = "form-control" />
				<button type = "submit" class = "btn btn-default">검색</button>
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
						<c:forEach  var = "post" items= "${posts}" varStatus = "state">
						<tr id = "${post.posNum}" class = "${post.poscNum}">
							<td>
								<c:choose>
								<c:when test = "${post.posImportance=='Y'}">
									<span class = "badge">중요</span>
								</c:when>
								<c:otherwise>
									<span>${post.posNum}</span>
								</c:otherwise>
								</c:choose>
							</td>
							<td>${post.posTitle}</td>
							<td><fmt:formatDate value = "${post.posWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></td>
						</tr> 
						</c:forEach>
					</tbody>
				</table>
				<a href = "cicWrite" id = "write" class = "btn btn-default">글쓰기</a>
			</div>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "${type != 'Search'}">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "cic${type}I${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
							
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "cic${type}I${idx}">${idx}</a>
								</li>
							</c:forEach>
	
							<c:if test = "${pageMaker.next}">
								<li><a href = "cic${type}I${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
						</c:if>
						
						<c:if test = "${type == 'Search'}">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "cic${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
							
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "cic${type}${idx}">${idx}</a>
								</li>
							</c:forEach>
	
							<c:if test = "${pageMaker.next}">
								<li><a href = "cic${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
						</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	$("table tr").click(function(){
		console.log("클릭");
		var result = new Array();
 		var category = $("body .container:nth-child(1)").attr("id"); 
		var posNum = $(this).attr("id");
		var poscNum = $(this).attr("class");
		
		if(category == 'Search'){
			category = 0;
		}
		
		result.push(category);   
		result.push(poscNum);
		result.push(posNum);
		result = result.join('I');
		location.href="/shoppingmall/admin/cicRead" + result;
	})
</script>

</body>
</html>