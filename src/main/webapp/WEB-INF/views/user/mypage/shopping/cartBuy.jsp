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
<script src = "<c:url value = "/js/MyNavigation.js" />"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	#content1{
		margin-top:50px;
	}
	#content1,
	#content2,
	#content3{
		width:900px;
	}
	#content2 > strong,
	#content3 > strong{
		position:relative;
		left:50px;
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
	.item > div{
		padding:10px;
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
	#price{
		margin-top:20px;
		margin-bottom:100px;
	}
	#price strong:nth-child(1){
		font-size:20px;
		float:right;
		color:red;
	}
	#price strong:nth-child(2){
		font-size:20px;
		float:right;
	}

<!--02.html 시작 -->
	#requesterInfo,
	#deliveryInfo table,
	#requesterInfo table{
		margin-top:10px;
	}
	#deliveryInfo{
		width:800px;
	}
	#deliveryInfo table,
	#requesterInfo table{
		width:800px;
		margin-bottom:40px;
	}
	#deliveryInfo table tr td,
	#requesterInfo table tr td{
		border-top:1px solid lightgrey;
		border-bottom:1px solid lightgrey;
		height:40px;
	}
	#deliveryInfo table tr td:nth-child(1),
	#requesterInfo table tr td:nth-child(1){
		border-right:1px solid lightgrey;
	}
	#deliveryInfo table tr td:first-child{
		width:100px;
		text-align:right;
	}
	#deliveryInfo table tr td:last-child span{
		margin-left:10px;
	}
	#deliveryInfo table tr td:last-child span:last-child{
		margin-left:0px;
	}
	#requesterInfo{
	margin-bottom:100px;
	margin-top: 10px;
	width:800px;
	}
	#requesterInfo table tr td:last-child input{
		margin-left:10px;
	}
	#addressBook{
		float:right;
	}
	#deliveryInfo table{
		margin-top:10px;
		margin-bottom:100px;
	}
	#deliveryInfo table tr td input{
		margin-left:10px;
	}
	#deliveryInfo table tr:nth-child(2)  td{
		height:70px;
	}
	#deliveryInfo table tr:nth-child(2)  td button{
		padding:0;
		width:100px;
		height:27px;
		position:relative;
		bottom:2px;
		margin-left:5px;
	}
	#deliveryInfo table tr:nth-child(2) div:nth-child(1) >  input[type='text']:nth-child(1){
		width:150px;
	}
	#deliveryInfo table tr:nth-child(2) div:nth-child(2) >  input[type='text']:nth-child(1){
		width:300px;
	}
	#deliveryInfo table tr:nth-child(3) input{
		width:80px;
	}
	#deliveryInfo table tr:nth-child(4) td:last-child{
		padding:10px;
	}
	#deliveryInfo table tr:nth-child(4) textarea{
		width:680px;
		height:100px;
		resize:none;
	}
	#deliveryInfo table tr:nth-child(4) div:last-child{
		float:right;
	}
	table{
		width:800px;
		margin-bottom:10px;
	}
	table tr td:first-child{
		width:100px;
		text-align:right;
	}
	#requesterInfo table tr td:last-child input[type='number']{
		margin-left:10px;
		width:80px;
	    position: relative;
	    bottom: 1px;
	}
	#requesterInfo table tr:nth-child(2) td:last-child > #minusSpan{
		color:red;
		font-size:25px;
	}
	#requesterInfo table tr:nth-child(2) td:last-child > button{
		width:50px;
		height:25px;
		padding:0;
		margin-bottom:5px;
	}
	#buttonGroup{
		text-align:center;
	}
	#buttonGroup > button:nth-child(2){
		width:77px;
		float:right;
	}
	#requesterInfo{
		margin-top:10px;
	}
	table tr td:first-child{
		width:100px;
		text-align:right;
	}
	#requesterInfo table tr td:first-child span,
	#deliveryInfo table tr td:first-child span{
		margin-right:10px;
		font-weight:bold;
	}
	table tr td:last-child span{
		margin-left:10px;
	}
	#requesterInfo table tr td:last-child input[type='number']{
		margin-left:10px;
		width:80px;
	}
	#requesterInfo table tr:nth-child(2) td:last-child > button{
		width:50px;
		height:25px;
		padding:0;
		margin-bottom:5px;
	}
	#buttonGroup{
		text-align:center;
	}
	#buttonGroup > button:nth-child(2){
		width:77px;
		float:right;	
	}
	.image img{
		width:90px;
		height:120px;
	}
	input[type='number']{
		text-align:center;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
</head>
<body>
	<div class="container">
		<%@ include file = "../../header/userheader.jsp" %>
		<div id="content1" class = "center-block">
			<strong>&#124;&nbsp;구매 리스트</strong>
			<hr>
			<div id="styleShop">
				<table class="br">
					<tr>
						<th>번호</th>
						<th></th>
						<th>상품 정보</th>
						<th>수량</th>
						<th>합계 금액</th>
						<th>적립금액</th>
					</tr>
					<c:set var = "totalprice" value = "0" /> 
					<c:forEach var = "buy" items = "${buys}" varStatus = "state">
					<c:set var = "total" value = "0" /> 
					<tr>
						<td><span class="number">${state.index+1}</span></td>
						<td>
							<div class="image">
								<img src = "../upload/${buy.godListImageUrl}">
							</div>
						</td>
						<td class="item">
							<div>
								<div>
									<strong>${buy.godcName}</strong>
								</div>
								<div>
									<span>${buy.godName}</span>
									<span><fmt:formatNumber value="${buy.godSellingPrice}" pattern="#,###" />원</span>
									<c:set var = "total" value = "${buy.godSellingPrice}" />
								</div>
								<c:if test = "${!empty buy.godoList[0].optName}">
								<c:forEach var = "option" items = "${buy.godoList}">
								<div>
									<span>${option.optName} : ${option.optContent}</span>
									<span><fmt:formatNumber value="${option.optPrice}" pattern="#,###" />원</span>
									<c:set var = "total" value = "${(total + option.optPrice)}" />
								</div>
								</c:forEach>
								</c:if>
							</div>
						</td>
						<td><strong>${buy.godAmount}</strong> <span>개</span></td>
						<c:set var = "total" value = "${(total*buy.godAmount)}" />
						<td><span><fmt:formatNumber value="${total}" pattern="#,###" />원
						</span></td>
						<fmt:parseNumber var = "saveP" value ="${total/pointPolicy.savePointPercent}" integerOnly = "true" />
						<td><strong>${saveP}</strong><span>P</span></td>
					</tr>
					<c:set var = "totalprice" value = "${(totalprice + total)}" />
					</c:forEach>
				</table>
			</div>
			<div id = "price">
				<strong><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</strong>
				<strong>총 상품 금액 :&nbsp;</strong>
			</div>
		</div>
		<div id="content2" class = "center-block">
			<strong>&#124;&nbsp;주문자 정보</strong>
			<div id = "requesterInfo" class = "center-block">
				<table>
					<tr>
						<td>
							<span>이름</span>
						</td>
						<td>
							<span>${user.userName}</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>연락처</span>
						</td>
						<td>
							<span>${user.userPhone}</span>
						</td>
					</tr>
				</table>
			</div>
			<strong>&#124;&nbsp;배송 정보</strong>
			<div id = "deliveryInfo" class = "center-block">
				<form id = "registerForm">
				<table>
					<tr>
						<td>
							<span>이름(회사)</span>
						</td>
						<td>
							<input type = "text" id = "name" name = "name"  onkeyup="chkword(this,50,1)" />
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
								<input type = "text" id = "userPostcode" name = "userPostcode" readonly/>
								<button type = "button" class = "btn btn-default" onclick="showPostcode()">우편번호 검색</button>
							</div>
							<div>
								<input type = "text" id = "userStreet" name = "userStreet" readonly/>
								<input type = "text" id = "userDetailArea" name = "userDetailArea" onkeyup="chkword(this,40,3)"/>
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
							<input type = "number" id = "phone1" name = "phone1" onkeyup="phoneCheck(this)" />
							<span>-</span>
							<input type = "number" id = "phone2" name = "phone2" onkeyup="phoneCheck(this)" />
							<span>-</span>
							<input type = "number" id = "phone3" name = "phone3" onkeyup="phoneCheck(this)" />
						</td>
					</tr>
					<tr>
						<td>
							<span>요청사항</span>
						</td>
						<td>
							<div>
								<textarea id = "request" name = "request" onkeyup="chkword(this,200,2)"></textarea>
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
		</div>
		<div id="content3" class = "center-block">
			<strong>&#124;&nbsp;결제 금액 확인 및 결제 방법</strong>
			<div id = "requesterInfo" class = "center-block">
				<table>
					<tr>
						<td>
							<span>총 상품 가격</span>
						</td>
						<td>
							<span><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>포인트 사용</span>
						</td>
						<td>
							<span id = "minusSpan">-</span>
							<input type = "number" id = "point" name = "point" />
							<button id = "usingPoint" class = "btn btn-default">적용</button>
							<span>※ 포인트는 100포인트 단위로 사용가능합니다.</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>배송비</span>
						</td>
						<td>
							<span>
							<c:if test = "${totalprice >= deliveryPolicy.freeDeliveryMp}">
								무료
							</c:if>
							<c:if test = "${totalprice < deliveryPolicy.freeDeliveryMp}">
								<fmt:formatNumber value="${deliveryPolicy.basicFee}" pattern="#,###" />원
								<c:set var = "totalprice" value = "${(totalprice + deliveryPolicy.basicFee)}" />
							</c:if>
							(택배발송)</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>총 결제 금액</span>
						</td>
						<td>
							<span id = "totalPrice"><fmt:formatNumber value="${totalprice}" pattern="#,###" />원</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>결제 방법</span>
						</td>
						<td>
							<input type = "radio" id = "card" name = "payment">
							<label for = "card">카드결제</label>
							<input type = "radio" id = "trans" name = "payment">
							<label for = "account">계좌이체</label>
						</td>
					</tr>
				</table>
				<div id = "buttonGroup">
					<button id = "payment" class = "btn btn-default">결제하기</button>
					<button id = "cancel" class = "btn btn-default">취소</button>			
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp57728894'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	var postCode = new Array();
	var ordNum = "";
	var point = "";
	var userPoint = "${userPoint}"
	var total = "${totalprice}"
	var godName = "${buys[0].godName}"
	var godLength = "${(fn:length(buys)-1)}";
	$(function(){
		<c:forEach items="${nda}" var="item">
		postCode.push("${item.ndaPostCode}");
		</c:forEach>
		
		if(godLength != "0"){
			godName = godName + " 외 " + godLength + "건";
		}
		
		$.ajax({
			url:"getOrderNum",
			type:'post',
			success:function(data){
				ordNum = data;
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	})
	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	
	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}
	
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
	
	$("#usingPoint").click(function(){
		point = $(this).prev().val();
		var totalprice = "${totalprice}"
		if(point%100 != 0){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '100단위로만 사용가능합니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
			total = totalprice;
			totalprice = comma(totalprice);
			$("#totalPrice").text(totalprice +"원")
			$(this).prev().val("");
			return;
		}
		if(point > userPoint){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '포인트가 부족합니다!\n 보유포인트는 ' + userPoint + ' 포인트 입니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
			total = totalprice;
			totalprice = comma(totalprice);
			$("#totalPrice").text(totalprice +"원")
			$(this).prev().val("");
			return;
		}
		total = totalprice-point;
		totalprice = comma(totalprice-point);
		$("#totalPrice").text(totalprice +"원")
		Swal.fire({
			  position: 'top',
			  type: 'success',
			  title: '적용되었습니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
	})
	
	$("input[name='point']").keyup(function(){
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
	
	$("#payment").click(function(){
 		var success;
 		var name = $("#name").val();
		var postCode = $("#userPostcode").val();
		var street = $("#userStreet").val();
		var detailArea = $("#userDetailArea").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var request = $("#request").val();
		var payment = $("input[name='payment']:checked").length;
		var pay = $("input[name='payment']:checked").prop("id");
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
		}else if(payment == "0"){
			text = "결제 방법을 선택하세요!";
		}
		if(point == ""){
			point = "0";
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
		
			
		var d = new Date();
	    var day = leadingZeros(d.getFullYear(), 4) +
	    leadingZeros(d.getMonth() + 1, 2) +
	    leadingZeros(d.getDate(), 2) +

	    leadingZeros(d.getHours(), 2) +
	    leadingZeros(d.getMinutes(), 2) +
	    leadingZeros(d.getSeconds(), 2) +
	    ordNum;
	    
/* 		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : pay,
		    merchant_uid : day,
		    name : godName,
		    amount : "1",
		    buyer_email : 'endia1@daum.net',
		    buyer_name : '성정모',
		    buyer_tel : '010-4644-9858',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		}, function(rsp) {
		    if ( rsp.success ) {
		        success = true;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        success = false;
		    }
		    if(success == true){
		    	*/
				var formData = new FormData($("#registerForm")[0]);
				formData.append('usingPoint',point);
				formData.append('payment',pay);
				formData.append('ordNum',day);
				$.ajax({
					url:"createOrder",
					data: formData,
					processData:false,
					contentType:false,
					type:'POST',   
					success:function(data){
						console.log(data);
						 if(data == "error"){
								Swal.fire({
									  position: 'top',
									  type: 'error',
									  title: '오류가 발생했습니다.',
									  showConfirmButton: false,
									  timer: 1500
									});							
							}else{
					    	var form = $("<form action = 'CartBuyResult' method = 'post'></form>");
					    	var input = $("<input name = 'ordNum'></input>");
					    	input.val(data);
					    	form.append(input);
					    	$("body").append(form);
					    	form.submit();							
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
/* 		    }else{
		    	 alert(msg);
		    }
		}); */
	})
	
	$("#cancel").click(function(){	
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
				window.location.href = "/shoppingmall/";
			  }
			})
	})
	</script>

</body>
</html>