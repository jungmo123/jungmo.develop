<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script src = "https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	#stateInfo{
		margin-top:10px;
	}
	#apply table{
		margin-top:10px;
		width:800px;
	}
	#apply table td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	#apply table tr td:nth-child(1){
		border-right:1px solid grey;
		background-color:#F2F5F7;
		width:150px;
	}
	#apply table tr td:nth-child(1) strong,
	#secondTable tr td:nth-child(3) strong{
		float:right;
		margin-right:10px;
	}
	#apply table tr td:nth-child(2) span{
		margin-left:10px;
		width:200px;
	}
	#passwordForm span label,
	#emailForm span label,
	#phoneForm span label{
		margin-right:10px;
	}
	#passwordForm input[type='password']{
		width:150px;
	}
	#emailForm span span,
	#phoneForm span span{
		margin:0px 10px 0px 10px;
	}
	#emailForm input[type='text']{
		width:150px;
		margin-let:10px;
	}
	#emailForm span label{
		margin-right:10px;
	}
	#phoneForm input[type='number']{
		width:92px;
	}
	#addressForm{
		padding:10px;
	}
	#addressForm div:first-child{
		margin-bottom:3px;
	}
	#addressForm div:first-child button{
		height:26px;
		padding:0px 2px 0px 2px;
		position:relative;
		bottom:2px;
	}
	#addressForm div:last-child input:nth-child(1){
		width:283px;
	}
	#useInfo{
		margin-top:30px;
	}
	#secondTable tr td:nth-child(2),
	#secondTable tr td:nth-child(4){
		width:250px;
	}
	#secondTable tr td:nth-child(3){
		width:150px;
		background-color:#F2F5F7;
		border-left:1px solid grey;
		border-right:1px solid grey;
	}
	#secondTable tr td:nth-child(4) *{
		margin-left:10px;
	}
	#secondTable button{
		position:relative;
		left:20px;
	}
	#buttonBox div,
	#buttonBox div button{
		display:inline-block;
		margin-top:10px;
	}
	#buttonBox div:nth-child(1){
		float:left;
	}
	#buttonBox div:nth-child(2){
		position:relative;
		left:220px;
	}
	#buttonBox div:nth-child(2) button{
		width:100px;
	}
	#buttonBox div:nth-child(3){
		float:right;
	}
	#date .modal-dialog{
		width:200px;
	}
	#date .modal-header{
		border:0;
	}
	#date .modal-body{
		padding:0px 15px 0px 15px;
	}
	#date .modal-body div{
		margin-bottom:10px;
	}
	#closeButton{
		text-align:center;
	}
	#closeButton button{
		width:100px;
	}
	#date .modal-body textarea{
		resize: none;
	}
	#date .modal-footer{
		border:0;
		text-align:center;
	}
	#date .modal-title{
		font-weight:bold;
	}
	#date hr{
		margin:5px;
	}
	textarea{
		text-align:center;
	}
	#receipt .modal-dialog,
	#pointModal .modal-dialog{
		width:420px;
	}
	#receipt .modal-header,
	#pointModal .modal-header{
		border:0;
	}
	#receipt .modal-body,
	#pointModal .modal-body{
		padding:0px 15px 0px 15px;
	}
	#receipt .modal-body div,
	#pointModal .modal-body div{
		margin-bottom:10px;
	}
	#receipt table tr th,
	#receipt table tr td,
	#pointModal table tr th,
	#pointModal table tr td{
		text-align:center;
	}
	#receipt #table,
	#pointModal #table{
		width:100%;
		height:200px;
    	display: block;
    	overflow: auto;
	}
	#receipt #closeButton,
	#pointModal #closeButton{
		text-align:center;
	}
	#receipt #closeButton button,
	#pointModal #closeButton button
	{
		width:100px;
	}
	#firstTable input{
		display:inline-block;
	}
	#passFormDiv {
		position: relative;
		top: 8px;
	}
	table tr td input[type='text'], table tr td input[type='password'] {
		display: inline-block;
		width: 120px;
		height: 30px;
		margin-right: 10px;
	}
	table tr:nth-child(6) td:last-child div:nth-child(2),
	table tr:nth-child(6) td:last-child div:nth-child(3){
		float:left;
		width:255px;
		display:inline-block;
		margin-right:10px;
	}
	table tr:not(:nth-child(6)) td div{
		display:inline-block;
		float:left;
		font-size:12px;
	}
	table tr td:last-child > div{
		margin-left:10px;
	}
	.container table tr:nth-child(6){
		height:75px;
	}
	table tr:nth-child(3) td:last-child div:nth-child(1),
	table tr:nth-child(3) td:last-child div:nth-child(2),
	table tr:nth-child(4) td:last-child div:nth-child(1),
	table tr:nth-child(4) td:last-child div:nth-child(3){
		width:120px;
	}
	table tr:nth-child(5) td:last-child div:nth-child(1),
	table tr:nth-child(5) td:last-child div:nth-child(3),
	table tr:nth-child(5) td:last-child div:nth-child(5){
		width:100px;
	}
	table tr:nth-child(2) td:last-child div:nth-child(3){
		width:300px;
		line-height:100%;
	}
	table tr:nth-child(2) td:last-child div:nth-child(3){
		width:300px;
		line-height:100%;
	}
	table tr:nth-child(4) td:last-child div:nth-child(2){
		width:30px;
		line-height:25px;
	}
	table tr:nth-child(4) td:last-child div:nth-child(4) select{
		height:30px;
		padding:0px 0px 0px 10px;
		font-size:12px;
	}
	table tr:nth-child(5) td:last-child div:nth-child(1) select{
		height:30px;
		padding:0px 0px 0px 10px;
	}
	table tr:nth-child(5) td:last-child div:nth-child(1) input,
	table tr:nth-child(5) td:last-child div:nth-child(3) input,
	table tr:nth-child(5) td:last-child div:nth-child(5) input{
		width:101px;
		height:30px;
		text-align:center;
	}
	table tr:nth-child(5) td:last-child div:nth-child(2),
	table tr:nth-child(5) td:last-child div:nth-child(4){
		line-height:25px;
	}
	table tr:nth-child(5) td:last-child div:nth-child(2),
	table tr:nth-child(5) td:last-child div:nth-child(4){
		line-height:25px;
	}
	table tr:nth-child(6) td:last-child div:nth-child(1){
		margin-bottom:3px;
	}
	table tr:nth-child(6) td:last-child div:nth-child(1) a{
		width:80px;
		padding:0;
		font-size:12px;
		margin-bottom:5px;
	}
	table tr:nth-child(6) td:last-child div:nth-child(2),
	table tr:nth-child(6) td:last-child div:nth-child(3){
		float:left;
		width:255px;
		display:inline-block;
		margin-right:10px;
	}
	table tr:nth-child(6) td:last-child div:nth-child(2) input,
	table tr:nth-child(6) td:last-child div:nth-child(3) input{
		width:255px;
	}
	table tr:nth-child(5) td:last-child div input{
		width:100px;
	}
	table tr:nth-child(5) td:last-child div span,
	table tr:nth-child(4) td:last-child div span{
		margin:0px 10px 0px 10px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	#mailDiv {
		text-align: center;
		margin-top: 10px;
	}
	
	#mailDiv span {
		color: #878787;
	}
	
	#qualification {
		margin-top: 20px;
	}
	
	#qualification p {
		color: #878787;
	}
	#loginLog{
		overflow: auto;
		height:300px;
	}
	#receipt .modal-content,
	#pointModal .modal-content{
		width:520px;
	}
	#table tr th:nth-child(1){
		width:45px;
	}
	#table tr th:nth-child(2){
		width:146px;
	}
	#table tr th:nth-child(3){
		width:160px;
	}
	#table tr th:nth-child(4){
		width:120px;
	}
	#cancel{
		width:100px;
		margin:10px 0px 0px 5px;
		float:right;
	}
	#idx{
		margin-top:10px;
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
				</span> <span>게시판 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="userIdx" class = "activeMenu"><span>회원 목록</span></a>
				<a href="leaveUserIdx"><span>탈퇴 회원 목록</span></a>
				<a href="mail"><span>메일 관리</span></a>
				<a href="sms"><span>SMS 관리</span></a>
				<a href="bulkMailSending"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 교환/환불 > 상세보기</p>
			</div>
		<form id = "registerForm" action = "modifyUserInfo" method = "post">
			<input type = "text" name = "userId" value = "${user.userId}" style = "display:none"/>
			<div id = "apply">
				<div id = "stateInfo">
					<strong>가입정보</strong>
				</div>
				<div>
					<table id = "firstTable">
						<tr>
							<td><strong>이름</strong></td>
							<td>
								<div>
									${user.userName}
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>아이디</strong></td>
							<td>
								<div>
									${user.userId}
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>비밀번호</strong></td>
							<td>
								<div>
									<input id = "password" class="form-control" type="password" name="userPwd" placeholder="비밀번호 입력" />
								</div>
								<div>
									<input class="form-control" type="password" name="confirmpassword" placeholder="비밀번호 확인" />								
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>이메일</strong></td>
							<td>
								<div>
									<input class="form-control" type="text" name="email1" value = "${fn:split(user.userEmail,'@')[0]}" />
								</div>
								<div>
									<span>@</span>			
								</div>
								<div>
									<input id="emailAddress" class="form-control" type="text" name="email2" value = "${fn:split(user.userEmail,'@')[1]}" />
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>휴대폰 번호</strong></td>
							<td>
								<div>
									<input id = "phone1" type="number" class="form-control" name="phone1" value = "${fn:split(user.userPhone,'-')[0]}"> 
								</div>
								<div>
									<span>&nbsp;-&nbsp;</span>
								</div>
								<div>
									<input id = "phone2" type="number" class="form-control" name="phone2" value = "${fn:split(user.userPhone,'-')[1]}" /> 
								</div>
								<div>
									<span>&nbsp;-&nbsp;</span>
								</div>
								<div>
									<input id = "phone3" type="number" class="form-control" name="phone3"  value = "${fn:split(user.userPhone,'-')[2]}" />
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>주소</strong></td>
							<td>
								<div>
									<input id="userPostcode" type="text" class="form-control"
										name="userPostcode" value = "${user.userPostcode}" readonly>
									<a class="btn btn-default" onclick="showPostcode()">우편번호
										검색</a>
								</div>
								<div>
									<input id="userStreet" type="text" class="form-control" name="userStreet" value = "${user.userStreet}" readonly>
								</div>
								<div>
									<input id="userDetailArea" type="text" class="form-control" value = "${user.userDetailArea}" name="userDetailArea" >
								</div>
							</td>
						</tr>
						<tr>
							<td><strong>동의내역</strong></td>
							<td>
								<c:forEach var = "clause" items = "${clauses}" varStatus = "state">
									<span><strong>&#124;&nbsp;</strong>${clause.clsTitle} : <strong>${clause.clscAgreement}</strong></span>
								</c:forEach>
							</td>
						</tr>
					</table>
							
					<div id = "useInfo">
						<strong>이용/운영 정보</strong>
					</div>
					<table id = "secondTable">
						<tr>
							<td>
								<strong>가입일</strong>
							</td>
							<td>
								<span><fmt:formatDate value = "${user.userJoinDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
							</td>
							<td>
								<strong>회원 등급</strong>
							</td>
							<td>
								<span>
									<select id = "userLevel" name = "userLevel">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<strong>방문횟수</strong>
							</td>
							<td>
								<span>${user.userVisitCnt}회</span>
								<c:if test = "${user.userVisitCnt != 0}">
								<button id = "loglog" type = "button" class = "btn btn-default" data-toggle = "modal" data-target = "#date">로그인 기록 보기</button>
								</c:if>
							</td>
							<td>
								<strong>최근 로그인</strong>
							</td>
							<td>
								<span><fmt:formatDate value = "${user.userLatestDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
							</td>
						</tr>
						<tr>
							<td>
								<strong>총 구매 금액</strong>
							</td>
							<td>
								<span><fmt:formatNumber value="${user.purchaseAmount}" pattern="#,###" />원</span>
								<c:if test = "${user.purchaseAmount != 0}">
								<button id = "purl" type = "button" class = "btn btn-default" data-toggle = "modal" data-target = "#receipt">구매 내역 보기</button>
								</c:if>
							</td>
							<td>
								<strong>포인트</strong>
							</td>
							<td>
								<span>${user.userHp}</span>
								<button id = "polg" type = "button" class = "btn btn-default" data-toggle = "modal" data-target = "#pointModal">포인트 적립 내역 보기</button>
							</td>
						</tr>
					</table>
					<div id = "buttonBox">
						<div>
							<button type = "button" id = "leave" class = "btn btn-default">회원 탈퇴</button>
						</div>
						<div>
							<button type = "submit" id = "modify" class = "btn btn-default">수정</button>
							<a href = "useridx" id = "cancel" class = "btn btn-default">취소</a>
						</div>
						<div>
							<a href = "useridx" id = "idx" class = "btn btn-default">목록보기</a>
						</div>
					</div>
				</div>
			</div> 
		</form>
	</div>
