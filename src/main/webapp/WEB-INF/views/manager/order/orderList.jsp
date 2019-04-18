<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jungmo.shoppingmall.admin.order.service.OrderServiceImpl" %>
<%@ page import = "jungmo.shoppingmall.admin.order.service.OrderService" %>
<%@ page import = "jungmo.shoppingmall.admin.order.domain.Purchase" %>
<%@ page import = "jungmo.shoppingmall.admin.order.service.PageServiceImpl" %>
<%@ page import = "jungmo.shoppingmall.admin.order.service.PageService" %>
<%@ page import = "jungmo.shoppingmall.admin.order.domain.Page" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	PageService ps = (PageService)request.getAttribute("pageMaker");
	System.out.println(ps.getEndPage());
	System.out.println(ps.getStartPage());
%>
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
	#resultbox table{
		width:100%;
		text-align:center;
	}
	#resultbox tr:nth-child(1) th{
		border-top:1px solid #878787;
	}
	#resultbox tr:last-child td{
		border-bottom:1px solid #878787;
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
	#download{
		float:right;
		position:relative;
		bottom:12px;
		right:10px;
	}
	#listOption{
		margin-top:10px;
	}
	#listOption select{
		display:inline-block;
		width:120px;
		position:relative;
		top:3px;
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
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../navigation/orderNav.jsp" %>
		<div id="content">
			<%@ include file = "../header/header.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 스타일 숍 주문</p>
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
								<option>주문번호</option>
							</select>
							<input class = "form-control" id = "textarea" type = "text" name = "search" />
							<button class ="btn btn-default glyphicon glyphicon-search"></button>	
						</div>
					</div>
				</form>
			</div>
			<div id = "orderState">
				<span>&#124; 주문상태</span>
				<a href = "#">배송 준비 중</a>
				<span  class = "Y">&#124;</span>
				<a href = "#">배송 중</a>
				<span  class = "Y">&#124;</span>
				<a href = "#">배송 완료</a>
				<span  class = "Y">&#124;</span>
				<a href = "#">주문 모두 보기</a>
				<button class = "btn btn-default" id = "download">목록 다운로드</button>
			</div>
			<div id = "resultbox">
				<table>
					<tr id = "Trheader">
						<th>선택</th>
						<th>주문번호</th>
						<th>배송상태</th>
						<th>주문 일시</th>
						<th>주문 상품</th>
						<th>주문자<br>(아이디)</th>
						<th>결제 금액</th>
					</tr>
						<c:set var = "loop_flag" value = "false" />
						<c:forEach  var = "post" items= "${posts}" varStatus = "state">
							<c:if test = "${not loop_flag }">
								<c:forEach  var = "purchase" items= "${purchases}" varStatus = "state">
									<c:if test = "${post.postNum==purchase.ordNum}">
									<td><input type ="checkbox" name = "${purchase.ordNum}" /></td>
									<td>${purchase.ordNum}</td>
									<td>${purchase.order.ordType}</td>
									<td>${purchase.order.ordDate}<br><fmt:formatDate value = "${purchase.order.ordDate}" pattern = "hh:mm:ss" /></td>
									<td>${purchase.goods[0].godName} 외 ${fn:length(purchase.goods)-1}건</td>
									<td>${purchase.order.user.userName}<br>${purchase.order.user.userId}</td>
									<c:forEach var = "god" items = "${purchase.goods}" varStatus = "state">
										<c:set var = "total" value = "${total + god.godSellingPrice}" />
									</c:forEach>
									<td><c:out value = "${total}원" /></td>
										<c:set var = "loop_flag" value = "true" />								
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
				</table>
			</div>
			<div id = "listOption">
				<span>선택한 항목</span>
				<select class = "form-control">
					<option>배송 준비중</option>
					<option>배송 중</option>
					<option>배송 완료</option>
				</select>
				<button class = "btn btn-default">목록으로 이동</button>
			</div>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "#{pageMaker.prev}">
							<li><a href = "list.jsp?currentPage=${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
						</c:if>
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
							<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href = "list.jsp?currentPage=${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test = "#{pageMaker.prev}">
							<li><a href = "list.jsp?currentPage=${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
						</c:if>
					</ul>
				</div>		
			</div>
		</div>
  	</div>
</div>

</body>
</html>