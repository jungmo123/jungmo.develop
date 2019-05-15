<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
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
	#resultbox tr th:nth-child(1){
		border-top:1px solid #878787;
		width:45px;
	}
	#resultbox tr th:nth-child(2){
		width:144px;
	}
	#resultbox tr th:nth-child(3){
		width:109px;
	}
	#resultbox tr th:nth-child(4){
		width:121px;
	}
	#resultbox tr th:nth-child(5){
		width:176px;
	}
	#resultbox tr th:nth-child(6){
		width:82px;
	}
	#resultbox tr th:nth-child(7){
		width:102px;
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
	.itemName{
		cursor:pointer;
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
				</span> <span>주문 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href = "orderList"><span class = "activeMenu">스타일 숍 주문</span></a>
				<a href = "orderCancel"><span>주문 취소</span></a>
				<a href = "orderExchange"><span>교환</span></a>
				<a href = "orderRefund"><span>환불</span></a>	
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/orderheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 스타일 숍 주문</p>
			</div>
			<div id = "search">
				<form id = "dateForm" action = "search" method = "post">
					<span>주문일</span>
					<div id = "input-group">
						<div id = "input1">
							<input type="date" name="date1" class="dateInput">
						</div>
						<span>~</span>
						<div id = "input2">
							<input type="date" name="date2" class="dateInput">	
						</div>
						<div id = "keyword">
							<span>키워드 검색</span>
							<select name = "type" class = "form-control">
								<option value = "ord_num">주문번호</option>
							</select>
							<input class = "form-control" id = "textarea" type = "text" name = "search" />
							<button class ="btn btn-default glyphicon glyphicon-search"></button>	
						</div>
					</div>
				</form>
			</div>
			<div id = "orderState">
				<span>&#124; 주문상태</span>
				<a href = "orderListOne1">배송 준비 중</a>
				<span  class = "Y">&#124;</span>
				<a href = "orderListTwo1">배송 중</a>
				<span  class = "Y">&#124;</span>
				<a href = "orderListThree1">배송 완료</a>
				<span  class = "Y">&#124;</span>
				<a href = "orderListAll1">주문 모두 보기</a>
			</div>
			<form id = "orderList" action = "dvModify" method="post">
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
						<c:forEach  var = "post" items= "${posts}" varStatus = "state">
								<c:forEach  var = "purchase" items= "${purchases}" varStatus = "state">
										<c:set var = "totalprice" value = "0" /> 
										<c:if test = "${post.postNum==purchase.ordNum}">
										<tr>								
										<td><input type ="checkbox" name = "${purchase.ordNum}" /></td>
										<td class = "itemNum">${purchase.ordNum}</td>
										<td>${purchase.order.ordType}</td>
										<td>${purchase.order.ordDate}<br><fmt:formatDate value = "${purchase.order.ordDate}" pattern = "hh:mm:ss" /></td>
										<td class = "itemName">${purchase.goods[0].godName}
											<c:if test = "${(fn:length(purchase.goods)-1) != 0}">
												외 ${fn:length(purchase.goods)-1}건
											</c:if>
										</td>
										<c:set var = "total" value = "0" />
										<td>${purchase.order.user.userName}<br>${purchase.order.user.userId}</td>
										<c:forEach var = "god" items = "${purchase.goods}" varStatus = "state">
											<c:forEach  var = "option" items= "${purchase.goodsOption}" varStatus = "state">
												<c:if test = "${option.ordNum == purchase.ordNum && option.godNum == god.godNum}" >
													<c:set var = "total" value = "${(total + option.optPrice)}" />
												</c:if>
											</c:forEach>
											<c:set var = "totalprice" value = "${((totalprice+(total+god.godSellingPrice)*god.godAmount))}" />
											<c:set var = "total" value = "0" />
										</c:forEach>
										<c:set var = "usingPoint" value = "${purchase.order.usingPoint}" />
										<c:set var = "dvPrice" value = "0" />
										<c:if test = "${totalprice-usingPoint < delivery.freedeliveryMp}" >
											<c:set var = "dvPrice" value = "${delivery.basicFee}" />
										</c:if>										
										<td><c:out value = "${(totalprice+dvPrice)-usingPoint}원" /></td>
										<c:set var = "total" value = "0" />
										</tr>						
										</c:if>
								</c:forEach>
						</c:forEach>
				</table>
			</div>
			<div id = "listOption">
				<span>선택한 항목</span>
				<select name = "dvState" class = "form-control">
					<option>배송준비중</option>
					<option>배송중</option>
					<option>배송완료</option>
					<option>주문취소</option>
				</select>
				<button class = "btn btn-default">목록으로 이동</button>
			</div>
			</form>
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
	$(function(){
		$("#orderList").submit(function(e){
			var check = $("#orderList table tr td input:checkbox:checked");
			var list = [];
			var select = $("#listOption select option:selected").val();
			console.log(select);
			$(check).each(function(index,element){
				list.push($(element).attr("name"));
			})
			var $input = $("<input></input>");
			$input.attr({
				"type":"text",
				"name":"list"
			});
			$input.val(list);
			$input.css("display","none");
			$("#orderList").append($input);
		})
		
		$("#dateForm").submit(function(e){
			if($("#dateForm #input1 input").val()=="" || $("#dateForm #input2 input").val()==""){
				Swal.fire({
					  position: 'top',
					  type: 'warning',
					  title: '날짜를 입력하세요!',
					  showConfirmButton: false,
					  timer: 1500
					});
				return false;
			}
		})
		
		$(".itemName").click(function(){
			var name = $(this).siblings(".itemNum").text();
			location.href="/shoppingmall/admin/orderDetail" + name;
		})
	})
</script>

</body>
</html>