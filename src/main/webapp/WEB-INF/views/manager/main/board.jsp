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
	table tr th:nth-child(3),
	table tr td:nth-child(3),
	table tr th:nth-child(4),
	table tr td:nth-child(4){
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
		width:80px;
	}
	table tr td:nth-child(3){
		width:100px;
	}
	table tr td:nth-child(4){
		width:170px;
	}
	table tr td:nth-child(5),
	table tr th:nth-child(5){
		text-align:center;
		width:80px;
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
				</span> <span>사내게시판</span>
				<hr>
			</div>
			<div id="submenu">

			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/orderheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 사내 게시판</p>
			</div>
			<form action = "boardSearch1" method = "post">
			<div id = "searchBar">
				<select id = "cmSearch" class = "form-control" name = "searchType">
					<option value = "1">제목 + 내용</option>
				</select>
				<input type = "text" class = "form-control" name = "searchContent" />
				<button type = "submit" class = "btn btn-default">검색</button>
			</div>
			</form>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
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
							<td>${post.userId}</td>
							<td><fmt:formatDate value = "${post.posWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></td>
							<td>${post.posViewCnt}</td>
						</tr> 
						</c:forEach>
					</tbody>
				</table>
				<button id = "write" class = "btn btn-default" onclick = "location.href = '/shoppingmall/admin/boardWrite'">글쓰기</button>
			</div>
			 	<div id = "pagination">
					<div>
						<ul class = "pagination">
								<c:if test = "${pageMaker.prev}">
									<li><a href = "board${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
								</c:if>
										
								<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
									<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
										<a href = "board${type}${idx}">${idx}</a>
									</li>
								</c:forEach>
				
								<c:if test = "${pageMaker.next}">
									<li><a href = "board${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
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
 		var category = 0;
		var posNum = $(this).attr("id");
		var poscNum = 65;
		
		result.push(category);   
		result.push(poscNum);
		result.push(posNum);
		result = result.join('I');
		location.href="/shoppingmall/admin/boardRead" + result;
	})
</script>

</body>
</html>