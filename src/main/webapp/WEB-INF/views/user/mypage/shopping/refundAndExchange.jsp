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
<script src="bootstrapFileinput/dist/bs-custom-file-input.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
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
	input[type='text']{
		width:500px;
		margin-left:10px;
	}
	#buttonGroup button{
		float:right;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/userheader.jsp" %>
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
				<strong>&#124;&nbsp;교환 환불 신청</strong>
				<div id="sAr">
					<hr>
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
											<input type="radio" name="sArSelect" id="swap" class="custom-control-input">
											<label class="custom-control-label" for="swap">교환</label>
											<input type="radio" name="sArSelect" id="rebate" class="custom-control-input">
											<label class="custom-control-label" for="rebate">환불</label>								
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
										<input type="radio" name="reason" id="change" class="custom-control-input">
										<label class="custom-control-label" for="change">색상/사이즈 변경</label>
										<input type="radio" name="reason" id=ungrounded class="custom-control-input">
										<label class="custom-control-label" for="ungrounded">단숨 변심</label>	
										<input type="radio" name="reason" id="break" class="custom-control-input">
										<label class="custom-control-label" for="break">제품 파손</label>
										<input type="radio" name="reason" id="wrongDelivery" class="custom-control-input">
										<label class="custom-control-label" for="wrongDelivery">오배송</label>	
										<input type="radio" name="reason" id="theRest" class="custom-control-input">
										<label class="custom-control-label" for="theRest">기타</label>	
									</span>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>내용작성</strong>
								</td>
								<td>
									<textarea placeholder = "구체적인 내용을 입력해주세요.&#13;&#10;변경할 색상과 사이즈를 작성해주세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>이미지 업로드</strong>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img1" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img2" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "img3" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
							<tr>
								<td>						
									<strong>배송비 결제</strong>
								</td>
								<td>
									<span>{배송비}원</span><br>
									<span>※ 교환/환불 사유가 '사이즈 색상 변경','단숨 변심'의 경우 배송비를 고객님께서
									부담하셔야 하므로,<br>&nbsp;&nbsp;&nbsp;<strong>[교환/환불 신청하기]</strong>클릭 시 배송비 결제가 진행됩니다.</span>
								</td>
							</tr>
						</table>				
					</div>
					<div id = "buttonGroup">
						<button class = "btn btn-default" onclick="location.href='02.html'">신청하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>