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
<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<style>
	#AllContent button,input{
		height:25px;
		line-height:3px;
	}
	#orderBox{
		height:50px;
		border-radius:10px;
		background-color:#F2F5F7;
		margin:5px 0px 20px 0px;
	}
	#orderBox div{
		height:50px;
		padding-top:8px;
		padding-left:10px;
	}
	#orderBox #firstLine div{
		display:inline-block;
		float:left;
		width:33%;
		padding-bottom:5px;
	}
	#orderitem{
		margin-bottom:10px;
	}
	#deliveryForm div{
		margin-top:10px;
		display:inline-block;
	}
	#deliveryForm div:nth-child(1) .form-control,#deliveryForm div:nth-child(2) .form-control{
		display:inline-block;
		font-size:12px;
		width:90px;
		padding:2px;
	}
	#deliveryForm div:nth-child(2) button{
		height:34px;
		position:relative;
		bottom:1px;
	}
	#deliveryForm div:nth-child(2){
		float:right;
	}
	#deliveryForm b{
		margin-right:10px;
	}
	#orderitem table{
		width:100%;
		text-align:center;
	}
	#orderitem table tr{
		border:1px solid lightgrey;
		height:30px;
	}
	#orderitem table th{
		text-align:center;
		margin-left:10px;
	}
	.br{
		margin-top:10px;
	}
	select{
		width:80px;
	}
	.item{
		width:300px;
		line-height:28px;
	}
	.item div{
		display:inline-block;
		margin:5px;
		float:left;
	}
	.item > div:first-child{
		width:150px;
	}
	.item > div:last-child{
		width:100px;
		text-align:left;
	}
	.item div > div{
		text-align:left;
	}
	.item strong{
		margin-right:5px;
	}
	.itemName{
		float:left;
		margin-right:5px;
	}
	.image{
		width:80px;
		height:100px;
		margin:10px;
		display:inline-block;
	}
	.image img{
		width:auto;
		height:100px;
	}
	.left1{
		position:relative;
		right:1px;
	}
	.left2{
		position:relative;
		right:8px;		
	}
	#itemOption strong{
		float:left;
	}
	.buyerInfo table{
		width:700px;
		height:50px;
		margin-bottom:10px;
	}
	.buyerInfo2  tr  td:nth-child(1){
		width:120px;
	}
	#submitForm .buyerInfo2 tr:nth-child(3) td:nth-child(2) div{
		display:inline-block;
		float:left;
	}
	#submitForm .buyerInfo2 tr:nth-child(3) td:nth-child(2) div input{
		width:150px;
	}
	#submitForm .buyerInfo2 tr:nth-child(3) td:nth-child(2) div:nth-child(1),
	#submitForm .buyerInfo2 tr:nth-child(3) td:nth-child(2) div:nth-child(3),
	#submitForm .buyerInfo2 tr:nth-child(3) td:nth-child(2) div:nth-child(5){
		width:150px;
	}
	.buy1{
		text-align:right;
		padding-right:10px;
		font-weight:bold;
	}
	.buy2{
		padding-left:10px;
	}
	.phone input{
		width:80px;
	}
	.buyerInfo2  tr  td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	.buy1{
		text-align:right;
		border-right:1px solid grey;
		width:120px;
		padding:10px;
		font-weight:bold;
	}
	.buy2{
		padding:10px;
	}
	#userPostcode{
		width:150px;
		margin-bottom:8px;
		margin-right:10px;
	}
	#addressBtn{
		border-radius:5px;
		background-color:white;
		height:25px;
		padding:0;
		position:relative;
		bottom:2px;
	}
	#userStreet{
		width:300px;
	}
	#userDetailArea{
		width:180px;
	}
	.phone input{
		width:80px;
	}
	#deilveryRequest{
		width:500px;
		height:50px;
	}
	
	.right{
		float:right;
		position:relative;
		right:60px;
	}
	.right span{
		color:grey;
	}
	.br{
		margin-top:10px;
	}
	#paymentWindow > div{
		margin-top:10px;
		width:320px;
		height:200px;
		display:inline-block;
		margin:10px;
	}
	.divLeft{
		width:45%;
		float:left;
		box-sizing:border-box;
	}
	.divRight{
		width:45%;
		float:right;
		box-sizing:border-box;
	}
	.paymentRight div{
		margin:10px 0px 0px 0px;
	}
	#paymentWindow table{
		margin-top:10px;
		width:330px;
	}
	#paymentWindow tr td{
		border-top:2px solid grey;
		border-bottom:2px solid grey;
		height:33px;
	}
	#paymentWindow td:first-child{
		text-align:right;
		padding-right:10px;
		width:110px;
	}
	#paymentWindow:first-child{
		margin-right:20px;
	}
	#logDiv{
		position:relative;
		right:10px;
	}
	#manage > div{
		margin-top:10px;
		width:320px;
		height:175px;
		display:inline-block;
		margin:10px;
	}
	#manage textarea{
		line-height:23px;
	}
	#submitDiv{
		text-align:center;
	}
	#submitDiv input{
		width:100px;
		margin-right:5px;
	}
	#submitDiv button{
		width:100px;
		margin-left:5px;
		position:relative;
		left:12px;
	}
	textarea{
		resize:none;
	}
	/* modal시작 */
	.modal-content{
		width:500px;
	}
	#inquiry,#state{
		margin-top:10px;
	}
	#inquiry > div,
	#state > div{
		padding:10px;
	}
	.modal-body table{
		width:440px;
	}
	.modal-body table tr th,
	.modal-body table tr td{
		text-align:center;
		height:22px;
	}
	.modal-body table thead tr{
		background-color:#F2F5F7;
	}
	.modal-body table tr td,
	.modal-body table tr th{
		border:1px solid grey;
	}
	.modal-footer{
		text-align:center;
	}
	.modal-footer button{
		width:100px;
		padding:0;
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
				<p id = "currentIdx">&#124; 주문관리 > 스타일 숍 주문 > 상세보기</p>
			</div>
			<div id = "deliveryForm">
				<div>
					<b>주문 처리 상태</b>
					<select id = "odState" class = "form-control">
						<option>배송준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
						<option>주문취소</option>
					</select>
				</div>
				<div>
					<span id="tekbeCompnayName">택배회사명: </span>
					<select id="tekbeCompnayList" class = "form-control" name="tekbeCompnayList"></select>
					<input id = "dvNumber" class = "form-control" type = "text" name = "deliveryNumber" placeholder = "운송장번호 입력">
					<button id = "search" class = "form-control">배송 조회</button> 
					<button id = "odcancel" class = "form-control">주문 취소하기</button>		
				</div>
			</div>
				<div id = "orderBox">
					<div id = "firstLine">
						<div>
							<b>주문일 : </b><span><fmt:formatDate value = "${purchase.order.ordDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>					
						</div>
						<div>
							<b>주문고객 : </b><span>${purchase.order.user.userName} (${purchase.order.user.userId})</span>
						</div>
						<div>
							<b>주문번호 : </b><span>${purchase.ordNum}</span>
						</div>			
					</div>
				</div>
				<c:set var = "totalprice" value = "0" />
				<div id = "orderitem">
				<strong>&#124; 주문 상품</strong>
					<table class = "br">
						<tr>
							<th>상품번호</th>
							<th>상품사진</th>
							<th>상품 정보</th>
							<th>수량</th>
							<th>합계 금액</th>
							<th>적립금액</th>
						</tr>
						<c:forEach  var = "product" items= "${purchase.goods}" varStatus = "state">
						<c:set var = "total" value = "0" />
						<tr>
							<td>
								<span class = "number">${product.godNum}</span>
							</td>
							<td>
								<div class = "image">
									<img src = "<c:url value = "${product.godListImageUrl}" />">
								</div>
							</td>
							<td class = "item">
								<div>
									<strong class = "itemName">상품명</strong>
									<span>${product.godName}</span>
									<c:forEach  var = "option" items= "${purchase.goodsOption}" varStatus = "state">
									<c:if test = "${product.godNum == option.godNum}">
									<br>
									<strong class = "itemName">${option.optName}</strong>
									<span>${option.optContent}</span>
									</c:if>
									</c:forEach>						
								</div>
								<div>
									<span>${product.godSellingPrice}원</span>
									<c:forEach  var = "option" items= "${purchase.goodsOption}" varStatus = "state">
									<c:if test = "${product.godNum == option.godNum}">
									<br>
									<c:set var = "total" value = "${(total + option.optPrice)}" />
									<span>${option.optPrice}원</span>
									</c:if>
									</c:forEach>					
							</div>						
						</td>
						<td>
							<strong>${product.godAmount}</strong>
							<span>개</span>					
						</td>
						<td>
						<c:set var = "totalprice" value = "${((totalprice+(total+product.godSellingPrice)*product.godAmount))}" />
						<c:set var = "totalPoint" value = "${((total+product.godSellingPrice)*product.godAmount)}" />
							<span><c:out value = "${((total+product.godSellingPrice)*product.godAmount)}원" /></span>
						</td> 
						<td>
							<fmt:parseNumber var = "price" value ="${(totalPoint/savePoint.savePointPercent)}" />
							<strong>${price}원</strong>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<br>
				<strong>&#124; 배송 정보</strong>
				<div class = "br"></div>
				<strong>주문자 정보</strong>	
				<form class = "buyerInfo" >
					<table>
						<tr>
							<td>
								<table class = "buyerInfo2">
									<tr>
										<td class = "buy1">이름</td>
										<td class = "buy2"><input type = "text"  name = "name" value = "${purchase.order.user.userName}" readonly /></td>
									</tr>
									<tr>
										<td class = "buy1">휴대폰 번호</td>
										<td class = "buy2 phone">
											<input type = "tel"  name = "phone1" value = "${fn:split(purchase.order.user.userPhone,'-')[0]}" readonly />&#45;
											<input type = "tel"  name = "phone2" value = "${fn:split(purchase.order.user.userPhone,'-')[1]}" readonly />&#45;
											<input type = "tel"  name = "phone3" value = "${fn:split(purchase.order.user.userPhone,'-')[2]}" readonly />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
	<strong>&#124; 수령자 정보</strong>
	<div class = "br"></div>
	<form id = "submitForm" class = "buyerInfo" action = "orderModify" method="post">
		<table>
			<tr>
				<td>
					<table class = "buyerInfo2">
						<tr>
							<td class = "buy1">이름</td>
							<td class = "buy2"><input id = "userName" type = "text"  name = "userName" value = "${purchase.order.recipientName}"/></td>
						</tr>
						<tr>
							<td class = "buy1">주소</td>
							<td class = "buy2 address">
								<div>
									<input id = "userPostcode" type = "text" name = "userPostcode" value = "${purchase.order.shaPostCode}"  disabled/>
									<a id = "addressBtn" class="btn btn-default" onclick="showPostcode()">우편번호 검색</a>
								</div>
								<div>
									<input id = "userStreet" type = "text" name = "userStreet"  value = "${purchase.order.shaStreet}"  disabled />
									<input id = "userDetailArea" type = "text" name = "userDetailArea"  value = "${purchase.order.shaDetailArea}"  />							
								</div>
							</td>
						</tr>
						<tr>
							<td class = "buy1">휴대폰 번호</td>
							<td class = "buy2 phone">
							<div>
								<input id = "phone1" type = "tel"  name = "phone1" value = "${fn:split(purchase.order.recipientPhone,'-')[0]}"  />
							</div>
							<div>
								<span>-</span>
							</div>
							<div>
								<input id = "phone2" type = "tel"  name = "phone2" value = "${fn:split(purchase.order.recipientPhone,'-')[1]}"  />
							</div>
							<div>
								<span>-</span>
							</div>
							<div>
								<input id = "phone3" type = "tel"  name = "phone3" value = "${fn:split(purchase.order.recipientPhone,'-')[2]}"  />
							</div>
							</td>
						</tr>
						<tr>
							<td class = "buy1">배송 요청사항</td>
							<td class = "buy2">
								<div>
									<input id = "deilveryRequest" type = "text" name = "deilveryRequest" value = "${purchase.order.deliveryRequest}" onkeyup="chkword(this,100)" />						
								</div>
								<div class = "right">
									<span id = "currentByte">0자 </span><b> /100자</b>	
								</div>
							</td>
						</tr>
				</table>
			<tr>
				<c:set var = "dvPrice" value = "0" />
				<td id = "price">	
					<strong>&#124; 결제 정보</strong>
					<div id = "paymentWindow">
						<div class = "divtLeft">
							<strong>결제 방법 및 금액</strong>
							<table>
								<tr>
									<td>
										<strong>상품가격</strong>
									</td>
									<td>
										<strong>${totalprice}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>포인트 사용</strong>
									</td>
									<td>
										<strong>
											${purchase.order.usingPoint}원
											<c:set var = "usingPoint" value = "${purchase.order.usingPoint}" />
										</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>배송료</strong>
									</td>
									<td>
										<strong>
											<c:if test = "${totalprice >= delivery.freedeliveryMp}" >
												0원
											</c:if>
											<c:if test = "${totalprice < delivery.freedeliveryMp}" >
												${delivery.basicFee}원
												<c:set var = "dvPrice" value = "${delivery.basicFee}" />
											</c:if>
										</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>총 결제 금액</strong>
									</td>
									<td>
										<strong>${(totalprice+dvPrice)-usingPoint}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>결제 방법</strong>
									</td>
									<td>
										<strong>${purchase.order.paymentMethod}</strong>
									</td>
								</tr>
							</table>
						</div>
						<div class = "divRight">
							<strong>결제 로그</strong>
							<div class = "br"></div>
							<textarea cols = "44" rows = "8" readonly>
결제요청 결과

결과 코드 : ${purchase.order.ordResultCode}

결과 내용 : ${purchase.order.ordResultContent}

결제 방법 : ${purchase.order.paymentMethod}
							</textarea>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<strong>&#124; 관리</strong>
					<div id = "manage">
						<div class = "divLeft">
							<strong>관리 이력</strong>
							<div class = "br"></div>
							<textarea cols = "44" rows = "6" readonly><c:forEach  var = "mlc" items= "${purchase.order.mlc}" varStatus = "state"><fmt:formatDate value = "${mlc.mlcDate}" pattern = "YYYY-MM-dd HH:mm:ss" /> : ${mlc.mlcContent}
</c:forEach></textarea>		
						</div>
						<div class = "divRight">
							<strong>상담 메모</strong>
							<div class = "br"></div>
							<textarea id = "memo" name = "memo" cols = "44" rows = "6">${purchase.order.memoContent}</textarea>		
						</div>				
					</div>			
				</td>
			</tr>
			<tr>
				<td>
					<div id = "submitDiv">
						<input type = "submit" value = "저장" />
						<button id = "cancel">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
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
function showPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("userStreet").value = extraAddr;
            
            } else {
                document.getElementById("userStreet").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("userPostcode").value = data.zonecode;
            document.getElementById("userStreet").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("userDetailArea").focus();
        }
    }).open();
}

