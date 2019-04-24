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
<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	#stateInfo{
		margin-top:10px;
	}
	#stateInfo span{
		margin-right:30px;
	}
	#handlingState{
		float:right;
	}
	#apply table{
		margin-top:10px;
		width:800px;
	}
	#apply table td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:30px;
	}
	#firstTable tr td:nth-child(1){
		border-right:1px solid grey;
		background-color:#F2F5F7;
	}
	#secondTable tr td:nth-child(1){
		border-right:1px solid grey;
	}
	table tr td:nth-child(1) strong{
		float:right;
		margin-right:10px;
	}
	#secondTable tr td:nth-child(2){
		padding:10px;
	}
	table tr td:nth-child(2) span{
		margin-left:10px;
		width:200px;
	}
	table tr td:nth-child(2) div:nth-child(2){
		width:100px;
		border-left:1px solid grey;
		border-right:1px solid grey;
	}
	table tr td:nth-child(3){
		width:100px;
		border-left:1px solid grey;
		border-right:1px solid grey;
		background-color:lightgrey;
		text-align:center;
	}
	table tr td:nth-child(4){
		padding-left:10px;
	}
	table td div{
		display:inline-block;
	}
	#contentWrite{
		position:relative;
		top:2px;
		height:100%;
	}
	#imgtd{
		padding:9px;
		line-height:23px;
	}
	#imgtd button{
		float:right;
		margin-right:30px;
	}
	button{
		background-color:white;
	}
	#secondTable tr td:first-child{
		width:220px;
	}
	#submitDiv{
		margin-top:10px;
		text-align:center;
	}
	#submitDiv button{
		width:80px;
	}
	#delete{
		float:right;
		position:relative;
		right:10px;
	}
	textarea{
		resize:none;
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
				<a href = "orderExchange"><span class = "activeMenu">교환</span></a>
				<a href = "orderRefund"><span>환불</span></a>	
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/orderheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 교환 > 상세보기</p>
			</div>
		<form id = "exchangeForm" action = "exchangeSave" method = "post">
			<div id = "apply">
				<div id = "stateInfo">
					<span>접수일: <fmt:formatDate value = "${exchange.excRequestDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
					<span>처리 완료일 : <c:choose><c:when test = "${exchange.excCompleteDate!=null}">${exchange.excCompleteDate}</</c:when><c:otherwise>-</c:otherwise></c:choose></span>
					<span id = "handlingState">
						<span>처리 상태</span>
						<select id = "odState" name = "select">
							<option>처리전</option>
							<option>처리완료</option>
						</select>			
					</span>
				</div>
				<div>
					<table id = "firstTable">
						<tr>
							<td>						
								<strong>주문번호</strong>
							</td>
							<td colspan = "3">
								<span>${exchange.ordNum}</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>신청 ID</strong>
							</td>
							<td>
								<div>
									<span>${exchange.user.userId}</span>
								</div>															
							</td>
							<td>
								<div>
									<strong>신청자명</strong>
								</div>															
							</td>
							<td>
								<div>
									<span>${exchange.user.userName}</span>
								</div>															
							</td>														
						</tr>
						<tr>
							<td>						
								<strong>휴대폰 번호</strong>
							</td>
							<td colspan = "3">
								<span>${exchange.user.userPhone}</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>상품</strong>
							</td>
							<td colspan = "3">
								<span>${exchange.goods[0].godName}
										<c:if test = "${(fn:length(exchange.goods)-1) != 0}">
											외 ${fn:length(exchange.goods)-1}건
										</c:if>
								</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>사유 선택</strong>
							</td>
							<td colspan = "3">
								<span>${exchange.reaName}</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>내용 작성</strong>
							</td>
							<td colspan = "3" id = "tdcontentWrite">
								<textarea id = "contentWrite" cols="90" rows="5" name = "content">${exchange.excContent}</textarea>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>이미지</strong>
							</td>
							<td id = "imgtd" colspan = "3">
								<c:forEach var = "url"  items = "${exchange.images}" varStatus = "state">
									<span>${url.exchangeImageUrl}</span><br>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>배송비 결제 금액</strong>
							</td>
							<td colspan = "3">
								<span>2500원</span>
							</td>
						</tr>
					</table>
					<table id = "secondTable">
						<tr>
							<td>						
								<strong>처리 사항 메모</strong>
							</td>
							<td>
								<textarea name = "memo" cols="87" rows="5"placeholder= "처리 사항을 작성해주세요">${exchange.excMemo}</textarea>
							</td>
						</tr>
					</table>
					<div id = "submitDiv">
						<button id = "save" type = "submit">저장</button>
						<button id = "cancel" type = "button">취소</button>
						<button id = "delete" type = "button">삭제하기</button>
					</div>
				</div>
			</div> 
		</form>
	</div>
</div>
</div>

<script type = "text/javascript">
	$(function(){
		var state = "${exchange.excState}";
		var current = $("#odState option");
		$.each(current,function(index,item){
			if($(item).val()==state){
				$(item).prop("selected",true);
			}
		})
	})
	
	$("#exchangeForm").submit(function(){
		var ordNum = "${exchange.ordNum}";
		var $input = $("<input></input>");
		$input.attr({
			"type":"text",
			"name":"ordNum"
		});
		$input.val(ordNum);
		$input.css("display","none");
		$("#exchangeForm").append($input);		
	})
	
		$("#cancel").click(function(){
			Swal.fire({
				  title: '작성을 취소하시겠습니까?',
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
					window.location.href = "/shoppingmall/admin/orderExchange";
				  }
				})			
		})
		
		$("#delete").click(function(){
			Swal.fire({
				  title: '신청서를 삭제하시겠습니까?',
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
					  $("#exchangeForm").attr("action","orderExchangeDelete");
					  $("#exchangeForm").submit();
				  }
				})			
		})
</script>

</body>
</html>