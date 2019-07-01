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
	#passChange{
		text-align:center;
		margin-top:100px;
	}
	#passChange hr{
		width:300px;
	}
	#passChange div{
		margin-top:10px;
	}
	#passChange span{
		color:#878787;
	}
	#passChange div input{
		display:inline-block;
		width:150px;
		height:30px;
		margin-left:10px;
		position:relative;
		top:2px;
	}
	#passChange #buttonGroup{
		margin-top:30px;
	}
	#buttonGroup button{
		width:60px;
		height:25px;
		padding:0;
		font-weight:bold;
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
						<a href = "personalData"><span>> 개인정보 수정</span></a>
						<a href = "passwordModify" class= "activeMenu"><span>> 비밀번호 변경</span></a>
					</div>
					<a href = "unregister"><span>회원탈퇴</span></a>
				</div>
			</div>		
		</div>
			<div id = "tableDiv">
				<strong>&#124;&nbsp;비밀번호 변경</strong>
				<div id = "passChange">
					<div>
						<strong>현재의 비밀번호 입력 : </strong>
						<input id = "current" class = "form-control" type ="password" name = "current" />
						<hr>
					</div>
					<div>
						<strong>새로운 비밀번호 입력 : </strong>
						<input id = "change" class = "form-control" type ="password" name = "change" />
					</div>
					<div>
						<strong>새로운 비밀번호 확인 : </strong>
						<input id = "changeC" class = "form-control" type ="password" name = "changeC" />
					</div>
					<div>
						<span>※ 영문,숫자를 조합하여 8~20자 이내로 입력</span>
					</div>
					<div id = "buttonGroup">
						<button class = "btn btn-default" id = "changeB">변경</button>
						<button class = "btn btn-default" onclick="location.href='../SHOPPING/01.html'">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
		$("#changeB").click(function(){
			var current = $("#current").val();
			var change = $("#change").val();
			var changeC = $("#changeC").val();
			var text = "";
			if(current == ""){
				text = "현재 비밀번호를 입력하세요!";
			}else if(change == ""){
				text = "새로운 비밀번호를 입력하세요!";
			}else if(changeC == ""){
				text = "비밀번호 확인을 입력하세요!"
			}else if(changeC != change){
				text = "비밀번호가 같지 않습니다!"
			}else if(!/(?=.*\d{1,50})(?=.*[a-zA-Z]{1,50}).{8,20}$/.test(change)){
				text = "영문,숫자를 조합하여 8~20자 이내로 입력해주세요!"
			}
			
			if(text != ""){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: text,
					  showConfirmButton: false,
					  timer: 1500
					});			
			}else{
				$.ajax({
					url:"passModify",
					data: {
						current:current,
						change:change,
						changeC:changeC
					},
					method:"post",
					success:function(data){
						if(data == "true"){
							Swal.fire({
								  position: 'top',
								  type: 'success',
								  title: '변경되었습니다!',
								  showConfirmButton: false,
								  timer: 1500
								});								
						}else{
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: "현재 비밀번호가 틀렸습니다!",
								  showConfirmButton: false,
								  timer: 1500
								});								
						}
					},
					error:function(a,b,errMsg){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: errMsg,
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