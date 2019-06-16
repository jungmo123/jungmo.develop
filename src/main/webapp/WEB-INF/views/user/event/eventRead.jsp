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
	#content{
		width:900px;
	}
	#content > strong{
		font-size:20px;
	}
	#eventContent p{
		font-size:20px;
		font-weight:bold;
	}
	#contentInfo,#eventbody{
		margin:10px 0px 10px 0px;
	}
	#contentInfo span:nth-child(2){
		float:right;
	}
	#eventbody{
		width:100%;
		height:500px;
		border:1px solid #F2F5F7;
		padding:10px;
		overflow:auto;
	}
	#buttonBox button{
		display:inline-block;
		width:100px;
		margin-right:10px;
		float:right;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<strong>&#124;&nbsp;이벤트</strong>
			<hr>
			<div id = "eventContent">
				<p>${event.eventTitle}</p>
				<hr>
				<div id = "contentInfo">
					<span>기간&nbsp;:&nbsp;${event.eventSDate}&nbsp;&nbsp;~&nbsp;&nbsp;${event.eventEDate}</span>
					<span>조회수 : ${event.eventViewCnt}회</span>
				</div>
				<hr>
				<div id = "eventbody">
					${event.eventContent}
				</div>
				<hr>
				<div id = "buttonBox">
					<div id = "rightBox">
						<button class = "form-control" onclick = "location.href='/shoppingmall/EIDX'">목록</button>
						<button id = "pre" class = "form-control" >이전글&nbsp;<span class = "glyphicon glyphicon-triangle-top"></span></button>
						<button id = "next" class = "form-control">다음글&nbsp;<span class = "glyphicon glyphicon-triangle-bottom"></span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	$("#pre").click(function(){
		if("${event.preNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '이전글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/eventRead${event.preNum}";
		}
	})
	
	$("#next").click(function(){
		if("${event.nextNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '다음글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/eventRead${event.nextNum}";
		}
	})	
	</script>

</body>
</html>