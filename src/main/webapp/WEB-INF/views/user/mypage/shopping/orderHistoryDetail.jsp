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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#content > strong{
		font-size:20px;
	}
	#content > hr{
		margin:10px 0 10px 0;
	}
	#content{
		width:1100px;
	}
	#navbar{
		display: inline-block;
	    float: left;		
	}
	#nav{
		width:160px;
		height:470px;
		border:1px solid grey;
		float:left;
	}
	#nav hr{
		margin:5px;
	}
	#nav #navTitle{
		width:100%;
		height:40px;
		text-align:center;
		font-weight:bold;
		padding:10px 5px 5px 5px;
		border-bottom:1px solid grey;
		background-color:#F2F5F7;
	}
	#nav #navContent{
		padding:5px;
	}
	#nav #navContent div{
		line-height:30px;
		margin-bottom: 10px;
	}
	#nav #navContent div > a{
		display:block;
		padding-left:10px;
		color:black;
	}
	#nav #navContent > p{
		font-weight:bold;
	}
	#navContent > a{
		color:black;
		font-weight:bold;
	}
	#nav #navContent div > .activeMenu{
		color:red !important;
	}
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#completeAnOrder p{
		margin-bottom:2px;
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
	#content #tableDiv >div:not(#styleShop){
		padding:10px;
	}
	#content  #tableDiv>div:not(#styleShop) table{
		width:800px;
		margin:10px 0 20px 0;
	}
	#content #tableDiv >div:not(#styleShop)	table tr td{
		border:1px solid grey;
		height:40px;
	}
	#content #tableDiv >div:not(#styleShop) table tr td:first-child{
		width:100px;
		text-align:right;
	}
	#content #tableDiv >div:not(#styleShop) table tr td:first-child span
	{
		margin-right:10px;
		font-weight:bold;
	}
	#content #tableDiv >div:not(#styleShop) table tr td:last-child span{
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
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/userheader.jsp" %>
	<div id = "content">
		<div id = "navbar">
			<div id="nav">
				<div id="navTitle">
					<span>마이 페이지</span>
				</div>
				<div id="navContent">
					<p>쇼핑 이용 정보</p>
					<hr>
					<div>
						<a href = "#" class= "activeMenu"><span onclick = "location.href = '01.html'">> 주문 내역</span></a>
						<a href = "#"><span onclick = "location.href='04.html'">> 장바구니</span></a>
						<a href = "#"><span onclick = "location.href = '05.html'">> 포인트 이용 내역</span></a>
					</div>
					<p>게시판 이용 내역</p>
					<hr>
					<div>
						<a href = "#"><span onclick = "location.href = '../BOARD/01.html'">> 1:1 문의</span></a>
						<a href = "#"><span onclick = "location.href = '../BOARD/04.html'">> 나의 상품평</span></a>
						<a href = "#"><span onclick = "location.href = '../BOARD/05.html'">> 나의 상품 문의</span></a>
					</div>
					<p>개인정보 수정</p>
					<hr>
					<div>
						<a href = "#"><span onclick = "location.href = '../MYINFO/02.html'">> 개인정보 수정</span></a>
						<a href = "#"><span onclick = "location.href = '../MYINFO/03.html'">> 비밀번호 변경</span></a>
					</div>
					<a href = "#"><span onclick = "location.href = '../MYINFO/04.html'">회원탈퇴</span></a>
				</div>
			</div>		
		</div>
		<div id = "tableDiv">
		<strong>&#124;&nbsp;주문 내역</strong>
			<div id = "completeAnOrder">
				<p><strong>주문이 완료되었습니다.이용해 주셔서 감사합니다.</strong></p>
				<p><span>주문 내역은 [마이 페이지 > 주문내역/배송조회]에서 다시 확인할 수 있습니다.</span>
			</div>
			<hr>
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
								<img src = "upload/${goods.godListImageUrl}">
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
				<button class = "btn btn-default">주문내역/배송조회 확인</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/styleshop1I1IAll'">쇼핑 계속하기</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/'">메인으로 가기</button>
				<button class = "btn btn-default" onclick = "location.href='/shoppingmall/logout'">로그아웃</button>
			</div>
	</div>
</div>
</div>
	
	<div class = "modal fade" id  ="mySmallModal">
		<div class = "modal-dialog">
			<div class ="modal-content">
				<div class = "modal-body">
					<div id = "inquiry">
						<strong>&#124;&nbsp; 배송 조회</strong>
						<button type = "button" class = "close" data-dismiss = "modal">X</button>
						<div>
							<table id = "firstTable">
								<thead>
									<tr>
										<th>택배사</th>
										<th>송장번호</th>
										<th>보내는사람</th>
									</tr>
								</thead>
								<tbody id = "dvInfo">

								</tbody>
							</table>
						</div>
					</div>
					<div id = "state">
						<strong>&#124;&nbsp; 배송 상황</strong>
						<div>
							<table id = "secondTable">
								<thead>
									<tr>
										<th>날짜</th>
										<th>송장위치</th>
										<th>배송상태</th>
										<th>연락처</th>
									</tr>
								</thead>
								<tbody id = "dvData">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
<script type = "text/javascript">

</script>	
	
</body>
</html>