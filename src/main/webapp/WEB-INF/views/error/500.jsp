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
	.container p:nth-child(3) span:last-child{
		color:lightgrey;
	}
	.container p:nth-child(4){
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
		<p>죄송합니다. 예상치 못한 시스템 오류가 발생하였습니다.</p>
		<p><span>빠른 해결을 위하여 고객센터로 연락 바랍니다.</span><span>&nbsp;1544-0000</span></p>
		<p>감사합니다.</p>
	</div>	
</body>
</html>