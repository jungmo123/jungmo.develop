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
	//공통 끝
	#basket{
		padding:10px;
	}
	#basket table{
		width:780px;
		text-align:center;
	}
	#basket table tr td,
	#basket table tr th{
		border-top:1px solid lightgrey;
		border-bottom:1px solid lightgrey;
	}
	#basket table tr td{
		padding:5px;
	}
	#basket table tr th{
		background-color:#F2F5F7;
		height:40px;
		text-align:center;
	}
	#basket table tr th:nth-child(1){
		width:30px;
	}
	#basket table tr th:nth-child(2){
		width:30px;
	}
	#basket table tr th:nth-child(3){
		width:400px;
	}
	#basket table tr td:nth-child(3){
		text-align:left;
	}
	#item{
		display:inline-block;
		width:90px;
		height:100px;
		border:1px solid grey;
		margin-left:70px;
		float:left;
	}
	#itemInfo{
		display:inline-block;
		margin:8px 0 0 10px;
		float:left;
	}
	#basket table tr td:nth-child(4){
		width:80px;
	}
	#basket table tr td:nth-child(5){
		width:120px;
	}
	#basket table tr td:nth-child(5) input[type='number']{
		width:40px;
		height:20px;
	}
	#basket table tr td:nth-child(5) button{
		padding:0;
		width:30px;
		height:20px;
		font-size:12px;
		font-weight:bold;
		position:relative;
		bottom:2px;
	}
	#basketFooter span{
		float:right;
		font-size:16px;
	}
	#basketFooter span strong{
		margin-left:20px;
		font-size:25px;
	}
	#buttonGroup{
		text-align:center;
	}
	#buttonGroup button{
		font-size:12px;
		font-weight:bold;
		position:relative;
		left:100px;
		top:30px;
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
						<a href = "cart" class= "activeMenu"><span>> 장바구니</span></a>
						<a href = "#"><span onclick = "location.href = '05.html'">> 포인트 이용 내역</span></a>
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
		<strong>&#124;&nbsp;장바구니</strong>
		<hr>
		<div id = "basket">
			<table>
				<thead>
					<tr>
						<th>
							<input type = "checkbox" name = "Allnumber"/>
						</th>
						<th>
							<span>번호</span>
						</th>
						<th>
							<span>상품정보</span>
						</th>
						<th>
							<span>판매가</span>
						</th>
						<th>
							<span>수량</span>
						</th>
						<th>
							<span>합계금액</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type = "checkbox" name = "number" />
						</td>
						<td>
							<span>4</span>
						</td>
						<td>
							<div id = "item">
							
							</div>
							<div id = "itemInfo">
								<p>
									<strong>{상품명}</strong>
								</p>
								<p>
									<strong>{옵션명} : </strong>
									<span>{옵션 내용}</span>
								</p>
								<p>
									<strong>{옵션명} :</strong>
									<span>{옵션 내용}</span>
								</p>
							</div>
						</td>
						<td>
							<p>
								<span>(상품가)원</span>
							</p>
							<p>
								<span>(옵션가)원</span>
							</p>
							<p>
								<span>-</span>
							</p>
						</td>
						<td>
							<input type = "number" name = "amount" />
							<button class = "btn btn-default">수정</button>
						</td>
						<td>
							<span>{합계금액}원</span>
						</td>
					</tr>
					<tr>
						<td>
							<input type = "checkbox" name = "number" />
						</td>
						<td>
							<span>3</span>
						</td>
						<td>
							<div id = "item">
							
							</div>
							<div id = "itemInfo">
								<p>
									<strong>자주 실크 린넨 브라우스</strong>
								</p>
								<p>
									<strong>색상 : </strong>
									<span>네이비</span>
								</p>
								<p>
									<strong>사이즈 :</strong>
									<span>80</span>
								</p>
							</div>
						</td>
						<td>
							<p>
								<span>55,000원</span>
							</p>
							<p>
								<span>5,000원</span>
							</p>
							<p>
								<span>-</span>
							</p>
						</td>
						<td>
							<input type = "number" name = "amount" placeholder = "1"/>
							<button class = "btn btn-default">수정</button>
						</td>
						<td>
							<span>60,000원</span>
						</td>
					</tr>
					<tr>
						<td>
							<input type = "checkbox" name = "number" />
						</td>
						<td>
							<span>2</span>
						</td>
						<td>
							<div id = "item">
							
							</div>
							<div id = "itemInfo">
								<p>
									<strong>자주 실크 린넨 브라우스</strong>
								</p>
								<p>
									<strong>색상 : </strong>
									<span>네이비</span>
								</p>
								<p>
									<strong>사이즈 :</strong>
									<span>80</span>
								</p>
							</div>
						</td>
						<td>
							<p>
								<span>55,000원</span>
							</p>
							<p>
								<span>5,000원</span>
							</p>
							<p>
								<span>-</span>
							</p>
						</td>
						<td>
							<input type = "number" name = "amount" placeholder = "2"/>
							<button class = "btn btn-default">수정</button>
						</td>
						<td>
							<span>60,000원</span>
						</td>
					</tr>
					<tr>
						<td>
							<input type = "checkbox" name = "number" />
						</td>
						<td>
							<span>1</span>
						</td>
						<td>
							<div id = "item">
							
							</div>
							<div id = "itemInfo">
								<p>
									<strong>자주 실크 린넨 브라우스</strong>
								</p>
								<p>
									<strong>색상 : </strong>
									<span>네이비</span>
								</p>
								<p>
									<strong>사이즈 :</strong>
									<span>80</span>
								</p>
							</div>
						</td>
						<td>
							<p>
								<span>55,000원</span>
							</p>
							<p>
								<span>5,000원</span>
							</p>
							<p>
								<span>-</span>
							</p>
						</td>
						<td>
							<input type = "number" name = "amount" placeholder = "1"/>
							<button class = "btn btn-default">수정</button>
						</td>
						<td>
							<span>60,000원</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id = "basketFooter">
			<button class = "btn btn-default">선택 삭제</button>
			<span>상품 총 금액 : <strong>120,000</strong>원</span>
		</div>
		<div id = "buttonGroup">
			<button class = "btn btn-default" onclick="location.href='../../GOODS/01.html'">계속 쇼핑하기</button>
			<button class = "btn btn-default" onclick="location.href='../../BUY/01.html'">선택 구매</button>
		</div>
	</div>
	</div>
</div>

</body>
</html>