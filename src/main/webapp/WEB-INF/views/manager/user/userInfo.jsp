<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
		margin-left:10px;
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
	#receipt .modal-dialog{
		width:420px;
	}
	#receipt .modal-header{
		border:0;
	}
	#receipt .modal-body{
		padding:0px 15px 0px 15px;
	}
	#receipt .modal-body div{
		margin-bottom:10px;
	}
	#receipt table tr th,
	#receipt table tr td{
		text-align:center;
	}
	#receipt #table{
		width:100%;
		height:200px;
    	display: block;
    	overflow: auto;
	}
	#receipt #closeButton{
		text-align:center;
	}
	#receipt #closeButton button{
		width:100px;
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
				<a href="../USER/03.html"><span>탈퇴 회원 목록</span></a>
				<a href="../USER/04.html"><span>메일 관리</span></a>
				<a href="../USER/05.html"><span>SMS 관리</span></a>
				<a href="../USER/06.html"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 교환/환불 > 상세보기</p>
			</div>
		<form>
			<div id = "apply">
				<div id = "stateInfo">
					<strong>가입정보</strong>
				</div>
				<div>
					<table id = "firstTable">
						<tr>
							<td>						
								<strong>이름</strong>
							</td>
							<td>
								<span>홍길동</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>아이디</strong>
							</td>
							<td>
								<div>
									<span>person</span>
								</div>															
							</td>												
						</tr>
						<tr>
							<td>						
								<strong>비밀번호</strong>
							</td>
							<td id = "passwordForm">
								<span>
									<input type = "password" name = "password" />
									<input type = "password" name = "confirm" />	
								</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>이메일</strong>
							</td>
							<td id = "emailForm">
								<span>
									<input type = "text" name = "emailId" />
									<span>@</span>
									<input type = "text" name = "emailAddress" />
									<span>메일 수신 여부 : </span>
									<input type="radio" name="emailSelect" id="emailAgree" class="custom-control-input">
									<label class="custom-control-label" for="mail">수신</label>
									<input type="radio" name="emailSelect" id="emailReject" class="custom-control-input">
									<label class="custom-control-label" for="mailReject">거부</label>	
								</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>연락처</strong>
							</td>
							<td id = "phoneForm">
								<span>
									<input type = "number" name = "phone1" />
									<span>-</span>
									<input type = "number" name = "phone2" />
									<span>-</span>
									<input type = "number" name = "phone3" />
									<span>SMS 수신 여부 : </span>
									<input type="radio" name="sms" id="smsAgree" class="custom-control-input">
									<label class="custom-control-label" for="mail">수신</label>
									<input type="radio" name="sms" id="smsReject" class="custom-control-input">
									<label class="custom-control-label" for="mailReject">거부</label>	
								</span>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>주소</strong>
							</td>
							<td id = "addressForm">
								<div>
									<input type = "text" name = "address1" />
									<button class = "btn btn-default">우편번호 검색</button>
								</div>
								<div>
									<input type = "text" name = "address2" />
									<input type = "text" name = "address3" />
								</div>
							</td>
						</tr>
						<tr>
							<td>						
								<strong>동의 내역</strong>
							</td>
							<td>
								<span>이용약관 :</span>
								<span>동의</span>
								<span>&#124;</span>
								<span>개인정보 처리방침 :</span>
								<span>동의</span>
								<span>&#124;</span>
								<span>마메팅 동의 : </span>
								<span>미동의</span>
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
								<span>2023-08-23 12:30:20</span>
							</td>
							<td>
								<strong>회원 등급</strong>
							</td>
							<td>
								<span>
									<select>
										<option>1</option>
									</select>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<strong>방문횟수</strong>
							</td>
							<td>
								<span>23회</span>
								<button class = "btn btn-default" data-toggle = "modal" data-target = "#date">로그인 기록 보기</button>
							</td>
							<td>
								<strong>최근 로그인</strong>
							</td>
							<td>
								<span>2023-08-23 12:30:20</span>
							</td>
						</tr>
						<tr>
							<td>
								<strong>총 구매 금액</strong>
							</td>
							<td>
								<span>125,000</span>
								<button class = "btn btn-default" data-toggle = "modal" data-target = "#receipt">구매 내역 보기</button>
							</td>
							<td>
								<strong>포인트</strong>
							</td>
							<td>
								<span>2,500원</span>
								<button class = "btn btn-default">포인트 적립 내역 보기</button>
							</td>
						</tr>
					</table>
					<div id = "buttonBox">
						<div>
							<button class = "btn btn-default">회원 탈퇴</button>
						</div>
						<div>
							<button class = "btn btn-default">수정</button>
							<button class = "btn btn-default">취소</button>
						</div>
						<div>
							<button class = "btn btn-default">목록보기</button>
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
						<span>person</span>					
					</div>
					<textarea rows = "13">
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
2023-08-23 12:30:20
</textarea>			<div id = "closeButton">
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
						<span>person</span>					
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
							<tbody>
								<tr>
									<td>6</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>5</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>4</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>1</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
								<tr>
									<td>0</td>
									<td>2023-12-12</td>
									<td>실크 브라우스 외 1건</td>
									<td>115,000원</td>
								</tr>
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
</body>
</html>