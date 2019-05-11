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
	.left{
		float:left;
		margin-right:5px;
	}
	.right{
		float:right;
		margin-right:5px;
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
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event"><span>이벤트</span></a>
				<a href="boardCategory"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 공지사항 > 공지사항 목록 > 상세 보기</p>
			</div>
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
			<a href = "cic" class = "btn btn-default left">목록 보기</a>
			<button id = "pre" class = "btn btn-default left">이전글&nbsp;<span class = "glyphicon glyphicon-chevron-down" ></span></button>
			<button id = "next" class = "btn btn-default left">다음글&nbsp;<span class = "glyphicon glyphicon-chevron-up" ></span></button>
			<button class = "btn btn-default right"onclick="location.href='/shoppingmall/admin/cicWrite'">글쓰기</button>
			<c:if test = "${post.userId== admin}">
				<button id = "modify" class = "btn btn-default right">수정</button>
				<button id = "delete" class = "btn btn-default right">삭제</button>
			</c:if>
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
			location.href="/shoppingmall/admin/cicRead${category}I${post.prec}I${post.preNum}";
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
				location.href="/shoppingmall/admin/cicRead${category}I${post.nextc}I${post.nextNum}";
			}
		})
		
		$("#delete").click(function(){
			Swal.fire({
				  title: '삭제하시겠습니까?',
				  type: 'info',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
					window.location.href = "/shoppingmall/admin/cicDelete"+idx;
				  }
				})			
		})
		$("#modify").click(function(){
			location.href = "/shoppingmall/admin/cicModify"+idx;
		})
</script>

</body>
</html>