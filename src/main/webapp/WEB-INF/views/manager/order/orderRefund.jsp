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
				<a href = "orderList"><span>스타일 숍 주문</span></a>
				<a href = "orderCancel"><span>주문 취소</span></a>
				<a href = "orderExchange"><span>교환</span></a>
				<a href = "orderRefund"><span class = "activeMenu">환불</span></a>	
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/orderheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 환불</p>
			</div>
			<div id = "search">
				<form id = "dateForm"  action = "Refundsearch" method = "post">
					<span>신청일</span>
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
							<select  name = "type" class = "form-control">
								<option value = "ord_num">주문번호</option>
							</select>
							<input class = "form-control" id = "textarea" type = "text" name = "Refundsearch" />
							<button class ="btn btn-default glyphicon glyphicon-search"></button>	
						</div>
					</div>
				</form>
			</div>
			<div id = "orderState">
				<span>&#124; 처리상태</span>
				<a href = "orderRefundOne1">처리 전</a>
				<span  class = "Y">&#124;</span>
				<a href = "orderRefundTwo1">처리 완료</a>
				<button id = "refundCheck" class = "btn btn-default download">처리완료 목록으로 이동</button>
			</div>
			<form id = "refundForm" action = "refundModify" method = "post">
			<div id = "resultbox">
				<table>
					<tr id = "Trheader">
						<th>선택</th>
						<th>신청일</th>
						<th>주문 번호</th>
						<th>상품명</th>
						<th>아이디</th>
						<th>이름</th>
						<th>처리 상태</th>
					</tr>
								<c:forEach  var = "ref" items= "${refund}" varStatus = "state">
										<c:set var = "totalprice" value = "0" />
										<tr>								
										<td><input type ="checkbox" name = "${ref.ordNum}" /></td>
										<td >${ref.refRequestDate}<br><fmt:formatDate value = "${ref.refRequestDate}" pattern = "HH:mm:ss" /></td>
										<td class = "itemNum">${ref.ordNum}</td>
										<td class = "itemName">${ref.goods[0].godName}
											<c:if test = "${(fn:length(ref.goods)-1) != 0}">
												외 ${fn:length(ref.goods)-1}건
											</c:if>
										</td>
										<td>${ref.user.userId}</td>
										<td>${ref.user.userName}</td>												
										<td>${ref.refState}</td>
										</tr>				
								</c:forEach>		
				</table>
			</div>
			</form>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "${pageMaker.prev}">
							<li><a href = "orderRefund${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
						</c:if>
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
							<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href = "orderRefund${type}${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test = "${pageMaker.next}">
							<li><a href = "orderRefund${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
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
	location.href="/shoppingmall/admin/RefundDetail" + name;
})
	
	$("#refundCheck").click(function(e){
		$("#refundForm").submit();
	})
	
		$("#refundForm").submit(function(e){
			var check = $("#resultbox table tr td input:checkbox:checked");
			var list = [];
			$(check).each(function(index,element){
				list.push($(element).attr("name"));
			})
			var $input = $("<input></input>");
			$input.attr({
				"name":"list"
			});
			$input.val(list);
			$input.css("display","none");
			$("#refundForm").append($input);
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

</script>
</body>
</html>