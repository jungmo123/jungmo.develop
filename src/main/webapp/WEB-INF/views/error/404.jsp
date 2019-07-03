<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container {
		text-align:center;
		width:900px;
		position:relative;
		top:230px;
	}
	.container img{
		width:260px;
		height:190px;
	}
	.container p:nth-child(2){
		font-size:26px;
		color: #FF6F43;
	}
	.container p:not(:nth-child(2)){
		color: #5D646E;
		font-size:20px;
	}
	.container p:nth-child(6){
		color:black;
		font-weight:bold;
	}
	.container  a{
		margin-top:30px;
		width:160px;
	}
</style>
</head>
<body>
	<div class = "container">
		<img src = "<c:url value="/IMAGE/fail.jpg" />">
		<p>죄송합니다.현재 찾을 수 없는 페이지를 요청 하셨습니다.</p>
		<p>존재하지 않는 주소를 입력하셨거나,</p>
		<p>요청하신 페이지의 주소가 변경,삭제되어 찾을 수 없습니다.</p>
		<p>궁금한 점이 있으시면 언제든 고객센터를 통해 문의해 주시기 바랍니다.</p>
		<p>감사합니다.</p>
		<a href = '/shoppingmall/' class = "btn btn-default">메인으로</a>
	</div>	
</body>
</html>