$(function(){
	var myKey = "CNNwgI5GMTrF5mVZFy5M2g"; // sweet tracker에서 발급받은 자신의 키 넣는다.
	
		// 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
            		
            		// 방법 1. JSON.parse 이용하기
            		var parseData = JSON.parse(JSON.stringify(data));
            		
            		// 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
            		var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
            		
            		var myData="";
            		$.each(CompanyArray,function(key,value) {
	            			myData += ('<option value='+value.Code+'>'+ value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// 배송정보와 배송추적 tracking-api
        $("#search").click(function() {
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#dvNumber').val();
        	var name = $("#tekbeCompnayList option:selected").text();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	  				
	            		myInvoiceData += ('<td>'+name+'</td>');     				               				
	            		myInvoiceData += ('<td>'+data.invoiceNo+'</td>');     				        	 				
	            		myInvoiceData += ('<td>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');      		
                	}
        			
                	
                	$("#dvInfo").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#dvData").html(myTracking);
                	
            		$("#mySmallModal").modal();
                }
            });
        });		
});

    $(function(){
	var select = $("#deliveryForm > div:nth-child(1) > select option");
	$.each(select,function(index,item){
			var type = "${purchase.order.ordType}";
			if($(item).text() == type){
				$(item).prop("selected",true);
			}
	})
	$("#deilveryRequest").trigger("keyup");
    })

