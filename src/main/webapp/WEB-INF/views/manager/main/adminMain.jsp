<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>GNB</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/AdminMain.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<style>
	.container{
		width:1180px;
		max-width:none !important;
		display:flex;
	}
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>

	<div class = "container">
		<div id = "logo">
			<a href = "main" ><span>LALA&nbsp;</span>MARKET</a>
			<div id = "Admin">
				<h5>Administrator</h5>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<div id = "nav" class = "btn-group">
			<div class = "btn-group drop is-current">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">주문 관리</button>
				<ul class= "dropdown-menu">
					<li><a href = "orderList">스타일 숍 주문</a></li>
					<li><a href = "orderCancel">주문 취소</a></li>
					<li><a href = "orderExchange">교환</a></li>
					<li><a href = "orderRefund">환불</a></li>
				</ul>
			</div>
			<div class = "btn-group drop">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">게시판 관리</button>
				<ul class= "dropdown-menu">
					<li></li>
					<li><a href = "styleshop">스타일 숍 공지</a></li>
					<li><a href = "cic">고객센터 공지</a></li>
					<li><a href = "community">커뮤니티</a></li>
					<li><a href = "goodsQuestion">상품 문의</a></li>
					<li><a href = "oneTwoOne">1:1 문의</a></li>
					<li><a href = "goodsReview">상품평</a></li>
					<li><a href = "event">이벤트</a></li>
					<li><a href = "boardCategory">게시판 카테고리 관리</a></li>
				</ul>
			</div>
			<div class = "btn-group drop">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">회원 관리</button>
				<ul class= "dropdown-menu">
					<li><a href = "userIdx">회원 목록</a></li>
					<li><a href = "leaveUserIdx">탈퇴 회원 목록</a></li>
					<li><a href = "mail">메일 관리</a></li>
					<li><a href = "sms">SMS 관리</a></li>
					<li><a href = "bulkMailSending">대량 메일 발송</a></li>
				</ul>
			</div>
			
			<div class = "btn-group drop">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">배너 관리</button>
				<ul class= "dropdown-menu">
					<li><a href = "banner">GNB</a></li>
				</ul>
			</div>
			<div class = "btn-group drop">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">상품 관리</button>
				<ul class= "dropdown-menu">
					<li><a href = "goodsRegister">상품 등록</a></li>
					<li><a href = "goodsList">상품 목록</a></li>
					<li><a href = "categoryManagement">카테고리 관리</a></li>
				</ul>
			</div>
			<div class = "btn-group drop">
				<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">기본 정책 관리</button>
				<ul class= "dropdown-menu">
					<li><a href = "clause">약관</a></li>
					<li><a href = "policy">정책</a></li>
				</ul>
			</div>
			<div class="nav-underline"></div>
		</div>
		<div id = "topmenu">
			<span>
					<a href = "../">이용자 화면 보기</a>
					<span>&#124;</span>
					<a href = "board">사내 게시판</a>
					<span>&#124;</span>
					<a href = "logout">로그아웃</a>			
			</span>		
		</div>
	</div>
	
	<div class = "container">
		<hr>
	</div>
	
	<div id = "menuc" class = "container">
		<div id = "menu1">
			<div class = "menuNav">
				<i class="fas fa-user-cog"></i>
				<span>&nbsp;{로그인 ID 표시}</span>
			</div>
			<div>
				<span id = "vertical">&#124;&nbsp;</span><span>자주 이용 메뉴</span>
			</div>
			<div id = "circlegroup">
				<button class = "circle" onclick = "location.href='../POLICY/01.html'">정책관리</button>
				<button class = "circle" onclick = "location.href='../STATISTICS/01.html'">통계</button>
				<button class = "circle" onclick = "location.href='../GOODSADMIN/01.html'">상품 등록</button>
			</div>
			<input id = "logout" type = "button" class="form-control" value = "로그아웃">
			<div id = "expired">
				<div class = "expire">
					<div>
						<p>호스팅 만료일</p>
						<p>- 2023-09-01</p>
						<p>- 000일 남음</p>					
					</div>
					<div>
						<a href = "#"><span class = "glyphicon glyphicon-cog"></span></a>						
					</div>
				</div>
				
				<div class = "expire">
					<div>
						<p>도메인 만료일</p>
						<p>- 2023-09-01</p>
						<p>- 000일 남음</p>					
					</div>
					<div>
						<a href = "#"><span class = "glyphicon glyphicon-cog"></span></a>						
					</div>
				</div>
			</div>
		</div>
		<div id = "menu2">
			<div class = "menuNav">
				<i class="fas fa-clipboard-list"></i>
				<span>Toay 현황 {2023-09-28}</span>
			</div>
			<div class = "panel panel-default">
				<div class = "panel-heading">회원 가입 수</div>
				<div class = "panel-body">{00}명</div>
			</div>
			<div class = "panel panel-default">
				<div class = "panel-heading">회원탈퇴 수</div>
				<div class = "panel-body">{00}건</div>
			</div>
			<div class = "panel panel-default">
				<div class = "panel-heading">상품 등록 수</div>
				<div class = "panel-body">{00}건</div>
			</div>
			<div class = "panel panel-default">
				<div class = "panel-heading">페이지 뷰</div>
				<div class = "panel-body">{00}건</div>
			</div>
			<div class = "panel panel-default">
				<div class = "panel-heading">주문 수</div>
				<div class = "panel-body">{00}건</div>
			</div>
		</div>
		<div id = "menu3">
			<div class = "menuNav">
				<i class="fas fa-clipboard-list"></i>
				<span>미 처리 현황</span>
			</div>
			<div id = "untreated">
				<div class = "panel panel-default">
					<div class = "panel-heading">회원탈퇴 수</div>
					<div class = "panel-body">{00}건</div>
				</div>
				<div class = "panel panel-default">
					<div class = "panel-heading">상품 등록 수</div>
					<div class = "panel-body">{00}건</div>
				</div>
				<div class = "panel panel-default">
					<div class = "panel-heading">페이지 뷰</div>
					<div class = "panel-body">{00}건</div>
				</div>
				<div class = "panel panel-default">
					<div class = "panel-heading">주문 수</div>
					<div class = "panel-body">{00}건</div>
				</div>			
			</div>
		</div>
	</div>
	
	<div id = "webc" class = "container">
		<div class = "web1">
			<div class = "webmenubar">
				<span>&#124; 사내 게시판</span>
				<span class = "view" onclick = "location.href ='../INTRABOARD/01.html'">[더 보기]</span>
			</div>
			<div>
				<table id = "web1table">
					<tr>
						<td>- [제목표기]</td>
						<td>[작성관리자 ID 표기]</td>
						<td>[작성일 표기]</td>
					</tr>
					<tr>
						<td>- 게시판 에이터 변경 요청</td>
						<td>admin02</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- admin 회원정보 수정 오류</td>
						<td>admin03</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- 결제 지연 수정 요청</td>
						<td>admin03</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- 택배사 추가 요청</td>
						<td>admin04</td>
						<td>2013-01-01</td>
					</tr>
				</table>
			</div>
		</div>
		<div class = "web2">
			<div class = "webmenubar">
				<span>&#124; 사내 공지사항</span>
				<span class = "view" onclick = "location.href ='../INTRABOARD/01.html'">[더 보기]</span>			
			</div>
			<div>
				<table id = "web2table">
					<tr>
						<td>- [제목표기]</td>
						<td>[작성관리자 ID 표기]</td>
						<td>[작성일 표기]</td>
					</tr>
					<tr>
						<td>- 게시판 에이터 변경 요청</td>
						<td>admin02</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- admin 회원정보 수정 오류</td>
						<td>admin03</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- 결제 지연 수정 요청</td>
						<td>admin03</td>
						<td>2013-01-01</td>
					</tr>
					<tr>
						<td>- 택배사 추가 요청</td>
						<td>admin04</td>
						<td>2013-01-01</td>
					</tr>
				</table>
			</div>			
		</div>
	</div>
	
	<div class = "container" id = "footerDiv">
		<div id = "footer">
			<div id = "footerLogo">
				<span>LALA&nbsp;</span><span>MARKET</span>
			</div>
			<div id = "footerContent">
				<div id = "footerTop">
					<div>
						<p><strong>상호명 :</strong><span>(주)라라마켓</span></p>
						<p><strong>사업자 등록번호 :</strong><span>000-00-0000</span></p>
					</div>
					<div>
						<p><strong>대표자 :</strong><span>최한석</span></p>
						<p><strong>통신판매업 신고번호 :</strong><span>0000-서울서초-0000</span></p>	
						<p><strong>개인정보관리책임자 :</strong><span>한아름</span></p>				
					</div>
				</div>
				<div id = "footerBottom">
					<div>
						<p><strong>주소 :</strong><span>(00000) 서울시 서초구 OOOOO OO</span></p>
						<p><strong>고객센터 :</strong><span>TEL 070-0000-0000 FAX (02)000-00000 Email : help@style.co.kr</span></p>	
					</div>
					<div>
						<strong>Copyright 2023 라라마켓 Corp.All Rights Reserved</strong>
					</div>		
				</div>
			</div>
		</div>	
	</div>

</body>
</html>