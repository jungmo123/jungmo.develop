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
	#counselor{
		width:200px;
		height:100px;
	}
	#noticeRead{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#Dtitle,#DuserId,#Dposc{
		font-weight:bold;
		position:relative;
		left:15px;
	}
	#Dposc{
		color:#878787;
	}
	#Ddate{
		float:right;
	}
	#contentDiv{
		line-height:25px;
		padding:40px;
		margin-bottom:50px;
	}
	#contentDiv hr{
		width:780px !important;
		position:relative;
		right:10px;
	}
	#footerDiv{
		float:right;
	}
	button{
		width:80px;
	}
	#AllContent hr{
		width:100%;
		height:2px;
		margin:10px;
		border-color:grey;
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
					<a href="notice" class = "activeMenu"><span>> 공지사항</span></a>
					<a href="community"><span>> 커뮤니티</span></a> 
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
		<div id="noticeRead">
			<strong>&#124;&nbsp;공지사항</strong>
			<div id = "titleDiv">
				<hr>
				<span id = "Dposc">${post.poscName} &#124; </span>
				<span id = "Dtitle">${post.posTitle}</span>
				<span id = "Ddate"><fmt:formatDate value = "${post.posWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
			</div>
			<hr>
			<div>
				<span id = "DuserId">${post.userId}</span>
			</div>
			<div id = "contentDiv">
				${post.posContent}
			</div>
			<hr>
			<div id = "footerDiv">
				<a href = "notice" class = "btn btn-default left">목록 보기</a>
				<button id = "pre" class = "btn btn-default left">이전글&nbsp;<span class = "glyphicon glyphicon-chevron-down" ></span></button>
				<button id = "next" class = "btn btn-default left">다음글&nbsp;<span class = "glyphicon glyphicon-chevron-up" ></span></button>
			</div>
		</div>
	</div>
	</div>
	
<script type = "text/javascript">
var idx = ${post.posNum};
$("#pre").click(function(){
	if("${post.preNum}"==0){
		Swal.fire({
			  position: 'top',
			  type: 'warning',
			  title: '이전글이 없습니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
	}else{
		location.href="/shoppingmall/noticeRead${category}I${post.prec}I${post.preNum}";
	}
})

	$("#next").click(function(){
		if("${post.nextNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '다음글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/noticeRead${category}I${post.nextc}I${post.nextNum}";
		}
	})
</script>

</body>
</html>