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
<script src="../bootstrapFileinput/dist/bs-custom-file-input.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	body{
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;	
	}
	body .container .form-control{
		font-size:14px;
	}
	body .container .btn{
		border-color: #ccc;
	}
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container #title .btn-group-justified{
		 display: table;
	}
	.container #title .btn-group-justified button{
		 font-size:14px;
	}
	.container #title .btn-group-justified ul li{
		 font-size:14px;
		 width:160px;
	}
	.container #title .dropdown-toggle::after{
		display:none;
	}
	.container{
		width:1200px;
		max-width:1200px;
		margin-top:30px;
	}
	.contai
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
	#sArContent{
		padding:10px;
	}
	#firstTable{
		margin-top:10px;
		width:800px;
	}
	#firstTable td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	#firstTable tr td:nth-child(1){
		width:140px;
		text-align:right;
		border-right:1px solid grey;
	}
	#firstTable tr td:nth-child(1) strong{
		margin-right:10px;
	}
	#firstTable tr td:nth-child(2){
		padding:10px;
	}
	#firstTable tr td:nth-child(2) span label{
		margin-right:10px;
	}
	textarea{
		width:640px;
		height:130px;
		resize:none;
	}
	#buttonGroup button{
		float:right;
		font-size:14px;
	}
	.custom-file-label::after{
	    content: "찾아보기";
	}
	.custom-file-label{
		font-size:12px;
	}
	.custom-file{
	    display: inline-block;
	    width: 500px;
	    padding: 0 !important;
	    margin: 5px 0px 5px 10px;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/mypageHeader.jsp" %>
		<div id="content">
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
						<a href = "pointLogs"><span>> 포인트 이용 내역</span></a>
					</div>
					<p>게시판 이용 내역</p>
					<hr>
					<div>
						<a href = "oneTwoOne"><span>> 1:1 문의</span></a>
						<a href = "goodsReview"><span>> 나의 상품평</span></a>
						<a href = "goodsQuestion"><span>> 나의 상품 문의</span></a>
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
				<strong>&#124;&nbsp;교환 환불 신청</strong>
				<div id="sAr">
					<hr>
					<form id = "registerForm" action = "addRe" method = "post">
					<div id = "sArContent">
						<table id = "firstTable">
							<tr>
								<td>						
									<strong>교환 환불 상품</strong>
								</td>
								<td>
									<span>${ordName}</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>교환/환불 선택</strong>
								</td>
								<td>
									<div>
										<span>
											<input type="radio" name="sArSelect" id="exchange"  value = "exchange">
											<label  for="swap">교환</label>
											<input type="radio" name="sArSelect" id="refund" value = "refund">
											<label  for="rebate">환불</label>								
										</span>
									</div>															
								</td>												
							</tr>
							<tr>
								<td>						
									<strong>사유 선택</strong>
								</td>
								<td>
									<span>
										<c:forEach var = "reason" items = "${reasons}">
										<input type="radio" name="reason" value = "${reason.reaCode}">
										<label for="change">${reason.reaName}</label>										
										</c:forEach>
									</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>내용작성</strong>
								</td>
								<td>
									<textarea id = "detailReason" name = "content" placeholder = "구체적인 내용을 입력해주세요.&#13;&#10;변경할 색상과 사이즈를 작성해주세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>이미지 업로드</strong>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img1" class = "custom-file-input" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img2" class = "custom-file-input" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img3" class = "custom-file-input" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>배송비 결제</strong>
								</td>
								<td>
									<span><fmt:formatNumber value="${deliveryPolicy.basicFee}" pattern="#,###" />원</span><br>
									<span>※ 교환/환불 사유가 '사이즈 색상 변경','단순 변심'의 경우 배송비를 고객님께서
									부담하셔야 하므로,<br>&nbsp;&nbsp;&nbsp;<strong>[교환/환불 신청하기]</strong>클릭 시 배송비 결제가 진행됩니다.</span>
								</td>
							</tr>
						</table>				
					</div>
					</form>
					<div id = "buttonGroup">
						<button id = "complete" class = "btn btn-default">신청하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	var IMP = window.IMP;
	IMP.init('imp57728894');
	var ordNum = "${ordNum}"
	var deliveryFee = "${deliveryPolicy.basicFee}"
	
		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();
		
		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
	
	$(document).ready(function () {
		  bsCustomFileInput.init()
		});	
	
	$("input[type='file']").change(function(){
		var label = $(this).prev().val();
		var inputName = $(this).prop("name");
		$.each(Array,function(index,item){
			
		})
		var ext = $(this).val().split(".").pop().toLowerCase();
		var file = this.files[0];
		var _URL = window.URL || window.webkitURL;
		var img = new Image();
		var input = $(this).prop("id");
		var name = $(this).prop("name");
		var repre = "input[name='" + name + "']";
		
		img.src = _URL.createObjectURL(file);
		if($.inArray(ext,["gif","jpg","jpeg","png"]) == -1){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '이미지 파일(gif,jpg,jpeg,png)\n만 업로드 가능합니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
				setTimeout(function() {
					$("input[name="+inputName + "]").val("");
					$("input[name="+inputName + "]").next().text(label);
				}, 1);
				return;
		}
		
		var fileSize = this.files[0].size;
		var maxSize = 1024 * 1024 * 10;
		if(fileSize > maxSize){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '파일용량이 10MB를 초과했습니다!',
					  showConfirmButton: false,
					  timer: 1500
					});
				setTimeout(function() {
					$("input[name="+inputName + "]").val("");
					$("input[name="+inputName + "]").next().text(label);
				}, 1);
			return;
		}
	})
	
	$("#complete").click(function(){
		var rx = $("input[name='sArSelect']:checked");
		var reason = $("input[name='reason']:checked");
		var content = $("#detailReason").val();
		var text = "";
		
		if(rx.length == 0){
			text = "교환/환불을 선택해주세요!";
		}else if(reason.length == 0){
			text = "사유를 선택해주세요!";
		}else if(content == ""){
			text = "구체적인 내용을 작성해주세요!"
		}
		
		var d = new Date();
	    var day = leadingZeros(d.getFullYear(), 4) +
	    leadingZeros(d.getMonth() + 1, 2) +
	    leadingZeros(d.getDate(), 2) +

	    leadingZeros(d.getHours(), 2) +
	    leadingZeros(d.getMinutes(), 2) +
	    leadingZeros(d.getSeconds(), 2)
	    var id = rx.val() + day;
	    
	    if(reason.val() != 1 && reason.val() != 2){
	    	id = "";
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
		}else{
				var formData = new FormData($("#registerForm")[0]);
				formData.append('ordNum', ordNum);
				formData.append('rePayNum', id);
				$.ajax({
					url:"addRe",
					data: formData,
					processData:false,
					contentType:false,
					type:'POST',
					success:function(data){
						if(data == 'error'){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: '오류가 발생했습니다.',
								  showConfirmButton: false,
								  timer: 1500
								});						
						}else{
							if(reason.val() == 1 || reason.val() == 2){
								IMP.request_pay({
								    pg : 'inicis', // version 1.1.0부터 지원.
								    pay_method : "card",
								    merchant_uid : id,
								    name : "배송비",
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
										Swal.fire({
											  position: 'top',
											  type: 'success',
											  title: '신청이 완료되었습니다!',
											  showConfirmButton: false,
											  timer: 1500
											});
										setTimeout(function() {
											  location.href = "/shoppingmall/mypage/orderHistory";
											}, 1600);
								    }else{
								    	$.ajax({
								    		url:"deleteRe",
								    		data:{
								    			ordNum:ordNum,
								    			rx:rx.val()
								    		},
								    		success:function(data){
												Swal.fire({
													  position: 'top',
													  type: 'error',
													  title: msg,
													  showConfirmButton: false,
													  timer: 3500
													});		
								    		},
											error:function(a,b,errMsg){
												Swal.fire({
													  position: 'top',
													  type: 'error',
													  title: errMsg,
													  showConfirmButton: false,
													  timer: 3500
													});		
											}
								    	})
							    }
							});							
							}else{
								Swal.fire({
									  position: 'top',
									  type: 'success',
									  title: '신청이 완료되었습니다!',
									  showConfirmButton: false,
									  timer: 1500
									});
								setTimeout(function() {
									  location.href = "/shoppingmall/mypage/orderHistory";
									}, 1600);
							}
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
	</script>

</body>
</html>