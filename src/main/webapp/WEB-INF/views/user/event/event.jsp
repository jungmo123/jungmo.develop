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
	table tr{
		cursor:pointer;
	}
	table td:nth-child(1){
		width:200px;
		height:100px;
		text-align:center;
	}
	table td:nth-child(1) div{
		height:100px;
		border:1px solid black;
	}
	table td:nth-child(2) div{
		line-height:25px;
	}
	table td:nth-child(2) div div:nth-child(1) span:nth-child(2){
		float:right;
	}
	table td:nth-child(2) div div:nth-child(2){
		height:50px;
	}
	#buttonBox button{
		display:inline-block;
		width:100px;
	}
	#buttonBox button:first-child{
		float:left;
	}
	#buttonBox button:last-child{
		float:right;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
	}
	#pagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
	}
	img{
		width:182px;
		height:98px;
	}
	td > div > div:first-child span:first-child{
		font-weight:bold;
	}
	.summary p{
		margin:0;
		color:#878787;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<strong>&#124;&nbsp;이벤트</strong>
			<hr>
			<div id = "eventDiv">
					<table id = "eventTable" class = "table table-hover">
						<c:forEach var = "event" items = "${posts}" varStatus = "state">
						<tr>
							<td id = "${event.eventNum}" class = "check">
								<div>
									<img src = "upload/${event.eventListImageUrl}" />
								</div>
							</td>
							<td id = "${event.eventNum}" class = "check">
								<div>
									<div>
										<span>${event.eventTitle }</span>
										<span>조회수 : ${event.eventViewCnt}</span>
									</div>
									<div class = "summary">
										<span>${event.eventSummary }</span>
									</div>
									<div>
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<fmt:formatDate value="${event.eventEDate}" pattern="yyyy-MM-dd" var="edate" />
										<span>${event.eventSDate}&nbsp;&nbsp;~&nbsp;&nbsp;${edate}
										<c:if test = "${edate > today}">
											&nbsp;&#124; 진행 중
										</c:if>
										<c:if test = "${edate < today}">
											&nbsp;&#124; 종료
										</c:if></span>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>
					</table>
					<hr>
			 			<div id = "pagination">
							<div>
								<ul class = "pagination">
										<c:if test = "${pageMaker.prev}">
											<li><a href = "event${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
										</c:if>
										
										<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
											<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
												<a href = "event${idx}">${idx}</a>
											</li>
										</c:forEach>
				
										<c:if test = "${pageMaker.next}">
											<li><a href = "event${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
										</c:if>
								</ul>
							</div>		
						</div>
			</div>
		</div>
	</div>
	
<script>
$(".check").click(function(){
	var eventNum = $(this).attr("id");
	location.href="/shoppingmall/eventRead" + eventNum;
})
</script>

</body>
</html>