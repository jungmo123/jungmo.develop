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
	#completeAnOrder span:nth-child(2),
	#completeAnOrder span:nth-child(4){
		margin-right:110px;
	}
	#styleShop{
		margin-bottom:10px;
		padding:10px;
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
		width:780px;
		margin:10px 0 20px 0;
	}
	#content #tableDiv >div:not(#styleShop)	table:not(#MdevlieryTable) tr td{
		border-top: 1px solid lightgrey;
		border-bottom: 1px solid lightgrey;
		height:40px;
	}
	#content #tableDiv >div:not(#styleShop)	table:not(#MdevlieryTable) tr td:nth-child(1){
		border-right: 1px solid lightgrey;
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
		margin-bottom: 100px;
	}
	#content #buttonGroup button{
		margin-left:20px;
		font-weight:bold;
		width:120px;
	}
	#content #buttonGroup button:nth-child(1){
		float:left;
	}
	#content #buttonGroup button:nth-child(2){
		float:right;
	}
	.image img{
		width:90px;
		height:120px;
	}
	#request{
    	padding: 10px;	
	}
	#modify,
	#complete{
	    float: right;
	    width: 50px;
	    height: 25px;	
	    padding:0;
	}
	#tableDiv > strong{
		margin-left:10px;
	}
	#MdevlieryTable{
		margin-top:10px;
	}
	#registerForm{
		margin-top:10px;
	}
	#MdevlieryTable{
		width:800px;
		margin-bottom:40px;
	}
	#MdevlieryTable tr td{
		border-top:1px solid lightgrey;
		border-bottom:1px solid lightgrey;
		height:40px;
	}
	#MdevlieryTable tr td:nth-child(1){
		border-right:1px solid lightgrey;
	}
	#MdevlieryTable tr td:first-child{
		width:100px;
		text-align:right;
	}
	#MdevlieryTable tr td:last-child span{
		margin-left:10px;
	}
	#MdevlieryTable tr td:last-child span:last-child{
		margin-left:0px;
	}
	#MdevlieryTable{
		margin-top:10px;
		margin-bottom:100px;
	}
	#MdevlieryTable tr td input{
		margin-left:10px;
	}
	#MdevlieryTable tr:nth-child(2)  td{
		height:70px;
	}
	#MdevlieryTable tr:nth-child(2)  td button{
		padding:0;
		width:100px;
		height:27px;
		position:relative;
		bottom:2px;
		margin-left:5px;
	}
	#MdevlieryTable tr:nth-child(2) div:nth-child(1) >  input[type='text']:nth-child(1){
		width:150px;
	}
	#MdevlieryTable tr:nth-child(2) div:nth-child(2) >  input[type='text']:nth-child(1){
		width:300px;
	}
	#MdevlieryTable tr:nth-child(3) input{
		width:80px;
	}
	#MdevlieryTable tr:nth-child(4) td:last-child{
		padding:10px;
	}
	#MdevlieryTable tr:nth-child(4) textarea{
		width:680px;
		height:100px;
		resize:none;
	}
	#MdevlieryTable tr:nth-child(4) div:last-child{
		float:right;
	}
	input[type='number']{
		text-align:center;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	#purchaseRequest{
		padding-left:10px;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/mypageHeader.jsp" %>
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
						<a href = "orderHistory1" class= "activeMenu"><span>> 주문 내역</span></a>
						<a href = "cart"><span>> 장바구니</span></a>
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
				<strong>주문 번호&nbsp;&nbsp;</strong><span>${purchase.ordNum}&nbsp;&nbsp;</span>
				<strong>주문 일&nbsp;&nbsp;</strong><span><fmt:formatDate value = "${purchase.ordDate}" pattern = "YYYY-MM-dd HH:mm:ss" />&nbsp;&nbsp;</span>
				<strong>주문/배송 상태&nbsp;&nbsp;</strong><span>${purchase.ordType}&nbsp;&nbsp;</span>
			</div>
			<hr>
			<div id="styleShop">
			<strong>&#124;&nbsp;구매 리스트</strong>
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
			<c:if test = "${purchase.ordType == '배송준비중' || purchase.ordType == '결제완료'}">
			<button id = "modify" type = "button" class = "btn btn-default">수정</button>
			<button id = "complete" type = "button" class = "btn btn-default" style = 'display:none'>완료</button>
			</c:if>
				<table id = "devlieryTable">
					<tr>
						<td>
							<span>이름(회사)</span>
						</td>
						<td>
							<span id = "purchaseName">${purchase.recipientName}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>주소</span>
						</td>
						<td>
								<span id = "purchaseAddress">[${purchase.shaPostCode}]&nbsp;${purchase.shaStreet}&nbsp;${purchase.shaDetailArea}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>휴대폰</span>
						</td>
						<td>
							<span id = "purchasePhone">${purchase.recipientPhone}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>요청사항</span>
						</td>
						<td>
							<div id = "purchaseRequest" style="white-space:pre;">${fn:trim(purchase.deliveryRequest)}</div>
						</td>
					</tr>
				</table >
				<form id = "registerForm">
				<table id = "MdevlieryTable" style = "display:none">
					<tr>
						<td>
							<span>이름(회사)</span>
						</td>
						<td>
							<input type = "text" id = "name" name = "name"  onkeyup="chkword(this,50,1)" value = "${purchase.recipientName}"/>
							<span id = "nameLength">0</span>
							<span>/25자</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>주소</span>
						</td>
						<td>
							<div>
								<input type = "text" id = "userPostcode" name = "userPostcode" value = "${purchase.shaPostCode}" readonly/>
								<button type = "button" class = "btn btn-default" onclick="showPostcode()">우편번호 검색</button>
							</div>
							<div>
								<input type = "text" id = "userStreet" name = "userStreet" value = "${purchase.shaStreet}" readonly/>
								<input type = "text" id = "userDetailArea" name = "userDetailArea" onkeyup="chkword(this,40,3)" value = "${purchase.shaDetailArea}"/>
							<span id = "addressLength">0</span>
							<span>/20자</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<span>휴대폰</span>
						</td>
						<td>
							<input type = "number" id = "phone1" name = "phone1" onkeyup="phoneCheck(this)" value = "${fn:split(purchase.userPhone,'-')[0]}" />
							<span>-</span>
							<input type = "number" id = "phone2" name = "phone2" onkeyup="phoneCheck(this)" value = "${fn:split(purchase.userPhone,'-')[1]}"  />
							<span>-</span>
							<input type = "number" id = "phone3" name = "phone3" onkeyup="phoneCheck(this)" value = "${fn:split(purchase.userPhone,'-')[2]}"  />
						</td>
					</tr>
					<tr>
						<td>
							<span>요청사항</span>
						</td>
						<td>
							<div>
								<textarea id = "request" name = "request" onkeyup="chkword(this,200,2)">${fn:trim(purchase.deliveryRequest)}</textarea>
							</div>
							<div>
								<span id = "requestLength">0</span>
								<span>/100자</span>
							</div>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div id = "paymentInfo">
				<strong>&#124;&nbsp;결제 방법 및 결제 금액</strong>
				<table>
					<tr>
						<td>	
							<span>상품 가격</span>
						</td>
						<td>
							<span><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</span>
						</td>
					</tr>
					<tr>
						<td>	
							<span>배송료</span>
						</td>
						<td>
							<span>
								<c:if test = "${deliveryPolicy.freeDeliveryMp <= totalprice}">
									무료
								</c:if>
								<c:if test = "${deliveryPolicy.freeDeliveryMp > totalprice}">
									<fmt:formatNumber value="${deliveryPolicy.basicFee}" pattern="#,###" />원
								</c:if>				
							</span>
						</td>
					</tr>
					<tr>
						<td>	
							<span>사용포인트</span>
						</td>
						<td>
							<span><fmt:formatNumber value="${purchase.usingPoint}" pattern="#,###" />원</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>결제 금액</span>
						</td>
						<td>
							<c:if test = "${deliveryPolicy.freeDeliveryMp <= totalprice}">
								<c:set var = "totalprice" value = "${(totalprice - purchase.usingPoint)}" />
							</c:if>
							<c:if test = "${deliveryPolicy.freeDeliveryMp > totalprice}">
								<c:set var = "totalprice" value = "${(totalprice - purchase.usingPoint + deliveryPolicy.basicFee)}" />
							</c:if>
							<span><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</span>
						</td>
					</tr>				
					<tr>
						<td>	
							<span>결제 방법</span>
						</td>
						<td>
							<span>${purchase.paymentMethod}</span>
						</td>
					</tr>
				</table>
			</div>
			<div id = "buttonGroup">
				<button class = "btn btn-default"  onclick = "location.href='/shoppingmall/mypage/orderHistory1'">목록</button>
				<c:if test = "${purchase.ordType == '배송준비중' || purchase.ordType == '결제완료'}">
				<button type = "button" id = "cancel" class = "btn btn-default" >주문 취소</button>
				</c:if>
				<c:if test = "${purchase.ordType == '배송중' || purchase.ordType == '배송완료'}">
				<button type = "button"  id = "reex" class = "btn btn-default">교환/환불</button>
				</c:if>
				<c:if test = "${purchase.ordType == '교환' || purchase.ordType == '환불'}">
				<button type = "button"  id = "rexxDetail" class = "btn btn-default">${purchase.ordType} 신청서 확인</button>
				</c:if>				
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
var ordType = "${purchase.ordType}"
var postCode = new Array();
var ordNum = "${purchase.ordNum}"
var ordName = "${purchase.goods[0].godName}"
var ordLength = "${fn:length(purchase.goods)-1}"
	$("#modify").click(function(){
		$("#modify").css("display","none");
		$("#complete").css("display","");
		$("#MdevlieryTable").css("display","");
		$("#devlieryTable").css("display","none");
	})
	
	function phoneCheck(id){
		var id = $(id).prop("id");
		if(id == "phone1"){
			var phone1 = $("#phone1").val();
			if(phone1.length > 3){
				phone1 = phone1.substr(0, 3);
				$("#phone1").val(phone1);
			}
		}else if(id == "phone2"){
			var phone2 = $("#phone2").val();
			if(phone2.length > 4){
				phone2 = phone2.substr(0, 4);
				$("#phone2").val(phone2);
			}
		}else{
			var phone3 = $("#phone3").val();
			if(phone3.length > 4){
				phone3 = phone3.substr(0, 4);
				$("#phone3").val(phone3);
			}			
		}
	}
	
	$("input[type='number']").keyup(function(){
		var point = $(this).val();
		if(point < 0){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '음수는 입력할 수 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
			$(this).val("");
		}
	})
	
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
                document.getElementById('userPostcode').value = data.zonecode;
                document.getElementById("userStreet").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userDetailArea").focus();
				$.each(postCode,function(index,item){
					if(item === data.zonecode){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '배송 불가 지역입니다.',
							  showConfirmButton: false,
							  timer: 1500
							});
						$("#userPostcode").val("");
						$("#userStreet").val("");
						$("#userDetailArea").val("");
					}
				})
            }
        }).open();
        if($("#userStreet-error").length > 0){
        	$(this).addClass("display","none");
        }
    }
	
	function chkword(obj, maxByte,cur) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalByte = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	    var current;
	    if(cur == 1){
	    	current = $("#nameLength");
	    }else if(cur == 2){
	    	current = $("#requestLength");
	    }else{
	    	current = $("#addressLength");
	    }
	    if(strValue == ""){
	    	$(current).text("0");
	    }

	    for (var i = 0; i < strLen; i++) {
	        oneChar = strValue.charAt(i);
	        if (escape(oneChar).length > 4) {
	            totalByte += 2;
	        } else {
	            totalByte++;
	        }
	        $(current).text(totalByte/2);

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
				  title: maxByte/2 + '자를 초과할수는 없습니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        chkword(obj, 4000);
	        $(current).text(maxByte/2);
	    }
	}
	
	$(function(){
		$("#name").trigger("keyup");
		$("#userDetailArea").trigger("keyup");
		$("#request").trigger("keyup");
		<c:forEach items="${nda}" var="item">
		postCode.push("${item.ndaPostCode}");
		</c:forEach>
	})
	
	$(document).on("click","#complete",function(){
 		var success;
 		var name = $("#name").val();
		var postCode = $("#userPostcode").val();
		var street = $("#userStreet").val();
		var detailArea = $("#userDetailArea").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var request = $("#request").val();
		var text = "";
		if(name == ""){
			text = "이름을 입력해주세요!";
		}else if(postCode ==""){
			text = "주소를 입력하세요!";
		}else if(detailArea ==""){
			text = "상세 주소를 입력하세요!";
		}else if(phone1.length != "3" || phone2.length < 3 || phone3.length < 3 ){
			text = "휴대폰 번호를 제대로 입력하세요!";
		}else if(phone2.length > 4 || phone3.length > 4){
			text = "휴대폰 번호를 제대로 입력하세요!";
		}
		
 		if(text != ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: text,
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}
 		
		var formData = new FormData($("#registerForm")[0]);
		formData.append('ordNum',ordNum);
		$.ajax({
			url:"modifyDI",
			data: formData,
			processData:false,
			contentType:false,
			type:'POST',   
			success:function(data){
				$("#modify").css("display","");
				$("#complete").css("display","none");
				$("#MdevlieryTable").css("display","none");
				$("#devlieryTable").css("display","");
				$("#purchaseName").text(data.recipientName);
				$("#purchasePhone").text(data.recipientPhone);
				$("#purchaseAddress").html("["+data.shaPostCode+"]"+"&nbsp;"+data.shaStreet+"&nbsp;"+data.shaDetailArea);
				$("#purchaseRequest").text(data.deliveryRequest);
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '오류가 발생했습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	})
	
	$(document).on("click","#cancel",function(){
		Swal.fire({
			  title: '주문을 취소하시겠습니까?',
			  type: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.value) {
					$.ajax({
						url:"mypage/insertOrderCancel",
						data: {
							ordNum:ordNum
						},
						method:"post",
						success:function(data){
							if(data != 'error'){
								$("#completeAnOrder span:nth-child(6)").text("주문취소");
								$("#cancel").remove();
								$("#modify").remove();
								Swal.fire({
									  position: 'top',
									  type: 'success',
									  title: '주문이 취소되었습니다!',
									  showConfirmButton: false,
									  timer: 1500
									});										
							}else{
								Swal.fire({
									  position: 'top',
									  type: 'error',
									  title: '오류가 발생했습니다.',
									  showConfirmButton: false,
									  timer: 1500
									});								
							}
						},
						error:function(a,b,errMsg){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: '오류가 발생했습니다.',
								  showConfirmButton: false,
								  timer: 1500
								});
						}
					})				
			  }
			})		
	})

	$(document).on("click","#reex",function(){
		var form = $("<form style='display:none'></form>");
		form.attr({
			action:"refundAndExchange"+ordNum,
			method:"post"
		})
		var input = $("<input type = 'text' name = 'type'></input>");
		input.val("add");
		var input2 = $("<input type = 'text' name = 'ordName'></input>");
		if(ordLength != 0){
			ordName = ordName + " 외 " + ordLength + "건";
		}
		input2.val(ordName);
		form.append(input2);
		form.append(input);
		$("body").append(form);
		form.submit();
	})
	
	$(document).on("click","#rexxDetail",function(){
		var form = $("<form style='display:none'></form>");
		form.attr({
			action:"refundAndExchangeConfirm"+ordNum,
			method:"post"
		})
		var input = $("<input type = 'text' name = 'rea'></input>");
		input.val(ordType);
		var input2 = $("<input type = 'text' name = 'ordName'></input>");
		if(ordLength != 0){
			ordName = ordName + " 외 " + ordLength + "건";
		}
		input2.val(ordName);
		form.append(input2);
		form.append(input);
		$("body").append(form);
		form.submit();
	})
</script>	
	
</body>
</html>