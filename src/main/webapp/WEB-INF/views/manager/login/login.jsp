<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	body .container:nth-child(1) span{
		
	}
	h3,h4{
		display:inline-block;
		margin-right:10px;
	}
	hr{
		margin:0px;
		border:0;
		height:3px;
		background:grey;
	}
	#vl{
		margin-top:0px;
		margin-bottom:0px;
		position:relative;
		bottom:3px;
	}
	#loginC{
		text-align:center;
		margin-top:100px;
	}
	#loginC h4{
		font-weight:bold;
	}
	#submit{
		width:68px;
		height:65px;
		position:relative;
		bottom:65px;
		left:140px;
		border-radius:10px;
		border:1px solid grey;
	}
	.form-group div{
		margin-top:5px;
	}
	
	input{
		width:200px;
		height:30px;
	}
	p{
		margin:0;
		font-weight:bold;
	}
	#panel{
		width:500px;
		text-align:center;
	}
	#panel .panel-heading{
		border:1px solid grey;
	}
	.panel-body{
		line-height:25px;
		text-align:left;
		border:1px solid grey;
	}
	.container span{
		font-size:32px;
		margin-right:10px;
	}
	.container span:nth-child(2){
		color:#FF6F43;
	}
	.container span:nth-child(1){
		color:#5D646E;
	}
	.container a{
		text-decoration:none;
	}
</style>
</head>
<body>
	<div class = "container">
		<h3 id = "vl">&#124;</h3>
		<a href = "../MAIN/01.html">
			<span>LALA</span>
			<span>MARKET</span>		
		</a>
		<h3>Admin Login</h3>
		<hr>
	</div>
	
	<div class = "container" id = "loginC">
		<h4>&#124;</h4><h4>Admin Login</h4>
		<div>
			<form id = "loginForm" action = "adminloginCheck" method = "post">
				<div class = "form-group">
					<div>
						<input type = "text"  name = "userId"  id = "userId" placeholder = "아이디를 입력하세요!" />
					</div>
					<div>
						<input type = "password" name = "userPwd" id = "userPwd" placeholder = "비밀번호를 입력해 주세요!" />
					</div>
					<button type = "submit" id = submit><p>보안</p><p>로그인</p></button>
				</div>
			</form>
		</div>
	</div>
		<div id = "panel" class = "container">
			<div class = "panel panel-default">
				<div class = "panel-heading"><p>관리자 계정 생성 안내</p></div>
				<div class = "panel-body">
					<p>- 이용자 화면에서 회원 가입한 후 아래의 정보를 연락해 주세요!</p>
					<p>- 한아름 과장 / 000-0000-0000 / admin@lala.com</p>
					<p>- 아이디와 비밀번호는 이용자 화면에서 찾을 수 있습니다.</p>
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
				url:"adminloginCheck",
				method:"post",
				data:{
					userId:$("#userId").val(),
					userPwd:$("#userPwd").val()
				},
				success:function(bl){
					if(bl == true){
						location.href="adminMain";
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