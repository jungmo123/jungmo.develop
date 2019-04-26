<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
	#titleBar{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#titleBar input[type='text']{
		width:605px;
		height:24px;
	}
	#textBox{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#textBox > div:first-child{
		height:30px;
		background-color:#F2F5F7;
		text-align:center;
		border:1px solid grey;
		border-bottom:0;
	}
	#buttonGroup{
		display:inline-block;
		width:780px;
		text-align:center;
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
				<a href="05.html"><span>커뮤니티</span></a>
				<a href="08.html"><span>상품 문의</span></a> 
				<a href="09.html"><span>1:1문의</span></a> 
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
				<p id = "currentIdx">&#124; 게시판 관리 > 공지 사항 > 글쓰기</p>
			</div>
		<form id = "writeForm" action = "write" method = "post">
			<div id = "titleBar">
				<label for = "importance">중요</label>
				<input id = "importance" type= "checkbox" name = "importance">
				<select id = "categorySelect" name = "categorySelect">
					<option>카테고리 선택</option>
					<c:forEach var = "category" items = "${categories}" varStatus = "state">
						<option value = "${category.poscNum}">${category.poscName}</option>
					</c:forEach>
				</select>
				<input id = "writeTitle" type = "text" name = "title" placeholder = "제목을 입력해 주세요!" />
			</div>
			<div>
				<textarea id = "writeContent" name = "writeContent" style="width:765px; height:475px; display:none;"></textarea>	
			</div>
			<div id = "buttonGroup">
				<button id = "submitButton" class = "btn btn-default">작성 완료</button>
				<button class = "btn btn-default" onclick="location.href='01.html'">작성 취소</button>
			</div>
		</form>
	</div>
</div>
</div>

<script type="text/javascript">
var oEditors = [];
$(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "writeContent",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "../editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			
							fOnBeforeUnload : function(){
								
							}
						},
						fCreator: "createSEditor2"
					});
					
					$("#submitButton").click(function(e){
						e.preventDefault();
						oEditors.getById["writeContent"].exec("UPDATE_CONTENTS_FIELD",[]);
						if($("#categorySelect option:selected").val() == '카테고리 선택'){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: "카테고리를 선택해주세요!",
								  showConfirmButton: false,
								  timer: 1500
								});			
						}else if($("#writeTitle").val() == ''){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: "제목을 입력하세요!",
								  showConfirmButton: false,
								  timer: 1500
								});										
						}else{
							$("#writeForm").submit();
						}
					})
});
</script>

</body>
</html>