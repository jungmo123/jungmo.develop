<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/login.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	.container{
		width:850px;
	}
	#header{
		width:800px;
		margin-top:50px;
		text-align:center;
		position:relative;
		left:10px;
	}
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>

	<div class = "container">
		<div id = "header">
			<div id = "title">
				<strong>라라마켓</strong>
				<br>
				<span>안 입는 옷을 판매하고, 새 옷으로 구매하세요!</span>
				<div id = "searchBar">
					<select class = "form-control">
						<option>전체 검색</option>
					</select>
					<input type = "text" class = "form-control" name = "title" placeholder = "검색어를 입력하세요!"/>
					<button type = "button" class = "btn btn-default">검색</button>
				</div>
				<div id = "nav">
					<div id = "loginBar">
						<a href = "join01"><span>회원가입</span></a>
						<span>&#124;</span>
						<a href = "login"><span>로그인</span></a>
						<span>&#124;</span>
						<a href = "../HELP/08.html"><span>ID/비밀번호 
						찾기</span></a>
					</div>
					<div class = "btn-group btn-group-justified">
						<a href = "#" class = "btn btn-default">스타일 숍</a>
						<a href = "#" class = "btn btn-default">라라마켓</a>
						<a href = "#" class = "btn btn-default">상품평</a>
						<a href = "#" class = "btn btn-default">이벤트</a>
						<a href = "#" class = "btn btn-default">고객센터</a>
					</div>					
				</div>
			</div>
		</div>
		<div id = "content">
			<div id = "join">
				<strong>라라마켓 회원 로그인</strong>
				<hr>
				<form id = "loginForm" action = "loginCheck" method = "post">
					<div>
						<div>
							<input id = "userId" class = "form-control" type = "text" name = "userId" placeholder = "아이디를 입력하세요!">
							<input id = "userPwd" class = "form-control" type = "password" name = "userPwd" placeholder = "비밀번호를 입력해 주세요!">
						</div>
						<div>
							<button class = "btn btn-default">로그인</button>
						</div>
					</div>
				</form>
				<div>
					<a href = "join01"><span>회원 가입</span></a>
					<span>&#124;</span>
					<a href = "../HELP/08.html"><span>ID/비밀번호 찾기</span></a>				
				</div>
			</div>
			<div id = "center">
				<span>고객센터</span>
				<br>
				<span>070-0000-0000</span>
				<br>
				<span>평일 10~18시 / 공휴일, 주말 휴무</span>
			</div>
		</div>
	</div>


<script type = "text/javascript">
	$("#loginForm").submit(function(e){
		e.preventDefault();
		if($("#userId").val() == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '아이디를 입력하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});			
		}else if($("#userPwd").val() == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '비밀번호를 입력하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});				
		}else{
			$.ajax({
				url:"loginCheck",
				method:"post",
				data:{
					userId:$("#userId").val(),
					userPwd:$("#userPwd").val()
				},
				success:function(bl){
					if(bl == true){
						location.href="/shoppingmall/";
					}else{
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '아이디,비밀번호가 일치하지않습니다!',
							  showConfirmButton: false,
							  timer: 1500
							});							
					}
				}
			})
		}
	})
</script>
</body>
</html>