function chkword(obj, maxByte) {
	 
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";
    if(strValue == ""){
    	$("#currentByte").text("0");
    }

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }
        $("#currentByte").text(totalByte);

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: maxByte + '자를 초과할수는 없습니다.',
			  showConfirmButton: false,
			  timer: 1500
			});
		$("#overlabCK").prop("checked",false);
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}
    
	$.validator.addMethod(
			"usernameck",
			function(value,element){
				return this.optional(element)
					|| /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(value);
			}
		);

		$(function() {
				$("#submitForm").validate({
					rules : {
						userName : {
							required : true,
							minlength : 2,
							maxlength : 5,
							usernameck : true
						},
						phone1 : {
							required : true,
							maxlength : 3,
						},
						phone2 : {
							required : true,
							maxlength : 4,
						},
						phone3 : {
							required : true,
							maxlength : 4,
						},
					},
					messages : {					
						userName : {
							required : function(){
								return "이름을 입력하세요";
							},
							minlength : function(){
								return "2글자 이상으로 입력하세요."
							},
							maxlength : function(){
								return "5글자 이하로 입력하세요.";
							},
							usernameck : function(){
								return "한글로 입력하세요";
							}
						},
						phone1 : {
							required : function(){
								return "번호를 입력하세요";
							},
							maxlength : function(){
								return "3자 이하로 입력";
							}
						
						},
						phone2 : {
							required : function(){
								return "번호를 입력하세요";
							},
							maxlength : function(){
								return "4자 이하로 입력";
							}
						
						},
						phone3 : {
							required : function(){
								return "번호를 입력하세요";
							},
							maxlength : function(){
								return "4자 이하로 입력";
							}
						}
					},
				})		
		});
		
	var submit = function(title,Type){
		$.ajax({
			url:"modifyOrder",
			method:"post",
			data: {
				ordType:Type,
				ordNum:$("#firstLine div:nth-child(3) span").text(),
				deliveryRequest:$("#deilveryRequest").val(),
				userName:$("#userName").val(),
				userPostCode:$("#userPostcode").val(),
				userStreet:$("#userStreet").val(),
				userDetailArea:$("#userDetailArea").val(),
				phone1:$("#phone1").val(),
				phone2:$("#phone2").val(),
				phone3:$("#phone3").val(),
				memo:$("#memo").val()
			},
			success:function(data){
				if(data == true){
					Swal.fire({
						  position: 'top',
						  type: 'success',
						  title: title,
						  showConfirmButton: false,
						  timer: 1500
						});					
				}else{
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: "이미 취소된 주문입니다",
						  showConfirmButton: false,
						  timer: 1500
						});							
				}
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '저장을 실패하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	}
		
		$("#submitForm").submit(function(e){
			e.preventDefault();
			var text = $(".buyerInfo2 label");
			var trigger = 'Y';
			if(text.length != 0){
				$.each(text,function(index,item){
					if($(item).text() != ''){
						trigger = 'N';
					}
				})
			}
			if(trigger == 'Y'){
				submit('저장을 성공했습니다.',$("#odState option:selected").val());
			}
		})
		
	$("#odcancel").click(function(){
		submit('취소를 성공했습니다.','주문취소');
	})
	
	
	$("#cancel").click(function(e){
		e.preventDefault();
		Swal.fire({
			  title: '수정을 취소하시겠습니까?',
			  type: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.value) {
				location.href="/shoppingmall/admin/orderListOne1";
			  }
			})
	})
</script>
</body>
</html>