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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	a{
		color:#878787;
	}
	#searchOption{
		text-align:center;
	}
	#searchMenu,#searchOption hr{
		margin:10px 0px 10px 0px;
	}
	#searchMenu button{
		display:inline-block;
		width:90px;
		margin-left:5px;
	}
	.searchList{
		margin-top:10px;
	}
	.searchList input{
		margin-right:5px;
	}
	.searchList div input:nth-child(2){
		display:inline-block;
		width:200px;
	}
	.searchList div input:nth-child(3){
		display:inline-block;
		width:400px;
	}
	#searchBar{
		background-color:#F2F5F7;
		height:50px;
		text-align:center;
		border-radius:20px;
		margin:50px 0 10px 0;
	}
	#searchBar *{
		position:relative;
		top:8px;
	}
	#searchBar input{
		display:inline-block;
		width:88%;
		border-radius:15px;
	}
	#searchBar button{
		display:inline-block;
		width:60px;
		border-radius:15px;
	}
	#resultBox #resultBoxIndex{
		text-align:center;
		margin-bottom:100px;
	}
	#resultBox #resultBoxIndex span{
		margin-left:10px;
	}
	#resultBox #resultBoxIndex #activeIndex{
		font-weight:bold;
	}
	#resultTableT{
		margin-bottom:10px;
	}
	#resultTableC div:nth-child(1){
		margin-bottom:10px;
	}
	.quest{
		font-size:20px;
		position:relative;
		top:2px;
		margin-right:10px;
	}
	#resultTableC #open{
		display:inline-block;
		position:relative;
		top:2px;
		margin-right:10px;
	}
	#resultTableC .form-control{
		display:inline-block;
		position:relative;
		top:75px;
		width:50px;
		height:25px;
		padding:0;
		margin-right:5px;
		float:right;
	}
	#resultTableC hr{
		margin-top:10px;
		margin-bottom:10px;
	}
	#openTable{
		width:100%;
		height:150px;
		padding:10px 0px 10px 0px;
		margin-bottom:10px;
		background-color:#F2F5F7;
		border-top:1px solid #BABABA;
	}
	#openTable span:nth-child(1){
		margin-left:19px;
	}
	#openTable span:nth-child(2){
		font-size:20px;
		position:relative;
		top:2px;
		margin-right:10px;
	}
	#openTable span:nth-child(3){
		font-size:14px;
	}
	#questAdd{
		width:100px;
		float:right;
	}
	#pagination{
		margin-top:80px;
		margin-bottom:100px;
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
	#Alert .modal-content{
		width:350px !important;
	}
	#Alert #iconInfo{
		display:inline-block;
		width:80px;
		height:60px;
		float:left;
		margin:10px;
	}
	#Alert #iconInfo i{
		font-size:50px;
	}
	#Alert .modal-body{
		height:110px;
	}
	#Alert .modal-body div:nth-child(2){
		display:inline-block;
		width:200px;
		height:60px;
		font-size:15px;
		float:left;
		position:relative;
		top:25px;
	}
	#Alert .modal-footer{
		text-align:center;
	}
	#Alert.modal-footer button{
		width:100px;
	}
	.none{
		display:none;
	}
	#quest .modal-header{
		border:0;
		padding-bottom:0;
	}
	#quest .modal-header h4{
		width:90%;
		position:relative;
		left:15px;
	}
	#quest .modal-header button{
		position:relative;
		bottom:10px;
		font-size:50px;
	}
	#quest .modal-body{
		padding:0px 15px 0px 15px;
		position:relative;
		bottom:20px;
	}
	#quest .modal-body textarea{
		resize: none;
	}
	#quest .modal-title{
		font-weight:bold;
	}
	#quest #write{
		margin-top:20px;
	}
	#quest .form-control{
		display:inline;
	}
	#quest #writeT input[type="text"]{
		margin-left:20px;
		width:500px;
	}
	#quest #writeArea{
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
	#quest .nav-tabs > li > a:hover{
	  background-color: white !important;
  	  border-radius: 5px 5px 0px 0px;
  	  border-left:1px solid white;
	  border-top:1px solid white;
	  border-right:1px solid white;
	  border-bottom:1px solid #878787;
      color:#000;
	} 
	#quest textarea:focus {
		outline:none;
	}
	#quest .tab-content{
		width:100%;
		height:400px;
	}
	#quest .tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	#quest #buttonGroup{
		margin:25px;
		text-align:center;
	}
	#quest #buttonGroup button{
		margin:5px;
	}
	#quest a{
		color:#878787;
	}
	#quest #writeT .form-control:nth-child(1){
		display:inline-block;
		width:140px;
	}
	#quest #writeT .form-control:nth-child(2){
		position:relative;
		bottom:1px;
		display:inline-block;
		width:140px;
		margin-left:0;
	}
	#quest #writeT .form-control:nth-child(3){
		display:inline-block;
		width:100%;
		margin:10px 0px 10px 0px;
	}
	#quest #write div:nth-child(2){
		width:100%;
		height:30px;
		border-top:1px solid lightgrey;
		border-left:1px solid lightgrey;
		border-right:1px solid lightgrey;
		text-align:center;
		line-height:30px;
	}
	#quest #write div:nth-child(3) textarea{
		width:100%;
		height:120px;
		border:1px solid lightgrey;
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
				<a href="goodsQuestion" class="activeMenu"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="faq"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판관리 > 자주 하는 질문 목록</p>
			</div>
			<form>
				<div id = "searchOption">
					<hr>
					<div id = "searchMenu">
						<strong>검색 바로 이동</strong>
						<button class = "form-control">추가</button>
						<button class = "form-control">선택 삭제</button>
						<button class = "form-control">저장</button>
					</div>
				</div>
				<hr>
				<div id = "searchBar">
					<input type = "text" class = "form-control" />
					<button type = "submit" class = "form-control">검색</button>
				</div>
				<div id = "resultBox">
					<div id = "resultBoxIndex">
						<a href = "#"><span id = "activeIndex">자주 하는 질문 BEST</span></a>
						<span>&#124;</span>
						<a href = "#"><span>배송 관련</span></a>
						<span>&#124;</span>
						<a href = "#"><span>상품구매/주문절차 및 취소</span></a>
					</div>
					<div>
						<div id = "resultTableT">
							<span class = "glyphicon glyphicon-triangle-right">{클릭한 카테고리 표기} (예)자주 하는 질문 BEST</span>
						</div>
						<div id = "resultTableC">
							<div>
								<hr>
								<span>1.</span>
								<span class = "quest">Q</span>
								<span>{관리자에서 등록한 자주 하는 질문 제목 표기}</span>
								<button id = "open" class = "form-control"><span>열기</span><span class = "glyphicon glyphicon-triangle-bottom"></span></button>
							</div>
							<div id = "openTable" class = "none">
								<span></span>
								<span>A</span>
								<span>{관리자에서 등록한 자주 하는 질문 제목 표기}</span>
								<div>
									<button class = "form-control" data-toggle = "modal" data-target = "#quest">수정</button>
									<button class = "form-control">삭제</button>								
								</div>
							</div>
							<hr>
							<div>
								<span>2.</span>
								<span class = "quest">Q</span>
								<span>모바일에서 결제를하면, 상품 주문이 되었다고 했는데...</span>
								<button id = "open" class = "form-control"><span>열기</span><span class = "glyphicon glyphicon-triangle-bottom"></span></button>
							</div>
							<hr>
							<div>
								<span>3.</span>
								<span class = "quest">Q</span>
								<span>오픈 숍에서 구매를 했는데요. 입금은 어떻게 하면 되나...</span>
								<button id = "open" class = "form-control"><span>열기</span><span class = "glyphicon glyphicon-triangle-bottom"></span></button>
							</div>
							<hr>
						</div>
						<div>
							<button id = "questAdd" class = "form-control" data-toggle = "modal" data-target = "#quest">등록</button>
						</div>
					</div>
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


	<div class = "modal fade" id  ="Alert">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title"></h4>
				</div>
				<div class = "modal-body">
					<div id = "iconInfo">
						<i class="fas fa-info-circle"></i>
					</div>
					<div>
						<p>최대 5개만 사용할 수 있습니다.</p>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id  ="quest">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;자주 하는 질문/답변 등록(수정)</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<form>
						<div id = "write">
							<div id = "writeT">
								<select class = "form-control">
									<option>카테고리 선택</option>
								</select>
								<input type = "text" class = "form-control" placeholder = "순번 입력" />
								<input type = "text" class = "form-control" placeholder = "제목을 입력하세요!" />
							</div>
							<div>
								<span>에디터 기능</span>
							</div>
							<div>
								<textarea></textarea>
							</div>							
							<div id = "buttonGroup">
								<button type = "submit" class = "btn btn-default">작성 완료</button>
								<button class = "btn btn-default">작성 취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<script type = "text/javascript">
	$(function(){
		$.ajax({
			url:"getFaq",
			method:"post",
			data: {
				cmtNum:cmtNum,
			},
			success:function(data){
				console.log("성공");
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '삭제를 실패하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	})
</script>
</body>
</html>