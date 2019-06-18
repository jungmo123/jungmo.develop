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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style>	
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#adviser{
		width:780px;
		height:120px;
		padding:10px;
		margin-bottom:30px;
		margin-top:20px;
		border:1px solid grey;
	}
	#adviser div{
		display:inline-block;
	}
	#adviser div:first-child{
		width:200px;
		height:100px;
		float:left;
	}
	#adviser div:last-child{
		height:100px;
		padding:10px;
		line-height:25px;
		float:left;
	}
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:200px;
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
	#inquiry,#help{
		margin-top:10px;
		width:160px;
		border:1px solid grey;
		float:left;
		text-align:center;
		line-height:25px;
		padding:10px;
		cursor:pointer;		
	}
	#inquiry{
		height:100px;
	}
	#help{
		height:120px;
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
	a{
		color:black;
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
	table tr td:nth-child(1){
		width:90px;
	}
	table tr td:nth-child(2){
		width:380px;
	}
	table tr td:nth-child(3){
		width:120px;
	}
	table tr td:nth-child(4){
		width:150px;
	}
	table tr td:nth-child(5){
		width:60px;
		text-align:center;
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
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#counselor{
		width:200px;
		height:100px;
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
	<%@ include file = "../header/userheader.jsp" %>
		<div id = "adviser" class = "center-block">
			<div>
				<img id = "counselor" src = "IMAGE/counselor.jpg">
			</div>
			<div>
				<strong>무엇을 도와 드릴까요?</strong>
				<br>
				<span>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화 주시거나 1:1문의로 남겨주세요.</span>
				<br>
				<span>친절히 안내해 드립니다.</span>
			</div>
		</div>
		<div id="content">
		<div id = "navBar">
			<div id="nav">
				<div id="navTitle">
					<span>고객센터</span>
				</div>
			<div id="navContent">
				<div>
					<a href="notice"><span>> 공지사항</span></a>
					<a href="community" class = "activeMenu"><span>> 커뮤니티</span></a> 
					<a href="idSearch"><span>> 아이디 찾기</span></a> 
					<a href="pwdSearch"><span>> 비밀번호 찾기</span></a>
				</div>
			</div>
			</div>
			<div id = "inquiry" onClick = "location.href='../MYPAGE/BOARD/01.html';">
				<div onclick = "location.href = '../MYPAGE/BOARD/01.html'">
					<strong>1:1 문의</strong>
				</div>
				<div onclick="location.href='../MYPAGE/BOARD/03.html'">
					<span>비공개로 고객님께</span>
					<br>
					<span> 맞춤 답변을 드립니다.</span>
				</div>				
			</div>
			<div id = "help" onClick = "location.href='/shoppingmall/notice';">
				<div>
					<strong>고객센터</strong><br>
					<strong>070-0000-0000</strong>
				</div>
				<div>
					<span> 평일 10시-18시</span><br>
					<span>공휴일,주말 휴무</span>
				</div>	
			</div>
		</div>
		<div id = "tableDiv">
			<strong>&#124;&nbsp;커뮤니티</strong>
			<hr>
			<form id = "searchForm" action = "communitySearch1" method = "post">
			<div id = "searchBar">
				<select id = "searchCategory" class = "form-control" name = "searchCategory">
					<option value = "0">카테고리 선택</option>
					<c:forEach var = "cmCategory" items = "${categories}" varStatus = "state">
						<option value = "${cmCategory.poscNum}">${cmCategory.poscName}</option>
					</c:forEach> 
				</select>
				<select id = "cmSearch" class = "form-control" name = "searchType">
					<option value = "1">제목 + 내용</option>
				</select>
				<input type = "text" class = "form-control" name = "searchContent" />
				<button type = "submit" class = "btn btn-default">검색</button>
			</div>
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
				<c:if test = "${null ne user}">
				<button type = "button" id = "write" class = "btn btn-default" onclick = "location.href = '/shoppingmall/communityWrite'">글쓰기</button>
				</c:if>
			</div>
		</form>
			<div id = "pagination">
				<div>
					<ul class = "pagination">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "community${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
							
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "community${type}${idx}">${idx}</a>
								</li>
							</c:forEach>
	
							<c:if test = "${pageMaker.next}">
								<li><a href = "community${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
	</div>
	
<script type = "text/javascript">
$("table tr").click(function(){
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
	location.href="/shoppingmall/communityRead" + result;
})
</script>

</body>
</html>