<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	#searchBar{
		text-align:center;
		margin-top:10px;
	}
	input[type="text"]{
		display:inline;
		width:250px;
	}
	select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	table tr th,
	table tr td{
		text-align:center;
	}
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	table tr{
		border:1px solid #F2F5F7;
	}
	table tr th{
		background-color:#F2F5F7;
	}
	table tr td{
		padding:15px 8px 0px 8px !important;
	}
	table tr td span{
		position:relative;
		bottom:8px;
	}
	tbody tr:last-child{
		border-bottom:1px solid #878787;
	}
	#table tr td:nth-child(1){
		width:45px;
	}
	#table tr td:nth-child(2),
	#table tr td:nth-child(3){
		width:90px;
	}
	#table tr td:nth-child(4){
		width:80px;
	}
	#table tr td:nth-child(5){
		width:105px;
	}
	#table tr td:nth-child(6){
		width:100px;
	}
	#table tr td:nth-child(7){
		width:155px;
	}
	#table tr td:nth-child(8){
		width:116px;
	}
	#delete{
		float:right;
		width:80px;
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
				<a href="userIdx"><span>회원 목록</span></a>
				<a href="leaveUserIdx" class = "activeMenu"><span>탈퇴 회원 목록</span></a>
				<a href="mail"><span>메일 관리</span></a>
				<a href="sms"><span>SMS 관리</span></a>
				<a href="bulkMailSending"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > 탈퇴 회원 목록</p>
				<hr>
			</div>
		<form id = "SearchForm" action = "leaveUserIdxSearch1" method = "post">
			<div id = "searchBar">
				<select class = "form-control" name = "SearchBar">
					<option value = "1">이름</option>
				</select>
				<input type = "text" class = "form-control" name = "title" />
				<button type = "submit" class = "btn btn-default">검색</button>
			</div>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>탈퇴일</th>
							<th>가입일</th>
							<th>이름</th>
							<th>아이디</th>
							<th>구매 금액</th>
							<th>탈퇴 사유</th>
							<th>삭제 예정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "post" items = "${posts}" varStatus = "state">
							<tr id = "${post.userId}">
								<td><input type = "checkbox"  id = "${post.userId}" class = "check" /></td>
								<td>${post.scdDate}</td>
								<td>${post.userJoinDate}</td>
								<td>${post.userName}</td>
								<td>${post.userId}</td>
								<td><fmt:formatNumber value="${post.purchaseAmount}" pattern="#,###" />원</td>
								<td>
								<c:if test = "${fn:length(post.scdContent) > 10}" >
										${fn:substring(post.scdContent,0,10)}...
								</c:if>
								<c:if test = "${fn:length(post.scdContent) < 10}" >
										${post.scdContent}
								</c:if>
								</td>
								<td><span>${post.dueDate}<br>${post.dDay}일 남음</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type = "button" id = "delete" class = "btn btn-default">선택삭제</button>
			</div>
		</form>
			 <div id = "pagination">
				<div>
					<ul class = "pagination">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "leaveUserIdx${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
										
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "leaveUserIdx${type}${idx}">${idx}</a>
								</li>
							</c:forEach>
				
							<c:if test = "${pageMaker.next}">
								<li><a href = "leaveUserIdx${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
					</ul>
				</div>		
			</div>
	</div>
</div>
</div>

<script type = "text/javascript">
	$("#delete").click(function(){
		var input = $(".check:checked");
		var list = [];
		$.each(input,function(index,item){
			list[index] = $(item).prop("id");
		})
		var form = $("<form></form>");
		form.attr({
			action:"LeaveUserDelete",
			method:"post",
			style:"display:none"
		})
		var $input = $("<input></input>");
		$input.attr({
			type:"text",
			name:"list"
		})
		$input.val(list);
		form.append($input);
		$("body").append(form);
		form.submit();
	})
</script>

</body>
</html>