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
<style>	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
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
		height:210px;
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
		margin-bottom:20px;
		line-height:25px;
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
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#counselor{
		width:200px;
		height:100px;
	}
</style>
</head>
<body>

	<div class="container">
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
					<a href="notice" class = "activeMenu"><span>> 공지사항</span></a>
					<a href="community"><span>> 커뮤니티</span></a> 
					<a href=""><span onclick = "location.href = '06.html'">> 자주 하는 질문</span></a>
					<a href=""><span onclick = "location.href = '07.html'">> 상품 문의</span></a>
					<a href=""><span onclick = "location.href = '08.html'">> 아이디 찾기</span></a> 
					<a href=""><span onclick = "location.href = '09.html'">> 비밀번호 찾기</span></a>
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
			<div id = "help" onClick = "location.href='../HELP/01.html';">
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
			<strong>&#124;&nbsp;공지사항</strong>
			<hr>
			<form>
			<div id = "searchBar">
				<select class = "form-control">
					<option>제목 + 내용</option>
				</select>
				<input type = "text" class = "form-control" name = "title" />
				<button type = "button" class = "btn btn-default">검색</button>
			</div>
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
						<tr>
							<td><span class = "badge">중요</span></td>
							<td>폭설로 인한 배송 지연 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>10</td>
							<td>{제목표기}</td>
							<td>{작성일 표기</td>
						</tr>
						<tr>
							<td>9</td>
							<td><a href="02.html">택배사 물량 폭주로 배송 불가 안내</a></td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>8</td>
							<td>신용카드 무이자 할부 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>7</td>
							<td>신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>6</td>
							<td>오픈 숍 이용 시 주의사항 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>5</td>
							<td>신용카드 무이자 할부 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>4</td>
							<td>신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>3</td>
							<td>오픈 숍 이용 시 주의사항 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>2</td>
							<td>1월 신상품 입고 안내</td>
							<td>2023-01-01</td>
						</tr>
						<tr>
							<td>1</td>
							<td>게시글 제목이 표기 됩니다.</td>
							<td>2023-01-01</td>
						</tr>
					</tbody>
				</table>
				<button id = "write" class = "btn btn-default" onclick = "location.href = '../MYPAGE/BOARD/03.html'">글쓰기</button>
			</div>
		</form>
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