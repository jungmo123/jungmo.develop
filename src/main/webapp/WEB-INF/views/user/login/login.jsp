<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
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
	#header #title{
		margin-top:30px;
	}
	#header #title > strong{
		font-size:30px;
	}
	#searchBar{
		text-align:center;
		margin-top:10px;
	}
	input[type="text"]{
		display:inline;
		width:280px;
		height:25px;
	}
	#searchBar select{
		display:inline;
		width:100px;
		height:26px;
		padding:0;
		font-size:12px;	
		position:relative;
		bottom:1px;	
	}
	#searchBar .btn{
		width:60px;
		height:25px;
		padding:0;
		font-size:12px;
		font-weight:bold;
		position:relative;
		bottom:2px;	
	}
	#nav{
		margin-top:50px;
	}
	#nav #loginBar{
		float:right;
		margin:0 10px 2px 0;
	}
	#nav #loginBar a{
		color:#878787;
		margin:0 5px 0px 5px;
		font-size:12px;
	}
	#content{
		margin-top:70px;
		text-align:center;
	}
	#content #join{
		display:inline-block;
		width:270px;
		height:130px;
		text-align:left;
		margin-right:10px;
	}
	#content #join hr{
		margin:5px;
	}
	#content #join > form > div:first-child{
		width:300px;
		height:70px;
	}
	#content #join > form > div > div:first-child{
		display:inline-block;
		width:200px;
		float:left;
	}
	#content #join > form > div > div:last-child{
		display:inline-block;
		width:50px;
		float:left;
	}
	#content #join > form >div > div:first-child input{
		width:190px;
		margin:2px;
	}
	#content #join > form > div > div:last-child button{
		width:60px;
		height:60px;
		position:relative;
		top:2px;
	}
	#content #join > div:last-child a span{
		color:black;
		margin:0 5px 0 5px;
	}
	#content #center{
		display:inline-block;
		width:250px;
		line-height:25px;
		border:1px solid grey;
		padding:10px;
		position:relative;
		bottom:20px;
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
						<a href = "../JOIN/01.html"><span>회원가입</span></a>
						<span>&#124;</span>
						<a href = "#"><span>로그인</span></a>
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
				<form method = "post">
					<div>
						<div>
							<input class = "form-control" type = "text" name = "id" placeholder = "아이디를 입력하세요!">
							<input class = "form-control" type = "password" name = "password" placeholder = "비밀번호를 입력해 주세요!">
						</div>
						<div>
							<button class = "btn btn-default" onclick = "location.href = '../MAIN/02.html'">로그인</button>
						</div>
					</div>
				</form>
				<div>
					<a href = "../JOIN/01.html"><span>회원 가입</span></a>
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

</body>
</html>