</div>
</div>


	<div class = "modal fade" id ="date">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;방문일 보기</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div>
						<strong>계정 : </strong>
						<span>${user.userId}</span>					
					</div>
					<div id = "loginLog">
					
					</div>
				<div id = "closeButton">
						<button class = "btn btn-default" data-dismiss = "modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id ="receipt">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;구매내역 보기</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div>
						<strong>계정 : </strong>
						<span>${user.userId}</span>					
					</div>
					<div>
						<table id = "table" class = "table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>주문일</th>
									<th>주문 상품</th>
									<th>결제 금액</th>
								</tr>
							</thead>
							<tbody id = "purlTbody">
							</tbody>
						</table>				
					</div>
					<div id = "closeButton">
						<button class = "btn btn-default" data-dismiss = "modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id ="pointModal">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;구매내역 보기</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div>
						<strong>계정 : </strong>
						<span>${user.userId}</span>					
					</div>
					<div>
						<table id = "table" class = "table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>변동일</th>
									<th>변동내역</th>
									<th>변동액</th>
								</tr>
							</thead>
							<tbody id = "pointBody">
							</tbody>
						</table>				
					</div>
					<div id = "closeButton">
						<button class = "btn btn-default" data-dismiss = "modal">닫기</button>
					</div>
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
            document.getElementById('userPostcode').value = data.zonecode;
            document.getElementById("userStreet").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("userDetailArea").focus();
        }
    }).open();
    if($("#userStreet-error").length > 0){
    	$(this).addClass("display","none");
    }
}
	$(function() {
			$("#registerForm").validate({
				rules : {
					userPwd : {
						minlength : 8
					},
					confirmpassword : {
						equalTo : "#password"
					},
					email1 : {
						required : true
					},
					email2 : {
						required : true
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
					userDetailArea : {
						required : true
					}
				},
				messages : {					
					userPwd : {
						minlength : function(){
							return "8글자 이상으로 입력하세요";
						}
					},
					confirmpassword : {
						equalTo : function(){
							return "위 암호와 똑같이 입력하세요.";
						}
					},
					email1 : {
						required : function(){
							return "이메일 주소를 입력하세요.";
						}
					},
					email2 : {
						required : function(){
							return "이메일 주소를 입력하세요.";
						}
					},
					phone1 : {
						required : function(){
							return "번호를 입력하세요";
						},
						maxlength : function(){
							return "3자로 입력";
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
					},
					userDetailArea : {
						required : function(){
							return "상세 주소를 입력하세요 !";
						}
					}
				},
			})		
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(function(){
		function getTimeStamp(d) {
			  var s =
			    leadingZeros(d.getFullYear(), 4) + '-' +
			    leadingZeros(d.getMonth() + 1, 2) + '-' +
			    leadingZeros(d.getDate(), 2) + ' ' +

			    leadingZeros(d.getHours(), 2) + ':' +
			    leadingZeros(d.getMinutes(), 2) + ':' +
			    leadingZeros(d.getSeconds(), 2);

			  return s;
			}

			function leadingZeros(n, digits) {
			  var zero = '';
			  n = n.toString();

			  if (n.length < digits) {
			    for (i = 0; i < digits - n.length; i++)
			      zero += '0';
			  }
			  return zero + n;
			}

		$("#userLevel option").each(function(){
			if($(this).val()=="${user.userLevel}"){
				$(this).attr("selected","selected");
			}
		})
		
		$("#loglog").click(function(){
			var userId = "${user.userId}";
			$.ajax({
				url:"getLoglog",
				method:"post",
				data: {
					userId:userId
				},
				success:function(data){
					$("#loginLog").text("");
					for(var i = 0 ; i < data.length ; i++){
						var date = new Date(data[i].loglogDate);
						var p = $("<p></p>");
						p.text(getTimeStamp(date))
						$("#loginLog").append(p);
					}
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '삭제를 실패하였습니다.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})
		})
		
		$("#purl").click(function(){
			var userId = "${user.userId}";
			$.ajax({
				url:"getPurl",
				method:"post",
				data: {
					userId:userId
				},
				success:function(data){
					$("#purlTbody").text("");
					for(var i = 0 ; i < data.length ; i++){
						if(data[i] != null){
							var tr = $("<tr></tr>");
							var list = [];
							var number = $("<td></td>");
							number.text(i+1);
							tr.append(number);
							var ordDate = $("<td></td>");
							var date = new Date(data[i].ordDate);
							ordDate.text(getTimeStamp(date))
							tr.append(ordDate);
							var godName = $("<td></td>");
							var god = data[i].godName.split(',');
							godName.text(god[0] + ' 외 '  + (god.length-1) + '개');
							tr.append(godName);
							var totalprice = $("<td></td>");
							totalprice.text(numberWithCommas(data[i].totalPrice)+"원");
							tr.append(totalprice);
							$("#purlTbody").append(tr);
						}
					}
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '삭제를 실패하였습니다.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})
		})
		
		$("#polg").click(function(){
			var userId = "${user.userId}";
			$.ajax({
				url:"getPointLogs",
				method:"post",
				data: {
					userId:userId
				},
				success:function(data){
					$("#pointBody").text("");
					for(var i = 0 ; i < data.length ; i++){
						if(data[i] != null){
							var tr = $("<tr></tr>");
							var number = $("<td></td>");
							number.text(i+1);
							tr.append(number);
							var polgDate = $("<td></td>");
							var date = new Date(data[i].polgDate);
							polgDate.text(getTimeStamp(date))
							tr.append(polgDate)
							var polgContent = $("<td></td>");
							polgContent.text(data[i].polgContent);
							tr.append(polgContent);
							var polgChange = $("<td></td>");
							polgChange.text(data[i].polgChange);
							tr.append(polgChange);
							$("#pointBody").append(tr);
						}
					}
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '삭제를 실패하였습니다.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})
		})
		
		$("#leave").click(function(){
			var form = $("<form></form>");
			form.attr({
				action:"modifyUserState",
				method:"post",
				style:"display:none"
			})
			var input = $("<input></input>");
			var userId = "${user.userId}"
			input.attr({
				name:"userId",
				type:"text"
			})
			input.val(userId);
			form.append(input);
			$("body").append(form);
			form.submit();
		})
	})
</script>	
</body>
</html>