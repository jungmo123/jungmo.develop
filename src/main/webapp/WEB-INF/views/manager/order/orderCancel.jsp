<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
	#content .container:nth-child(1){
		margin-top:20px;
	}
	a,
	a:hover{
		color:black;
		text-decoration:none;
	}
	#search{
		padding:10px 5px 2px 20px;
		margin-top:20px;
		margin-bottom:40px;
		border:1px solid #F2F5F7;
		border-radius:10px;
		background-color:#F2F5F7;
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
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px;
	}
	#input-group{
		display:inline;
	}
	#input1,#input2{
		display:inline-block;
	}
	#dateForm{
		width:100%;
		display:inline-block;		
	}
	#dateForm span{
		margin-right:10px;
	}
	#input-group span{
		margin-right:0;
	}
	#textarea{
		width:100px;
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
	.glyphicon-search{
		border:0px;
		background-color:#F2F5F7;
		margin:5px;
		font-size:25px;
		color:#878787;
	}
	#keyword button{
		padding:0px 5px 0px 5px;
		margin:0px 10px 5px 10px;
	}
	#resultbox tr:nth-child(1) th{
		border-top:1px solid #878787;
	}
	#resultbox tr:last-child td{
		border-bottom:1px solid #878787;
	}
	#resultbox table{
		width:100%;
		text-align:center;
	}
	#resultbox table tr{
		border:1px solid #F2F5F7;
		height:60px;
	}
	#resultbox table th{
		text-align:center;
		margin-left:10px;
	}
	#Trheader{
		background-color:#F2F5F7;
	}
	#orderState{
		margin-bottom:10px;
		margin-left:10px;
	}
	#orderState a{
		color:#878787;
		text-decoration:none;
	}
	#orderState span:nth-child(1){
		margin-right:30px;
		color:#494949;
		font-weight:bold;
	}
	.Y{
		margin:0px 10px 0px 10px;
		color:#FF6F43;
	}
	.download{
		float:right;
		position:relative;
		bottom:12px;
		right:10px;
		margin-right:5px;
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
	.itemName{
		cursor:pointer;
	}
</style>
</head>
<body>

<div class="container">
		<div id="title">
			<div id="logo">
				<a href="../MAIN/01.html"><span>LALA&nbsp;</span>MARKET</a>
				<div id="Admin">
					<h5>Administrator</h5>
				</div>
			</div>
			<div>
				<span> <i class="far fa-edit"></i>
				</span> <span>주문 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href = "orderList"><span>스타일 숍 주문</span></a>
				<a href = "orderCancel"><span class = "activeMenu">주문 취소</span></a>
				<a href = "../ORDER/05.html"><span>교환</span></a>
				<a href = "../ORDER/05.html"><span>환불</span></a>	
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/header.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 >교환/환불</p>
			</div>
			<div id = "search">
				<form id = "dateForm">
					<span>주문일</span>
					<div id = "input-group">
						<div id = "input1">
							<input type="date" name="dateofbirth" class="dateInput">
						</div>
						<span>~</span>
						<div id = "input2">
							<input type="date" name="dateofbirth" class="dateInput">		
						</div>
						<div id = "keyword">
							<span>키워드 검색</span>
							<select class = "form-control">
								<option>신청자</option>
							</select>
							<input class = "form-control" id = "textarea" type = "text" name = "search" />
							<button class ="btn btn-default glyphicon glyphicon-search"></button>	
						</div>
					</div>
				</form>
			</div>
			<div id = "orderState">
				<span>&#124; 처리상태</span>
				<a href = "#">처리 전</a>
				<span  class = "Y">&#124;</span>
				<a href = "#">처리 완료</a>
				<button class = "btn btn-default download">처리완료 목록으로 이동</button>
			</div>
			<div id = "resultbox">
				<table>
					<tr id = "Trheader">
						<th>선택</th>
						<th>주문일</th>
						<th>주문 취소일</th>
						<th>주문 번호</th>
						<th>주문 상품</th>
						<th>주문자<br>(아이디)</th>
						<th>결제 방법</th>
						<th>결제 금액</th>
						<th>처리 상태</th>
					</tr>
						<c:set var = "total" value = "0" />
						<c:forEach  var = "post" items= "${posts}" varStatus = "state">
								<c:forEach  var = "oc" items= "${ordercancel}" varStatus = "state">
										<c:if test = "${post.postNum==oc.ordNum}">
										<tr>								
										<td><input type ="checkbox" name = "${oc.ordNum}" /></td>
										<td >${oc.ordDate}<br><fmt:formatDate value = "${oc.ordDate}" pattern = "HH:mm:ss" /></td>
										<td>${oc.odcDate}<br><fmt:formatDate value = "${oc.odcDate}" pattern = "HH:mm:ss" /></td>
										<td class = "itemNum">${oc.ordNum}</td>
										<td class = "itemName">${oc.goods[0].godName} 외 ${fn:length(oc.goods)-1}건</td>
										<td>${oc.user.userId}</td>
										<td>${oc.paymentMethod}</td>
										<c:forEach var = "god" items = "${oc.goods}" varStatus = "state">
											<c:set var = "total" value = "${(total + (god.godSellingPrice*god.godAmount))}" />
										</c:forEach>
										<td><c:out value = "${total}원" /></td>
										<c:set var = "total" value = "0" />
										<td>${oc.odcType}</td>
										</tr>				
										</c:if>
								</c:forEach>
						</c:forEach>					
				</table>
			</div>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "${pageMaker.prev}">
							<li><a href = "orderList${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
						</c:if>
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
							<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href = "orderList${type}${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test = "${pageMaker.next}">
							<li><a href = "orderList${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
						</c:if>
					</ul>
				</div>		
			</div>
		</div>
  	</div>
</div>


<script type = "text/javascript">
	$(".itemName").click(function(){
		var name = $(this).siblings(".itemNum").text();
		location.href="/shoppingmall/admin/orderDetail" + name;
	})
</script>
</body>
</html>