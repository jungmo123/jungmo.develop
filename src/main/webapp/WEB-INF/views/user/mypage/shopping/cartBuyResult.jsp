<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	#completeAnOrder p{
		margin-bottom:2px;
	}
	#content{
		width:800px;
		margin-bottom: 100px;
	}
	#styleShop{
		margin-bottom:10px;
	}
	#styleShop table{
		width:100%;
		text-align:center;
	}
	#styleShop table tr{
		border:1px solid lightgrey;
		height:30px;
	}
	#styleShop table th{
		text-align:center;
	}
	#styleShop table td:nth-child(1){
		width:50px;
		text-align:center;
	}
	#styleShop table td:nth-child(2){
		width:150px;
		text-align:center;
	}
	#styleShop table td:nth-child(3){
		width:250px;
		line-height:28px;
		text-align:left;
	}
	#styleShop table td:nth-child(4){
		width:110px;
	}
	#styleShop table td:nth-child(5){
		width:121px;
	}
	#styleShop table td:nth-child(6){
		width:150px;
	}
	.br{
		margin-top:10px;
	}
	select{
		width:80px;
	}
	.item{
		width:300px;
		line-height:25px;
		text-align:left;
	}
	.item > div > div{
		width:300px;
		text-align:left;	
	}
	.item > div div:nth-child(1){
		width:300px;
		text-align:left;
	}
	.item > div div:nth-child(2){
		float:left;
		height:56px;
	}
	.item > div > div span:nth-child(2){
		float:right;
	}
	.item strong{
		margin-right:5px;
	}
	.itemName{
		float:left;
		margin-right:5px;
	}
	.image{
		width:90px;
		height:120px;
		margin:10px;
		display:inline-block;
	}
	#itemOption strong{
		float:left;
	}
	#content >div:not(#styleShop){
		padding:10px;
	}
	#content >div:not(#styleShop) table{
		width:800px;
		margin:10px 0 20px 0;
	}
	#content >div:not(#styleShop)	table tr td{
		border:1px solid grey;
		height:40px;
	}
	#content >div:not(#styleShop) table tr td:first-child{
		width:100px;
		text-align:right;
	}
	#content >div:not(#styleShop) table tr td:first-child span
	{
		margin-right:10px;
		font-weight:bold;
	}
	#content >div:not(#styleShop) table tr td:last-child span{
		margin-left:10px;
	}
	#buttonGroup{
		text-align:center;
	}
	#content #buttonGroup button{
		margin-left:20px;
		font-weight:bold;
	}
	#content #buttonGroup button:not(:nth-child(1)){
		width:164px;
	}
	.image img{
		width:90px;
		height:120px;
	}
	#request{
    	padding: 10px;	
	}
</style>
<body>
	<div class="container">
		<%@ include file = "../../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<strong>&#124;&nbsp;주문완료</strong>
			<hr>
			<div id = "completeAnOrder">
				<p><strong>주문이 완료되었습니다.이용해 주셔서 감사합니다.</strong></p>
				<p><span>주문 내역은 [마이 페이지 > 주문내역/배송조회]에서 다시 확인할 수 있습니다.</span>
			</div>
			<div id="styleShop">
			<strong>&#124;&nbsp;주문번호 : </strong>
			<span>${purchase.ordNum}</span>
				<table class = "br">
					<tr>
						<th>번호</th>
						<th></th>
						<th>상품정보</th>
						<th>수량</th>
						<th>판매 가격</th>
						<th>적립금</th>
					</tr>
					<c:set var = "totalprice" value = "0" /> 
					<c:forEach var = "goods" items = "${purchase.goods}" varStatus = "state">
					<c:set var = "total" value = "0" /> 
					<tr>
						<td><span class="number">${state.index+1}</span></td>
						<td>
							<div class="image">
								<img src = "../upload/${goods.godListImageUrl}">
							</div>
						</td>
						<td class="item">
							<div>
								<div>
									<strong>${goods.godcName}</strong>
								</div>
								<div>
									<span>${goods.godName}</span>
									<span><fmt:formatNumber value="${goods.godSellingPrice}" pattern="#,###" />원</span>
									<c:set var = "total" value = "${goods.godSellingPrice}" />
								</div>
								<c:forEach var = "option" items = "${goods.godoList}">
								<div>
									<span>${option.optName} : ${option.optContent}</span>
									<span><fmt:formatNumber value="${option.optPrice}" pattern="#,###" />원</span>
									<c:set var = "total" value = "${(total + option.optPrice)}" />
								</div>
								</c:forEach>
							</div>
						</td>
						<td><strong>${goods.godAmount}</strong> <span>개</span></td>
						<c:set var = "total" value = "${(total*goods.godAmount)}" />
						<td><span><fmt:formatNumber value="${total}" pattern="#,###" />원
						</span></td>
						<fmt:parseNumber var = "saveP" value ="${total/pointPolicy.savePointPercent}" integerOnly = "true" />
						<td><strong>${saveP}</strong><span>P</span></td>
					</tr>
					<c:set var = "totalprice" value = "${(totalprice + total)}" />
					</c:forEach>
				</table>
			</div>
			<div id = "requesterInfo">
				<strong>&#124;&nbsp;주문자 정보</strong>
				<table>
					<tr>
						<td>
							<span>이름</span>
						</td>
						<td>
							<span>${purchase.userName}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>연락처</span>
						</td>
						<td>
							<span>${purchase.userPhone}</span>
						</td>
					</tr>
				</table>
			</div>
			<div id = "deliveryInfo">
			<strong>&#124;&nbsp;배송 정보</strong>
				<table>
					<tr>
						<td>
							<span>이름(회사)</span>
						</td>
						<td>
							<span>${purchase.recipientName}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>주소</span>
						</td>
						<td>
								<span>[${purchase.shaPostCode}]&nbsp;${purchase.shaStreet}&nbsp;${purchase.shaDetailArea}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>휴대폰</span>
						</td>
						<td>
							<span>${purchase.recipientPhone}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>요청사항</span>
						</td>
						<td>
							<div id = "request" style="white-space:pre;">${fn:trim(purchase.deliveryRequest)}</div>
						</td>
					</tr>
				</table>
			</div>
			<div id = "paymentInfo">
				<strong>&#124;&nbsp;배송 정보</strong>
				<table>
					<tr>
						<td>	
							<span>결제 방법</span>
						</td>
						<td>
							<span>${purchase.paymentMethod}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>결제 금액</span>
						</td>
						<td>
							<c:if test = "${deliveryPolicy.freeDeliveryMp <= totalprice}">
								<c:set var = "totalprice" value = "${(totalprice + purchase.usingPoint)}" />
							</c:if>
							<c:if test = "${deliveryPolicy.freeDeliveryMp > totalprice}">
								<c:set var = "totalprice" value = "${(totalprice + purchase.usingPoint + deliveryPolicy.basicFee)}" />
							</c:if>
							<span><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</span>
						</td>
					</tr>
				</table>
			</div>
			<div id = "buttonGroup">
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/mypage/orderHistory1'">주문내역/배송조회 확인</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/styleshop1I1IAll'">쇼핑 계속하기</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/'">메인으로 가기</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/logout'">로그아웃</button>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	</script>
</body>
</html>