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
	#confirm{
		margin-top:100px;
		display:inline-block;
		width:800px;
		text-align:center;
	}
	#confirm p{
		margin-bottom:20px;
	}
	#confirm input{
		display:inline-block;
		width:120px;
		height:30px;
		position:relative;
		top:2px;
	}
	#confirm button{
		padding:0;
		width:60px;
		height:30px;
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
				<strong>&#124;&nbsp;비밀번호 확인</strong>
				<div id = "confirm">
					<p>
						사용자 확인을 위해 비밀번호를 다시 한번 입력해주세요!
					</p>
					<p>
						<strong>비밀번호 입력 : </strong>
						<input type = "password" class = "form-control" />
						<button id = "submit" class  = "btn btn-default">확인</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
		$("#submit").click(function(){
			var password = $("input[type='password']").val();
			$.ajax({
				url:"passCheck",
				data: {
					password:password
				},
				method:"post",
				success:function(data){
					var address = "${address}"
					if(data == 'true'){
						location.href = address;
					}else{
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '암호가 틀렸습니다.',
							  showConfirmButton: false,
							  timer: 1500
							});						
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
		})
	</script>
</body>
</html>