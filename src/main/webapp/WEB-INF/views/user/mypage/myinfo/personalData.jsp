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
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
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
#modify table {
	margin-top: 10px;
	width: 800px;
}

#modify table td {
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	height: 50px;
}

table tr td:nth-child(1) {
	border-right: 1px solid grey;
	background-color: #F2F5F7;
	width: 150px;
}

table tr td:nth-child(1) strong
	{
	float: right;
	margin-right: 10px;
}

table tr td:nth-child(2) span {
	margin-left: 10px;
	width: 200px;
}
#emailForm{
	padding:10px 0 10px 0;
}

#emailForm span span, #phoneForm span span {
	margin: 0px 10px 0px 10px;
}

#emailForm input[type='text'] {
	width: 150px;
	margin-let: 10px;
}
#emailForm span label {
	margin-right: 10px;
}

#phoneForm input[type='number'] {
	width: 92px;
}
#marketing{
	padding:10px;
	margin-top:20px;
}
#marketing textarea{
	margin-top:10px;
	width:780px;
	height:150px;
	padding:5px;
	resize:none;
}
#buttonGroup{
	text-align:center;
}
#buttonGroup button{
	margin-top:30px;
	width:80px;
	height:25px;
	padding:0;
}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	input[type='number']{
		text-align:center;
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
						<a href = "orderHistory1"><span>> 주문 내역</span></a>
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
						<a href = "#" class= "activeMenu"><span onclick = "location.href = '../MYINFO/02.html'">> 개인정보 수정</span></a>
						<a href = "#"><span onclick = "location.href = '../MYINFO/03.html'">> 비밀번호 변경</span></a>
					</div>
					<a href = "#"><span onclick = "location.href = '../MYINFO/04.html'">회원탈퇴</span></a>
				</div>
			</div>		
		</div>
			<div id = "tableDiv">
				<strong>&#124;&nbsp;개인정보 수정</strong>
				<div id="modify">
					<table id="firstTable">
						<tr>
							<td><strong>아이디</strong></td>
							<td><span>${user.userId}</span></td>
						</tr>
						<tr>
							<td><strong>이름</strong></td>
							<td><span>${user.userName}</span></td>
						</tr>
						<tr>
							<td><strong>연락처</strong></td>
							<td id="phoneForm"><span>
							<input type="number" id = "phone1" name="phone1" value = "${fn:split(user.userPhone,'-')[0]}" onkeyup="phoneCheck(this)" />
							<span>-</span>
							<input type="number" id = "phone2" name="phone2" value = "${fn:split(user.userPhone,'-')[1]}" onkeyup="phoneCheck(this)" />
							<span>-</span>
							<input type="number" id = "phone3" name="phone3" value = "${fn:split(user.userPhone,'-')[2]}" onkeyup="phoneCheck(this)" />
							</span></td>
						</tr>
						<tr>
							<td><strong>이메일</strong></td>
							<td id="emailForm"><span>
							 <input type="text" id = "emailId" name="emailId" value = "${fn:split(user.userEmail,'@')[0]}" /> 
							 <span>@</span>
							 <input type="text" id = "emailAddress" name="emailAddress" value = "${fn:split(user.userEmail,'@')[1]}" /></span>
								<p>
	 								<span>메일 수신 여부 : </span>
	 								<input type="radio" name="emailSelect" id="emailAgree" value = "수신" class="custom-control-input">
	 								<label class="custom-control-label" for="mail">수신함</label>
	 								<input type="radio" name="emailSelect" id="emailReject" value = "거부" class="custom-control-input">
	 								<label class="custom-control-label" for="mailReject">수신하지 않음</label>							
								</p>
								<p>
									<span>(이벤트,신상품 등 고객님께 혜택이 되는 소식을 알려드립니다.)</span>
								</p>
							</td>
						</tr>
					</table>
					<div id = "buttonGroup">
						<button id = "modifyB" class = "btn btn-default">수정</button>
						<button class = "btn btn-default" onclick="location.href='../SHOPPING/01.html'">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		var email = "${user.userMailAgreement}"
		if(email == '수신'){
			$("#emailAgree").prop("checked",true);
		}else{
			$("#emailReject").prop("checked",true);
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
	
	$("#modifyB").click(function(){
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var emailid = $("#emailId").val();
		var emailAddress = $("#emailAddress").val();
		var emailSelect = $("input[name='emailSelect']").val();
		var text = "";
		if(phone1.length != "3" || phone2.length < 3 || phone3.length < 3 ){
			text = "emailAddress 번호를 제대로 입력하세요!";
		}else if(phone2.length > 4 || phone3.length > 4){
			text = "휴대폰 번호를 제대로 입력하세요!";
		}else if(emailid == "" || emailAddress == ""){
			text = "이메일을 입력하세요";
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
			$.ajax({
				url:"modifyUser",
				data:{
					phone1:phone1,
					phone2:phone2,
					phone3:phone3,
					emailid:emailid,
					emailAddress:emailAddress,
					emailSelect:emailSelect
				},
				method:"post",
				success:function(data){
					Swal.fire({
						  position: 'top',
						  type: 'success',
						  title: '수정되었습니다!',
						  showConfirmButton: false,
						  timer: 1500
						});
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