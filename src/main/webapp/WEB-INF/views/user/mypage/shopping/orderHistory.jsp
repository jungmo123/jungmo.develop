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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
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
	#obTitle div{
		text-align:center;
	}
	#obTitle div span{
		margin:0px 10px 0px 10px;
	}
	#obTitle > div:first-child button{
		width:80px;
		height:30px;
		padding:0;
		position:relative;
		bottom:2px;
	}
	#obTitle > div:nth-child(2) button{
		width:40px;
		height:20px;
		padding:0;
		font-size:12px;
	}
	#obTitle > div:last-child{
		margin-top:10px;
		color:#878787;
	}
	#input1,#input2{
		display:inline-block;
		width:120px !important;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px !important;
	}
	[type="date"] {
	  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
	}
	[type="date"]::-webkit-inner-spin-button {
	  display: none;
	}
	[type="date"]::-webkit-calendar-picker-indicator {
	  opacity: 0;
	}
	#obContent{
		padding:10px;
	}
	#obContent > div{
		width:792px;
		height:170px;
		border:1px solid #878787;
		margin-bottom:20px;
	}
	#obContent > div > div{
		padding:5px;
	}
	#obContent > div > div:first-child{
		display:inline-block;
		width:30px;
		float:left;
	}
	#obContent > div > div:last-child{
		display:inline-block;
		margin-left:10px;
		width:750px;
		float:left;
	}
	#obContent > div > div:last-child hr{
		margin:5px;
	}
	#obContent > div > div:last-child > div >  span > .btn:nth-child(3){
		width:90px;
		height:25px;
		padding:0px;
		font-size:12px;
		font-weight:bold;
	}
	#obContent > div > div:last-child > div >  span > .btn:nth-child(4){
		width:60px;
		height:25px;
		padding:0px;
		font-size:12px;
		font-weight:bold;
	}
	#obContent > div > div:last-child > div >  span > span{
		margin-right:80px;
	}
	.imageBox{
		width:90px;
		height:110px;
		border:1px solid grey;
		display:inline-block;
		float:left;
		margin-top:6px;
	}
	.itemInfo{
		display:inline-block;
		width:400px;
		float:left;
		margin:4px 0 0 10px;
	}
	.pAd{
		width:220px;
		height:120px;
		display:inline-block;
		float:left;
	}
	.pAd > div{
		display:inline-block;
		width:100px;
		height:120px;
		border:1px solid grey;
		float:left;
		margin-right:5px;
		text-align:center;
	}
	.pAd > div > div{
		height:60px;
	}
	.pAd > div > div:first-child{
		background-color:#F2F5F7;
	}
	.pAd > div > div strong,
	.pAd > div > div span{
		position:relative;
		top:20px;
	}
	.pAd > div > div button{
		width:80px;
		height:25px;
		padding:0;
		font-size:12px;
		font-weight:bold;
	}
	#pagination{
		margin:30px 0px 30px 0px;
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
	<!--modal시작-->
	.modal-content{
		width:500px;
	}
	#inquiry,#state{
		margin-top:10px;
	}
	#inquiry > div,
	#state > div{
		padding:10px;
	}
	table{
		width:440px;
	}
	table tr th,
	table tr td{
		text-align:center;
		height:22px;
	}
	table thead tr{
		background-color:#F2F5F7;
	}
	table tr td,
	table tr th{
		border:1px solid grey;
	}
	.modal-footer{
		text-align:center;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/userheader.jsp" %>
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
						<a href = "#" class= "activeMenu"><span onclick = "location.href = '01.html'">> 주문 내역</span></a>
						<a href = "#"><span onclick = "location.href='04.html'">> 장바구니</span></a>
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
		<strong>&#124;&nbsp;주문 내역</strong>
		<div id = "orderBreakdown">
			<hr>
			<div id = "obTitle">
				<div>
					<span>주문 기간</span>
					<div id = "input1">
						<input type="date" name="dateofbirth" class="dateInput">
					</div>
					<span>~</span>
					<div id = "input2">
						<input type="date" name="dateofbirth" class="dateInput">	
					</div>
					<button class = "btn btn-default">조회</button>	
				</div>
				<div>
					<button class = "btn btn-default">당일</button>
					<button class = "btn btn-default">1주일</button>
					<button class = "btn btn-default">3주일</button>
					<button class = "btn btn-default">1개월</button>
					<button class = "btn btn-default">3개월</button>
				</div>
				<div>
					<span> 최근 1년 이내 주문 내역만 조회할 수 있습니다.</span>
				</div>
			</div>
			<hr>
			<div id = "obContent">
				<div>
					<div>
						<span>10. </span>
					</div>
					<div>
						<div>
							<span>
								<span><strong>주문일시</strong> 2023-01-01 12:15:15</span>
								<span><strong>주문번호</strong> 1454460561166</span>
								<button class = "btn btn-default" onclick="location.href='02.html'">주문 상세 내역</button>
								<button class = "btn btn-default" onclick="location.href='03.html'">주문 취소</button>
							</span>							
						</div>				
						<hr>
						<div>
							<div class = "imageBox">
							
							</div>
							<div class = "itemInfo">
								<p>
									<strong>[{구매 Shop > 카테고리명}]</strong>
								</p>
								<p>
									<span>{상품명}</span>
								</p>
								<p>
									<span>{옵션명} : {선택한 옵션}</span>
								</p>
								<p>
									<span>{옵션명} : {선택한 옵션}</span>
								</p>
							</div>
							<div class = "pAd">
								<div>
									<div>
										<strong>금액</strong>
									</div>
									<div>
										<span>{결제금액}원</span>
									</div>
								</div>
								<div>
									<div>
										<strong>주문/배송</strong>
									</div>
									<div>
										<span>{주문/배송상태}</span>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>09. </span>
					</div>
					<div>
						<div>
							<span>
								<span><strong>주문일시</strong> 2023-01-01 12:15:15</span>
								<span><strong>주문번호</strong> 1454460561166</span>
								<button class = "btn btn-default" onclick="location.href='02.html'">주문 상세 내역</button>
								<button class = "btn btn-default" onclick="location.href='03.html'">주문 취소</button>
							</span>							
						</div>				
						<hr>
						<div>
							<div class = "imageBox">
							
							</div>
							<div class = "itemInfo">
								<p>
									<strong>[스타일 숍 > Top]</strong>
								</p>
								<p>
									<span>자수 실크 린넨 브라우스</span>
								</p>
								<p>
									<span>디자인 : C형</span>
								</p>
								<p>
									<span>색상 : 블랙</span>
								</p>
							</div>
							<div class = "pAd">
								<div>
									<div>
										<strong>금액</strong>
									</div>
									<div>
										<span>12,000원</span>
									</div>
								</div>
								<div>
									<div>
										<strong>주문/배송</strong>
									</div>
									<div>
										<span>주문 확인 전</span>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>08. </span>
					</div>
					<div>
						<div>
							<span>
								<span><strong>주문일시</strong> 2023-01-01 12:15:15</span>
								<span><strong>주문번호</strong> 1454460561166</span>
								<button class = "btn btn-default" onclick="location.href='02.html'">주문 상세 내역</button>
								<button class = "btn btn-default" onclick="location.href='03.html'">주문 취소</button>
							</span>							
						</div>				
						<hr>
						<div>
							<div class = "imageBox">
							
							</div>
							<div class = "itemInfo">
								<p>
									<strong>[스타일 숍 > Top]</strong>
								</p>
								<p>
									<span>자수 실크 린넨 브라우스</span>
								</p>
								<p>
									<span>디자인 : C형</span>
								</p>
								<p>
									<span>색상 : 블랙</span>
								</p>
							</div>
							<div class = "pAd">
								<div>
									<div>
										<strong>금액</strong>
									</div>
									<div>
										<span>12,000원</span>
									</div>
								</div>
								<div>
									<div>
										<strong>주문/배송</strong>
									</div>
									<div>
										<span>
											<button class = "btn btn-default"
											data-toggle = "modal" data-target = "#mySmallModal">배송중</button>
										</span>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
</div>
	
		<div class = "modal fade" id  ="mySmallModal">
		<div class = "modal-dialog">
			<div class ="modal-content">
				<div class = "modal-body">
					<div id = "inquiry">
						<strong>&#124;&nbsp; 배송 조회</strong>
						<button type = "button" class = "close" data-dismiss = "modal">X</button>
						<div>
							<table id = "firstTable">
								<thead>
									<tr>
										<th>택배사</th>
										<th>송장번호</th>
										<th>대표번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>{택배사명 표기}</td>
										<td>{송장번호 표기}</td>
										<td>{대표번호 표기}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id = "state">
						<strong>&#124;&nbsp; 배송 상황</strong>
						<div>
							<table id = "secondTable">
								<thead>
									<tr>
										<th>날짜</th>
										<th>송장위치</th>
										<th>배송상태</th>
										<th>연락처</th>
										<th>기타정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2023-07-15 13:54</td>
										<td>이천터미널</td>
										<td>집하</td>
										<td>1588-0123</td>
										<td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>