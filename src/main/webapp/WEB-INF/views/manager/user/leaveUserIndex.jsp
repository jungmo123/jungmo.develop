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
	#delete{
		float:right;
		width:80px;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
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
				<a href="../USER/04.html"><span>메일 관리</span></a>
				<a href="../USER/05.html"><span>SMS 관리</span></a>
				<a href="../USER/06.html"><span>대량 메일 발송</span></a>
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
		<form>
			<div id = "searchBar">
				<select class = "form-control">
					<option>이름</option>
				</select>
				<input type = "text" class = "form-control" name = "title" />
				<button type = "button" class = "btn btn-default">검색</button>
			</div>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>번호</th>
							<th>탈퇴일</th>
							<th>가입일</th>
							<th>이름</th>
							<th>아이디</th>
							<th>회원등급</th>
							<th>방문수</th>
							<th>구매 금액</th>
							<th>삭제 예정일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type = "checkbox" /></td>
							<td>5</td>
							<td>{년-월-일}</td>
							<td>{년-월-일}</td>
							<td>{이름}</td>
							<td>{아이디}</td>
							<td>{회원등급}</td>
							<td>{방문수}</td>
							<td>{구매 금액}원</td>
							<td>
								<div>
									<span>2023-12-31<br>90일 남음</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type = "checkbox" /></td>
							<td>4</td>
							<td>2023-08-23</td>
							<td>2023-08-23</td>
							<td>최한석</td>
							<td>user1</td>
							<td>2</td>
							<td>30</td>
							<td>125,000원</td>
							<td>
								<div>
									<span>2023-12-31<br>90일 남음</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type = "checkbox" /></td>
							<td>3</td>
							<td>2023-08-23</td>
							<td>2023-08-23</td>
							<td>고객센터</td>
							<td>user2</td>
							<td>3</td>
							<td>55</td>
							<td>125,000원</td>
							<td>
								<div>
									<span>2023-12-31<br>90일 남음</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type = "checkbox" /></td>
							<td>2</td>
							<td>2023-08-23</td>
							<td>2023-08-23</td>
							<td>관리자</td>
							<td>user3</td>
							<td>4</td>
							<td>230</td>
							<td>125,000원</td>
							<td>
								<div>
									<span>2023-12-31<br>90일 남음</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type = "checkbox" /></td>
							<td>1</td>
							<td>2023-08-23</td>
							<td>2023-08-23</td>
							<td>관리자</td>
							<td>user4</td>
							<td>5</td>
							<td>1001</td>
							<td>125,000원</td>
							<td>
								<div>
									<span>2023-12-31<br>90일 남음</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<button id = "delete" class = "btn btn-default">선택삭제</button>
			</div>
		</form>
		<div id = "pagination">
			<div>
				<a href = "#"><span class = "glyphicon glyphicon-chevron-left"></span></a>
				<a href = "#"  class = "currentPage">1</a>
				<a href = "#">2</a>
				<a href = "#">3</a>
				<a href = "#">4</a>
				<a href = "#">5</a>
				<a href = "#" ><span class = "glyphicon glyphicon-chevron-right"></span></a>
				<div id = "currentBar"></div>
			</div>		
		</div>
	</div>
</div>
</div>

</body>
</html>