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
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style>
	#event{
		background-color:#F2F5F7;
		padding:10px;
		border-radius:10px;
	}
	#eventForm div:first-child input{
		margin:10px 0px 10px 0px;
	}
	#eventForm div:first-child textarea{
		resize:none;
	}
	#eventForm{
		width:100%;
		display:inline-block;		
	}
	#input-group{
		display:inline;
	}
	#input1,#input2{
		display:inline-block;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px;
	}
	[type="date"] {
	  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
	}
	[type="date"]::-webkit-inner-spin-button {
	  display: none;
	}
	[type="date"]::-webkit-calendar-picker-indicator {
	  opacity: 0;
	}
	#viewDiv{
		display:inline-block;
		float:right;
		position:relative;
		top:8px;
	}
	#viewDiv input{
		width:120px;
		display:inline-block;
	}
	#keyword{
		float:right;
		position:relative;
		bottom:2px;
	}
	#keyword .form-control{
		display:inline-block;
	}
	#keyword select{
		width:110px;
		position:relative;
		top:1px;
	}
	#keyword span{
		position:relative;
		bottom:1px;
		right:8px;
	}
	#keyword input{
		width:140px;
	}
	#keyword button{
		padding:0px 5px 0px 5px;
		margin:0px 10px 5px 10px;
	}
	#eventForm div:nth-child(2) span{
		font-weight:bold;
	}
	#eventBody{
		margin-top:30px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:10px;
	}
	#imgBox{
		display:inline-block;
		width:150px;
		height:100px;
		padding:5px;
		border:1px solid #878787;
		border-radius:10px;
		text-align:center;
		background-color:white;
	}
	#imgBox span{
		font-size:12px;
	}
	#eventImg input{
		display:inline-block;
		width:300px;
	}
	#eventImg button{
		display:inline-block;
		width:90px;
	}
	#eventImg div:nth-child(2){
		display:inline-block;
		position:relative;
		top:30px;
		left:60px;
	}
	a{
		color:#878787;
	}
	#write{
		margin-top:20px;
		margin-left:10px;
	}
	.form-control{
		display:inline;
	}
	#writeC{
		margin-top:20px;
		height:400px;
	}
	#writeC ul{
		display:block;
		border-color:#878787;
	}
	#writeC ul .active{
		border-color:color:#878787;
	}
	#writeArea{
		border-top:0px;
		border-color:#878787;
		resize: none;
	}
	.nav-tabs > li.active > a,
	.nav-tabs > li.active > a:focus,
	.nav-tabs > li.active > a:hover{
		border-left:1px solid #878787;
		border-top:1px solid #878787;
		border-right:1px solid #878787;
	}
	.nav-tabs > li > a:hover{
	  background-color: white !important;
  	  border-radius: 5px 5px 0px 0px;
  	  border-left:1px solid white;
	  border-top:1px solid white;
	  border-right:1px solid white;
	  border-bottom:1px solid #878787;
      color:#000;
	} 
	.aditorDiv{
		width:100%;
		height:40px;
		border-left:1px solid #878787;
		border-right:1px solid #878787;
		background-color:#F2F5F7;
		text-align:center;
		line-height:40px;
	}
	textarea:focus {
	outline:none;
	}
	.tab-content{
		width:100%;
		height:400px;
	}
	.tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	#buttonGroup{
		margin:25px;
		text-align:center;
	}
	#buttonGroup button{
		margin:5px;
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
				<p id = "currentIdx">&#124; 게시판관리 > 이벤트 등록/수정하기</p>
			</div>
			<form>
				<div id = "event">
					<div id = "eventForm">
						<div>
							<input type = "text" name = "title" class = "form-control" placeholder = "제목을 입력하세요!"/>
							<textarea class = "form-control" placeholder = "이벤트 요약 내용을 입력하세요!"></textarea>
						</div>
						<div>
							<span>이벤트 기간</span>
							<div id = "input-group">
								<div id = "input1">
									<input type="date" name="dateofbirth" class="dateInput">
								</div>
								<span>~</span>
								<div id = "input2">
									<input type="date" name="dateofbirth" class="dateInput">		
								</div>
								<div id = "viewDiv">
									<span>조회수 :</span>
									<input class = "form-control" type = "text" name = "viewcount" />
								</div>
							</div>					
						</div>
					</div>
				</div>
				<div id = "eventBody">
					<div id = "eventImg">
						<div id = "imgBox">
							<span>등록된 이미지가 없습니다.</span>						
						</div>
						<div>
							<span>목록 이미지 : </span>
							<input type = "text" name = "imgURL" class = "form-control"/>
							<button class = "form-control">찾아보기</button>						
						</div>

					</div>
						<div id = "write">
							<div id = "writeC">
								<div class="tab-content">
									<textarea id = "WriteContent" name = "WriteContent" style = "height:500px;"></textarea>
								</div>
							</div>
							<div id = "buttonGroup">
								<button type = "submit" class = "btn btn-default">작성 완료</button>
								<button class = "btn btn-default">작성 취소</button>
							</div>
						</div>				
				</div>
			</form>
		</div>
  	</div>
</div>

<script type = "text/javascript">
CKEDITOR.replace('WriteContent',{
    toolbar: 'Full',
    uiColor: '#F2F5F7',
    height:'300px'
}
);
CKEDITOR.config.removePlugins = 'resize';
</script>

</body>
</html>