<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/AdminCss.css" />">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>
	#eventSearch{
		text-align:center;
		margin:10px 0px 20px 0px;
	}
	input[type="text"]{
		display:inline;
		width:350px;
	}
	.container select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#eventSearch button{
		width:100px;
		position:relative;
		bottom:2px;
	}
	table tr{
		cursor:pointer;
	}
	table td:nth-child(2){
		width:200px;
		height:100px;
		text-align:center;
	}
	table td:nth-child(2) div{
		height:100px;
		border:1px solid black;
	}
	table td:nth-child(3) div{
		line-height:25px;
	}
	table td:nth-child(3) div div:nth-child(1) span:nth-child(2){
		float:right;
	}
	table td:nth-child(3) div div:nth-child(2){
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
		<div id="title">
			<div id="logo">
				<a href="main"><span>LALA&nbsp;</span>MARKET</a>
				<div id="Admin">
					<h5>Administrator</h5>
				</div>
			</div>
			<div>
				<span> <i class="far fa-edit"></i>
				</span> <span>게시판 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="styleshop"><span>스타일 숍 공지</span></a> 
				<a href="cic"><span>고객센터 공지</span></a> 
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event" class="activeMenu"><span>이벤트</span></a>
				<a href="boardCategory"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판관리 > 이벤트 목록</p>
			</div>
			<hr>
			<div id = "eventSearch">
				<form action = "eventSearch1" method = "post">
					<select class = "form-control" name = "eventType">
						<option value = "0">제목+내용</option>
					</select>
					<input type = "text" class = "form-control" name = "eventSearch" />
					<button type = "submit" class = "btn btn-default">검색</button>
				</form>
			</div>
			<div id = "eventDiv">
					<table id = "eventTable" class = "table table-hover">
						<c:forEach var = "event" items = "${posts}" varStatus = "state">
						<tr>
							<td>
								<input id = "${event.eventNum}" class = "deleteCheck" type = "checkbox" name = "deleteSelect" />
							</td>
							<td id = "${event.eventNum}" class = "check">
								<div>
									<img src = "../upload/${event.eventListImageUrl}" />
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
					<div id = "buttonBox">
						<button id = "delete" class = "form-control">선택 삭제</button>
						<button class = "form-control" onclick = "location.href='/shoppingmall/admin/eventRegister'">이벤트 등록</button>
					</div>
			 			<div id = "pagination">
							<div>
								<ul class = "pagination">
										<c:if test = "${pageMaker.prev}">
											<li><a href = "event${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
										</c:if>
										
										<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
											<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
												<a href = "event${type}${idx}">${idx}</a>
											</li>
										</c:forEach>
				
										<c:if test = "${pageMaker.next}">
											<li><a href = "event${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
										</c:if>
								</ul>
							</div>		
						</div>
			</div>
		</div>
	</div>
</div>

<script>
$(".check").click(function(){
	var eventNum = $(this).attr("id");
	location.href="/shoppingmall/admin/eventRead" + eventNum;
})

$("#delete").click(function(){
	var list = [];
	$(".deleteCheck:checked").each(function(){
		list.push(($(this).prop("id")));
	})
	if(list.length == 0){
		Swal.fire({
			  position: 'top',
			  type: 'info',
			  title: '삭제할 이벤트를 선택하세요!',
			  showConfirmButton: false,
			  timer:1500
			});
	}else{
		var $form = $("<form></form>");
		$form.attr({
			action:"eventDelete",
			method:"post",
			style:"display:none"
		})
		var $input = $("<input></input>");
		$input.attr({
			type:"text",
			name:"list"
		})
		$input.val(list);
		$form.append($input);
		$("body").append($form);
		$form.submit();
	}
})
</script>

</body>
</html>