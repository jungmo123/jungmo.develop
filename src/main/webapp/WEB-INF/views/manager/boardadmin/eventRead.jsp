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
	#eventContent{
		margin-top:30px;
	}
	#eventContent p{
		font-size:20px;
		font-weight:bold;
	}
	#contentInfo,#eventbody{
		margin:10px 0px 10px 0px;
	}
	#contentInfo span:nth-child(2){
		float:right;
	}
	#eventbody{
		width:100%;
		height:500px;
		border:1px solid #F2F5F7;
		padding:10px;
		overflow:auto;
	}
	#buttonBox button{
		display:inline-block;
		width:100px;
	}
	#leftBox{
		float:left;
	}
	#rightBox{
		float:right;
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
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event" class="activeMenu"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판관리 > 이벤트 목록 > 상세 보기</p>
			</div>
			<div id = "eventContent">
				<p>${event.eventTitle}</p>
				<hr>
				<div id = "contentInfo">
					<span>기간&nbsp;:&nbsp;${event.eventSDate}&nbsp;&nbsp;~&nbsp;&nbsp;${event.eventEDate}</span>
					<span>조회수 : ${event.eventViewCnt}회</span>
				</div>
				<hr>
				<div id = "eventbody">
					${event.eventContent}
				</div>
				<hr>
				<div id = "buttonBox">
					<div id = "leftBox">
						<button class = "form-control" onclick = "location.href='/shoppingmall/admin/EIDX'">목록</button>
						<button id = "pre" class = "form-control" >이전글&nbsp;<span class = "glyphicon glyphicon-triangle-top"></span></button>
						<button id = "next" class = "form-control">다음글&nbsp;<span class = "glyphicon glyphicon-triangle-bottom"></span></button>
					</div>
					<div id = "rightBox">
						<button class = "form-control" onclick = "location.href='15.html'">이벤트 등록</button>
						<button class = "form-control">수정</button>
						<button class = "form-control">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	$("#pre").click(function(){
		if("${event.preNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '이전글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/admin/eventRead${event.preNum}";
		}
	})
	
	$("#next").click(function(){
		if("${event.nextNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '다음글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/admin/eventRead${event.nextNum}";
		}
	})
</script>

</body>
</html>