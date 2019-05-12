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
		margin:10px 0px 60px 0px;
	}
	#searchBar input[type="text"]{
		display:inline;
		width:350px;
	}
	#searchBar select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar button{
		width:100px;
		position:relative;
		bottom:2px;
	}
	#detailOpen,
	#detailClose{
		width:120px !important;
		float:right;
		top:10px;
	}
	#detailBox{
		margin:20px 0px 20px 0px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#input1,#input2{
		display:inline-block;
		width:120px !important;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px !important;
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
	#first div:first-child,
	#first div:last-child,
	#second div:first-child,
	#second div:last-child{
		display:inline-block;
		width:350px;
	}
	#first div:nth-child(2) input{
		display:inline-block;
		margin-right:10px;
		width:100px;
	}
	#first,#second,#third{
		margin:10px;
	}
	#second div .form-control{
		display:inline-block;
	}
	#second div:first-child select{
		width:35px;
		-webkit-appearance:none;
		text-align:center;
	}
	#second div:last-child input{
		width:100px;
		margin-right:10px;
	}
	#second div:last-child{
		position:relative;
		left:17px;
	}
	#third label,#third span{
		margin-right:20px;
	}
	#fourth{
		text-align:center;
	}
	#lank{
		text-align:center;
	}
	#lank i{
		margin-right:5px;
	}
	#searchNumber{
		float:right;
		margin:30px 0px 10px 0px;
	}
	#searchNumber select{
		display:inline-block;
		width:140px;
		margin-left:10px;
		position:relative;
		top:1px;		
	}
	#searchNumber .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	table tr th,
	table tr td{
		text-align:center;
	}
	#table tr{
		cursor:pointer;
	}
	#table button{
		width:50px;
		height:20px;
		padding:0;
		position:relative;
		left:20px;
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
	tr td:nth-child(1){
		width:53px;
	}
	tr td:nth-child(2){
		width:110px;
	}
	tr td:nth-child(3){
		width:69px;
	}
	tr td:nth-child(4){
		width:76px;
	}
	tr td:nth-child(5){
		width:85px;
	}
	tr td:nth-child(6),
	tr td:nth-child(8){
		width:70px;
	}
	tr td:nth-child(7){
		width:116px;
	}
	tr td:nth-child(9){
		width:127px;
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
	.none{
		display:none;
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
				<a href="userIdx"><span>회원 목록</span></a>
				<a href="../USER/03.html"><span>탈퇴 회원 목록</span></a>
				<a href="../USER/04.html"><span>메일 관리</span></a>
				<a href="../USER/05.html"><span>SMS 관리</span></a>
				<a href="../USER/06.html"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > 회원 목록</p>
				<hr>
			</div>
			<div id = "searchBox">
				<div id = "searchBar">
					<form>
						<select class = "form-control">
							<option>이름</option>
						</select>
						<input type = "text" class = "form-control" name = "title" />
						<button type = "button" class = "btn btn-default">검색</button>
					</form>
					<button id = "detailOpen" class = "btn btn-default">상세 검색 열기<span class = "glyphicon glyphicon-triangle-bottom"></span></button>
				</div>
				<hr>
				<div id = "detailBox" class = "none">
					<div id = "first">
						<div>
							<span>가입일</span>
							<div id = "input1">
								<input type="date" name="dateofbirth" class="dateInput">
							</div>
							<span>~</span>
							<div id = "input2">
								<input type="date" name="dateofbirth" class="dateInput">	
							</div>						
						</div>
						<div>
							<span>구매 금액</span>
							<input class = "form-control" type = "number" name = "minPrice" />원
							<span>&nbsp; ~ &nbsp;</span>
							<input class = "form-control" type = "number" name = "maxPrice" />원
						</div>
					</div>
					<div id = "second">
						<div>
							<span>회원 등급</span>
							<select class = "form-control">
								<option>1</option>
							</select>
						</div>
						<div>
							<span>적립금</span>
							<input class = "form-control" type = "number" name = "minSaved" />원
							<span>&nbsp; ~ &nbsp;</span>
							<input class = "form-control" type = "number" name = "maxSaved" />원
						</div>
					</div>
					<div id = "third">
						<div>
							<div class="custom-control custom-radio">
								<span>메일 수신</span>
								<input type="radio" name="mail" id="mailAgree" class="custom-control-input">
								<label class="custom-control-label" for="mail">수신</label>
								<input type="radio" name="mail" id="mailReject" class="custom-control-input">
								<label class="custom-control-label" for="mailReject">거부</label>
							</div>
						</div>
					</div>
					<div id = "fourth">
						<button class = "btn btn-default">상세 검색</button>
					</div>
				</div>
			</div>
		<form>
			<div id = "searchNumber">
				<span>000 건의 검색 결과가 있습니다.</span>
			</div>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>가입일</th>
							<th>이름</th>
							<th>아이디</th>
							<th>회원등급</th>
							<th>방문수</th>
							<th>구매 금액</th>
							<th>적립금</th>
							<th>메일 수신 여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "post" items = "${posts}" varStatus = "state">
							<tr>
								<td><input type = "checkbox"  id = "${post.userId}"/></td>
								<td>${post.userJoinDate}</td>
								<td>${post.userName}</td>
								<td>${post.userId}</td>
								<td>${post.userLevel}</td>
								<td>${post.userVisitCnt}</td>
								<td>${post.purchaseAmount}원</td>
								<td>${post.userHp}원</td>
								<td>${post.userMailAgreement}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id = "leave" class = "btn btn-default">선택 탈퇴</button>
				<button id = "pointGive" class = "btn btn-default">선택 회원 포인트 지급</button>
				<button id = "pointGive" class = "btn btn-default">검색된 회원 포인트 지급</button>
			</div>
		</form>
			 <div id = "pagination">
				<div>
					<ul class = "pagination">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "userIdx${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
										
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "userIdx${type}${idx}">${idx}</a>
								</li>
							</c:forEach>
				
							<c:if test = "${pageMaker.next}">
								<li><a href = "userIdx${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">

	$(document).on("click","#detailOpen",function(event){
		$(this).text("상세 검색 닫기");
		var span = $("<span></span>");
		span.attr({
			"class":"glyphicon glyphicon-triangle-top"
		})
		$(this).append(span);
		$(this).attr({
			"id":"detailClose"
		})
		$("#detailBox").removeClass("none");
	})
	
$(document).on("click","#detailClose",function(event){
		$(this).text("상세 검색 열기");
		var span = $("<span></span>");
		span.attr({
			"class":"glyphicon glyphicon-triangle-bottom"
		})
		$(this).append(span);
		$(this).attr({
			"id":"detailOpen"
		})
		$("#detailBox").addClass("none");
	})
</script>

</body>
</html>