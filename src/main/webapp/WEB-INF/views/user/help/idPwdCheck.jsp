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
	#adviser{
 		width:780px;
		height:120px;
		padding:10px;
		margin-bottom:30px;
		margin-top:20px;
		border:1px solid grey;
	}
	#adviser div{
		display:inline-block;
	}
	#adviser div:first-child{
		width:200px;
		height:100px;
		float:left;
	}
	#adviser div:last-child{
		height:100px;
		padding:10px;
		line-height:25px;
		float:left;
	}
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:200px;
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
	#inquiry,#help{
		margin-top:10px;
		width:160px;
		border:1px solid grey;
		float:left;
		text-align:center;
		line-height:25px;
		padding:10px;
		cursor:pointer;		
	}
	#inquiry{
		height:100px;
	}
	#help{
		height:120px;
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
	a{
		color:black;
	}
	.col-md-offset-3 {
	    margin-left: 0;
	}
	.col-md-6 {
	    width:830px;
	}
	.panel-login {
		border-color: #ccc;
		-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
		-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
		box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	}
	.panel-login>.panel-heading {
		color: #00415d;
		background-color: #fff;
		border-color: #fff;
		text-align:center;
	}
	.panel-login>.panel-heading a{
		text-decoration: none;
		color: #878787;
		font-weight: bold;
		font-size: 15px;
		-webkit-transition: all 0.1s linear;
		-moz-transition: all 0.1s linear;
		transition: all 0.1s linear;
	}
	.panel-login>.panel-heading a.active{
		color: #767676;
		font-size: 18px;
	}
	.panel-login>.panel-heading hr{
		margin-top: 10px;
		margin-bottom: 0px;
		clear: both;
		border: 0;
		height: 1px;
		background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
		background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
		background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
		background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	}
	.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
		height: 45px;
		width:600px;
		border: 1px solid #ddd;
		font-size: 16px;
		-webkit-transition: all 0.1s linear;
		-moz-transition: all 0.1s linear;
		transition: all 0.1s linear;
	}
	.panel-login input:hover,
	.panel-login input:focus {
		outline:none;
		-webkit-box-shadow: none;
		-moz-box-shadow: none;
		box-shadow: none;
		border-color: #ccc;
	}
	.btn-login {
		background-color: #F2F5F7;
		outline: none;
		color: #878787;
		font-size: 18px;
		height: auto;
		font-weight: normal;
		padding: 14px 0;
		text-transform: uppercase;
		border-color: #lightgrey;
	}
	.btn-login:hover,
	.btn-login:focus {
		color: #878787;;
		background-color: #lightgrey;
		border-color: #878787;
	}
	
	.btn-register {
		background-color: #F2F5F7;
		outline: none;
		color: #878787;
		font-size: 18px;
		height: auto;
		font-weight: normal;
		padding: 14px 0;
		text-transform: uppercase;
		border-color: #lightgrey;
	}
	.btn-register:hover,
	.btn-register:focus {
		color: #878787;;
		background-color: #lightgrey;
		border-color: #878787;
	}
	#login-form div:nth-child(1){
		margin-bottom:10px;
	}
	#login-form div:nth-child(2),
	#login-form div:nth-child(3){
		display:inline-block;
		float:left;
	}
	#login-form div:nth-child(4){
		width:150px;
		height:100px;
		float:left;
	}
	#login-submit,
	#login-retry{
		width:120px;
		height:100px;
	}
	#login-form #loginResult{
		width:800px;
	}
	#loginResult > div:nth-child(2){
		width:600px;
	}
	.col-sm-6{
		margin-left:5%;
	}
	#register-form div:nth-child(1){
		margin-bottom:10px;
	}
	#register-form >div >div:nth-child(2),
	#register-form >div >div:nth-child(3){
		display:inline-block;
	}
	#register-form > div:nth-child(1) > div:nth-child(2),
	#register-form > div:nth-child(2) > div:nth-child(2){
		width:600px;
		float:left;
	}
	#register-form > div:nth-child(3){
		width:150px;
		height:100px;
		float:left;
	}
	#register-submit,
	#register-retry{
		width:120px;
		height:160px;
	}
	.none{
		display:none !important;
	}
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#counselor{
		width:200px;
		height:100px;
	}
	#idResult{
		overflow:auto;
		height:115px;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id = "adviser" class = "center-block">
			<div>
				<img id = "counselor" src = "IMAGE/counselor.jpg">
			</div>
			<div>
				<strong>무엇을 도와 드릴까요?</strong>
				<br>
				<span>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화 주시거나 1:1문의로 남겨주세요.</span>
				<br>
				<span>친절히 안내해 드립니다.</span>
			</div>
		</div>
		
		<div id="content">
		<div id = "navBar">
			<div id="nav">
				<div id="navTitle">
					<span>고객센터</span>
				</div>
			<div id="navContent">
				<div>
					<a href="notice"><span>> 공지사항</span></a>
					<a href="community"><span>> 커뮤니티</span></a> 
					<c:choose>
					<c:when test = "${type eq 'id' }">
					<a href="idSearch" class = "activeMenu"><span>> 아이디 찾기</span></a>
					<a href="pwdSearch"><span>> 비밀번호 찾기</span></a>
					</c:when>
					<c:otherwise>
					<a href="idSearch"><span>> 아이디 찾기</span></a>
					<a href="pwdSearch" class = "activeMenu"><span>> 비밀번호 찾기</span></a>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			</div>
			<div id = "inquiry" onClick = "location.href='../MYPAGE/BOARD/01.html';">
				<div onclick = "location.href = '../MYPAGE/BOARD/01.html'">
					<strong>1:1 문의</strong>
				</div>
				<div onclick="location.href='../MYPAGE/BOARD/03.html'">
					<span>비공개로 고객님께</span>
					<br>
					<span> 맞춤 답변을 드립니다.</span>
				</div>				
			</div>
			<div id = "help" onClick = "location.href='/shoppingmall/notice';">
				<div>
					<strong>고객센터</strong><br>
					<strong>070-0000-0000</strong>
				</div>
				<div>
					<span> 평일 10시-18시</span><br>
					<span>공휴일,주말 휴무</span>
				</div>	
			</div>
		</div>
		<div id = "tableDiv">
			<strong>&#124;&nbsp;아이디/비밀번호 찾기</strong>
			<hr>
		    	<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-login">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" id="login-form-link">아이디 찾기</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="register-form-link">비밀번호 찾기</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="login-form" style="display: block;">
											<div id = "loginDiv">
												<div>
													<strong>&#124;&nbsp;가입 시 등록하신 정보를 입력해 주세요!</strong>
												</div>
												<div >
													<div class="form-group">
														<input type="text" name="username" id="Idusername" tabindex="1" class="form-control" placeholder="이름" value="">
													</div>
													<div class="form-group">
														<input type="text" name="email" id="Idemail" tabindex="2" class="form-control" placeholder="이메일">
													</div>										
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<button type="button" id="login-submit" tabindex="4" class="form-control btn btn-login">확인</button>
														</div>
													</div>
												</div>
											</div>
											<div id = "loginResult" class = "none">
												<div>
													<strong>&#124;&nbsp;아이디 조회 결과</strong>
												</div>
												<div id = "idResult">
							
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<button type="button" id="login-retry" tabindex="4" class="form-control btn btn-login">다시찾기</button>
														</div>
													</div>
												</div>
											</div>
										</form>
										<form id="register-form" style="display: none;">
											<div id = "pwdDiv">
												<div>
													<strong>&#124;&nbsp;스타일 숍 회원</strong>
												</div>
												<div>
													<div class="form-group">
														<input type="text" name="username" id="pwdusername" tabindex="1" class="form-control" placeholder="이름" value="">
													</div>
													<div class="form-group">
														<input type="text" name="userid" id="pwduserid" tabindex="1" class="form-control" placeholder="아이디" value="">
													</div>
													<div class="form-group">
														<input type="email" name="email" id="pwdemail" tabindex="1" class="form-control" placeholder="이메일" value="">
													</div>										
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<button type="button" id="register-submit" tabindex="4" class="form-control btn btn-register">확인</button>
														</div>
													</div>
												</div>
											</div>
											<div id = "pasResult" class = "none">
												<div>
													<strong>&#124;&nbsp;비밀번호 찾기 결과</strong>
												</div>
												<div id = "pwdResult">
									
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<button type="button" id="register-retry" tabindex="4" class="form-control btn btn-register">다시 찾기</button>
														</div>
													</div>
												</div>											
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type = "text/javascript">
	var type = "${type}"
	$(function() {		
	    $('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
	 		$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
	 		$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});

		$("#login-submit").click(function(){
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var text = "";
			var name = $("#Idusername").val();
			var email = $("#Idemail").val();

			if(name == ""){
				text = "이름을 입력하세요!"
			}else if(email == ""){
				text = "이메일을 입력하세요!"
			}else if(!emailRule.test(email)){            
				text = "이메일 양식에 맞게 입력하세요!";
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
			
			$.ajax({
				url:"searchId",
				data: {
					name:name,
					email:email
				},
				method:'post',
				success:function(data){
					if(data == ""){
						var p1 = $("<p>입력하신 정보와 일치하는 정보가 없습니다.</p>");
						var p2 = $("<p>다시 확인하고 조회해 주세요!</p>");
						$("#idResult").append(p1);
						$("#idResult").append(p2);
					}else{
						$.each(data,function(index,item){
							var p = $("<p></p>");
							var span = $("<span></span>");
							var id = item.userId;
							var length = id.length;
							id = id.substring(0,length-2);
							id = id + "**";
							span.text(id);
							p.append(span);
							$("#idResult").append(p);
						})
					}
					$("#loginDiv").addClass("none");
					$("#loginResult").removeClass("none");
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
		
		$("#login-retry").click(function(){
			$("#idResult").text("");
			$("#Idusername").val("");
			$("#Idemail").val("");
			$("#loginDiv").removeClass("none");
			$("#loginResult").addClass("none");
		})
		
		$("#register-retry").click(function(){
			$("#pwdResult").text("");
			$("#pwduserid").val("");
			$("#pwdusername").val("");
			$("#pwdemail").val("");
			$("#pwdDiv").removeClass("none");
			$("#pasResult").addClass("none");
		})
		
		if(type == 'id'){
			$("#login-form-link").trigger("click");
		}else{
			$("#register-form-link").trigger("click");
		}
	});
	
	$("#register-submit").click(function(){
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var text = "";
		var id = $("#pwduserid").val();
		var name = $("#pwdusername").val();
		var email = $("#pwdemail").val();

		if(name == ""){
			text = "이름을 입력하세요!"
		}else if(id == ""){
			text = "아이디를 입력하세요!"
		}else if(email == ""){
			text = "이메일을 입력하세요!"
		}else if(!emailRule.test(email)){            
			text = "이메일 양식에 맞게 입력하세요!";
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
		
		$.ajax({
			url:"searchPwd",
			data: {
				id:id,
				name:name,
				email:email
			},
			method:'post',
			success:function(data){
				if(data == "yes"){
					var p = $("<p>가입 시 등록하신 매일 주소로 임시 비밀번호를 발송해 드렸습니다.</p>");
					$("#pwdResult").append(p);
				}else{
					var p1 = $("<p>입력하신 정보와 일치하는 정보가 없습니다.</p>");
					var p2 = $("<p>정보를 다시 확인하시고 조회해 주세요!</p>");
					$("#pwdResult").append(p1);
					$("#pwdResult").append(p2);
				}
				$("#pwdDiv").addClass("none");
				$("#pasResult").removeClass("none");
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
	
	</script>
</body>
</html>