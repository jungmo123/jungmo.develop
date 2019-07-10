<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
			<div id="navBar">
				<div id="topmenu">
					<span> <a href="../">이용자 화면 보기</a> <span>&#124;</span> <a
						href="board">사내 게시판</a> <span>&#124;</span> <a href="logout">로그아웃</a>
					</span>
				</div>
				<div id="conatiner">
					<div id="nav" class="btn-group">
						<div class="btn-group drop">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">주문 관리</button>
							<ul class="dropdown-menu">
								<li><a href="orderList">스타일 숍 주문</a></li>
								<li><a href="orderCancel">주문 취소</a></li>
								<li><a href="orderExchange">교환</a></li>
								<li><a href="orderRefund">환불</a></li>
							</ul>
						</div>
						<div class="btn-group drop">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">게시판 관리</button>
							<ul class="dropdown-menu">
								<li><a href="styleshop">스타일 숍 공지</a></li>
								<li><a href="cic">고객센터 공지</a></li>
								<li><a href="community">커뮤니티</a></li>
								<li><a href="goodsQuestion">상품 문의</a></li>
								<li><a href="oneTwoOne">1:1 문의</a></li>
								<li><a href="goodsReview">상품평</a></li>
								<li><a href="event">이벤트</a></li>
								<li><a href="boardCategory">게시판 카테고리 관리</a></li>
							</ul>
						</div>
						<div class="btn-group drop">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">회원 관리</button>
							<ul class="dropdown-menu">
								<li><a href="userIdx">회원 목록</a></li>
								<li><a href="leaveUserIdx">탈퇴 회원 목록</a></li>
								<li><a href="mail">메일 관리</a></li>
								<li><a href="sms">SMS 관리</a></li>
								<li><a href="bulkMailSending">대량 메일 발송</a></li>
							</ul>
						</div>
						
						<div class="btn-group drop">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">배너 관리</button>
							<ul class="dropdown-menu">
								<li><a href="banner">메인</a></li>
							</ul>
						</div>
						<div class="btn-group drop is-current">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">상품 관리</button>
							<ul class="dropdown-menu">
								<li><a href="goodsRegister">상품 등록</a></li>
								<li><a href="goodsList">상품 목록</a></li>
								<li><a href="categoryManagement">카테고리 관리</a></li>
							</ul>
						</div>
						<div class="btn-group drop">
							<button type="button" class="btn btn-default dropdown-toggle"
								type="button" data-toggle="dropdown">기본 정책 관리</button>
							<ul class="dropdown-menu">
								<li><a href="clause">약관</a></li>
								<li><a href="policy">정책</a></li>
							</ul>
						</div>
						<div class="nav-underline"></div>
					</div>
					<div id="hr">
						<hr>
					</div>
				</div>
			</div>
</body>
</html>