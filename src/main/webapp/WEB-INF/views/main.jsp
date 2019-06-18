<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<style>
	.container{
		width:1280px;
	}
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#topbanner img{
		width:800px;
		height:100px;
	}
	#leftBanner img,
	#rightBanner img{
		width:148px;
		height:798px;
	}
	#leftBanner{
		float:left;
		width:150px;
		height:803px;
		position:relative;
		bottom:617px;
	}
	#rightBanner{
		float:right;
		width:150px;
		height:803px;
		position:relative;
		bottom:617px;
	}
	#left{
		width:150px;
		display:inline-block;
	}
	#right{
		width:150px;
		display:inline-block;
	}
	#middle{
		display:inline-block;
		width:820px;
	}
	.carousel-inner > .item >img {
		width:70%;
		margin:auto;
	}
	#Content{
		width:1200px;
	    position: relative;
	    left: 35px;
	}
	#footerLogo span:nth-child(1),
	#footerLogo small:nth-child(4){
	color: #FF6F43;
	}
	#footerLogo span:nth-child(2),
	#footerLogo small:nth-child(5){
		color: #5D646E;
	}
</style>
</head>
<body>
	<div class = "container">
		<div id = "header" class = "center-block">
			<div id = "topbanner">
				<c:if test = "${empty topBanner}">
					<img src = "IMAGE/noSearchX.jpg">
				</c:if>
				<c:if test = "${!empty topBanner}">
					<img src = "upload/${topBanner.bnnImageUrl}">
				</c:if>
			</div>
			<div id = "title">
				<a href = "/shoppingmall'"><strong>라라</strong><strong>마켓</strong></a>
				<br>
				<span>안 입는 옷을 판매하고, 새 옷으로 구매하세요!</span>
				<div id = "searchBar">
					<select class = "form-control">
						<option>전체 검색</option>
					</select>
					<input type = "text" class = "form-control" name = "title" placeholder = "검색어를 입력하세요!"/>
					<button type = "button" class = "btn btn-default" onclick = "location.href = '../SEARCH/01.html'">검색</button>
				</div>
				<div id = "navi">
					<c:if test = "${user==null}">
						<div id = "loginBar">
							<a href = "join01"><span>회원가입</span></a>
							<span>&#124;</span>
							<a href = "login"><span>로그인</span></a>
							<span>&#124;</span>
							<a href = "admin/login"><span>관리자 로그인</span></a>
							<span>&#124;</span>
							<a href = "USER/HELP/08.html"><span>ID/비밀번호 찾기</span></a>
						</div>
					</c:if>
					<c:if test = "${user!=null}">
						<div id = "loginBar">
							<a href = "../MYPAGE/SHOPPING/04.html"><span>장바구니</span></a>
							<span>&#124;</span>
							<a href = "../MYPAGE/SHOPPING/01.html"><span>주문내역</span></a>
							<span>&#124;</span>
							<a href = "../MYPAGE/BOARD/01.html"><span>1:1 문의</span></a>
							<span>&#124;</span>
							<a href = "orderHistory"><span>마이 페이지</span></a>
							<span>&#124;</span>
							<a href = "logout"><span>로그아웃</span></a>
						</div>
					</c:if>
					<div id = "navDiv" class = "btn-group btn-group-justified">
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">스타일 숍</button>
							<ul class= "dropdown-menu">
								<c:forEach var = "gc" items = "${goodsCategories}">
									<li><a href = "styleshop${gc.godcNum}I1IAll">${gc.godcName}</a></li>
								</c:forEach>
							</ul>
						</div>				
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">라라마켓</button>
							<ul class= "dropdown-menu">
								<li><a href = "aboutUs01">소개</a></li>
								<li><a href = "aboutUs02">찾아오시는 길</a></li>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">상품평</button>
							<ul class= "dropdown-menu">
								<c:forEach var = "gc" items = "${goodsCategories}">
									<li><a href = "goodsReview${gc.godcNum}I1">${gc.godcName}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">이벤트</button>
							<ul class= "dropdown-menu">
								<li><a href = "event">진행 중인 이벤트</a></li>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">고객센터</button>
							<ul class= "dropdown-menu">
								<li><a href = "notice">공지사항</a></li>
								<li><a href = "community">커뮤니티</a></li>
								<li><a href = "idSearch">아이디 찾기</a></li>
								<li><a href = "pwdSearch">비밀번호 찾기</a></li>
							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<div id = "Content" class = "center-block">
		<div id = "left">
			<div id = "leftBanner">
				<c:if test = "${empty leftBanner}">
					<img src = "IMAGE/noSearchLR.jpg">
				</c:if>
				<c:if test = "${!empty leftBanner}">
					<img src = "upload/${leftBanner.bnnImageUrl}">
				</c:if>			
			</div>		
		</div>
		<div id = "middle">
		<div id= "content">
			<div id = "banner2">
				<div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
					<ol class = "carousel-indicators">
						<c:forEach var = "main" items = "${mainBanner}" varStatus = "state">
							<c:choose>
								<c:when test = "${state.first}">
									<li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
								</c:when>
								<c:otherwise>
									<li data-target = "#myCarousel" data-slide-to = "${state.index}"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ol>
					
					<div class = "carousel-inner">
						<c:forEach var = "main" items = "${mainBanner}" varStatus = "state">
							<c:choose>
								<c:when test = "${state.first}">
									<div class = "item active">
										<img src = "upload/${main.bnnImageUrl}" alt = "a" width = "460" height = "345">
									</div>	
								</c:when>
								<c:otherwise>
								<div class = "item">
									<img src = "upload/${main.bnnImageUrl}" alt = "b" width = "460" height = "345">
								</div>
								</c:otherwise>
							</c:choose>												
						</c:forEach>
					</div>
					
					<a class = "left carousel-control" href = "#myCarousel" data-slide="prev">
						<span class  = "glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class = "right carousel-control" href = "#myCarousel" data-slide="next">
						<span class  = "glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
			<ul class = "nav nav-tabs">
				<li class = "active"><a data-toggle="tab" href = "#home">Outer</a></li>
				<li><a data-toggle="tab" href = "#menu1">Top</a></li>
				<li><a data-toggle="tab" href = "#menu2">Bottom</a></li>
				<li><a data-toggle="tab" href = "#menu3">Skirt</a></li>
				<li><a data-toggle="tab" href = "#menu3">Dress</a></li>
			</ul>
			<div class = "tab-content">
				<div id = "home" class = "tab-pane fade in active">
					<p><span>최근 등록한 상품</span></p>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div >
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
				</div>
				<div id = "menu1" class = "tab-pane fade">
					<p><span>최근 등록한 상품</span></p>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div >
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
				</div>
				<div id = "menu2" class = "tab-pane fade">
					<p><span>최근 등록한 상품</span></p>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div >
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
				</div>
				<div id = "menu3" class = "tab-pane fade">
					<p><span>최근 등록한 상품</span></p>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div onclick = "location.href = 'USER/GOODS/02.html'">
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
					<div >
						<div>
						
						</div>
						<div>
							<span>{상품명}</span>
							<br>
							<span>{가격}원</span>
						</div>
					</div>
				</div>
			</div>
		<div id = "newProduct">
			<strong>스타일 숍 신상품</strong>
			<hr>
			<div onclick = "location.href = 'USER/GOODS/02.html'">
				<div>
				</div>
				<div>
					<div>
						<span>{상품 가격표기}</span>
					</div>
					<div>
						<span>{상품명 표기}</span>
					</div>
					<div>
						<span>{상품 특징 100자 (2줄)}</span>
					</div>
					<div>
						<span>{상품 특성 아이콘 노출}</span>
					</div>
				</div>
			</div>
			<div onclick = "location.href = 'USER/GOODS/02.html'">
				<div>
				</div>
				<div>
					<div>
						<span>15,000원</span>
					</div>
					<div>
						<span>기모 티셔츠</span>
					</div>
					<div>
						<span>깃털처럼 가벼운 것에 비해<br>
						초괴의 보온 효과!</span>
					</div>
					<div>
						<span></span>
					</div>
				</div>
			</div>
			<div onclick = "location.href = 'USER/GOODS/02.html'">
				<div>
				</div>
				<div>
					<div>
						<span>15,000원</span>
					</div>
					<div>
						<span>기모 티셔츠</span>
					</div>
					<div>
						<span>깃털처럼 가벼운 것에 비해<br>
						초괴의 보온 효과!</span>
					</div>
					<div>
						<span></span>
					</div>
				</div>
			</div>
			<div onclick = "location.href = 'USER/GOODS/02.html'">
				<div>
				</div>
				<div>
					<div>
						<span>10,000원</span>
					</div>
					<div>
						<span>기모 티셔츠</span>
					</div>
					<div>
						<span>깃털처럼 가벼운 것에 비해<br>
						초괴의 보온 효과!</span>
					</div>
					<div>
						<span></span>
					</div>
				</div>
			</div>
			<div onclick = "location.href = 'USER/GOODS/02.html'">
				<div>
				</div>
				<div>
					<div>
						<span>10,000원</span>
					</div>
					<div>
						<span>기모 티셔츠</span>
					</div>
					<div>
						<span>깃털처럼 가벼운 것에 비해<br>
						초괴의 보온 효과!</span>
					</div>
					<div>
						<span></span>
					</div>
				</div>
			</div>
		</div>
		<div id = "bestProduct">
			<strong>스타일 숍 카테고리 별 BEST 상품</strong>
			<div>
				<div class = "activeDiv">
					<div>
						<span>Outer</span>
					</div>
					<div>
						<div>
							<span>Icon</span>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>Top</span>
					</div>
					<div>
						<div>
							<span>Icon</span>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>Bottom</span>
					</div>
					<div>
						<div>
							<span>Icon</span>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>Skirt</span>
					</div>
					<div>
						<div>
							<span>Icon</span>
						</div>
					</div>
				</div>
				<div>
					<div>
						<span>Dress</span>
					</div>
					<div>
						<div>
							<span>Icon</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id = "productList">
			<div>
				<div onclick = "location.href = 'USER/GOODS/02.html'">
					<div>
					
					</div>
					<div>
						<div>
							<span>{상품 가격표기}</span>
						</div>
						<div>
							<span>{상품명 표기}</span>
						</div>
						<div>
							<span>{상품 특징 100자 (2줄)}</span><br>
							<span>{상품 특징 100자 (2줄)}</span>
						</div>
					</div>
				</div>
				<div onclick = "location.href = 'USER/GOODS/03.html'">
					<div>
					</div>
					<div>
						<div>
							<span>15,000원</span>
						</div>
						<div>
							<span>기모 티셔츠</span>
						</div>
						<div>
							<span>깃털처럼 가벼운 것에 비해 따뜻한<br>
							보온으로 다운 패딩과 찰떡 궁합</span>
						</div>
						<div>
							<span></span>
						</div>
					</div>
				</div>
				<div onclick = "location.href = 'USER/GOODS/03.html'">
					<div>
					</div>
					<div>
						<div>
							<span>15,000원</span>
						</div>
						<div>
							<span>기모 티셔츠</span>
						</div>
						<div>
							<span>깃털처럼 가벼운 것에 비해 따뜻한<br>
							보온으로 다운 패딩과 찰떡 궁합</span>
						</div>
						<div>
							<span></span>
						</div>
					</div>
				</div>
				<div onclick = "location.href = 'USER/GOODS/03.html'">
					<div>
					</div>
					<div>
						<div>
							<span><del>15,000원</del>&nbsp;→&nbsp;10,000원</span>
						</div>
						<div>
							<span>기모 티셔츠</span>
						</div>
						<div>
							<span>깃털처럼 가벼운 것에 비해 따뜻한<br>
							보온으로 다운 패딩과 찰떡 궁합</span>
						</div>
						<div>
							<span></span>
						</div>
					</div>
				</div>			
			</div>
		</div>
		<div id = "footerBox">
			<div onclick = "location.href = 'USER/HELP/01.html'">
				<div>
					<strong>고객센터</strong>
				</div>
				<div>
					<strong>070-0000-0000</strong>
				</div>
				<div>
					<span>평일 10-18시 공휴일,주말 휴무</span>
				</div>
			</div>
			<div onclick = "location.href = 'USER/EVENT/01.html'">
				<div>
					<strong>이벤트</strong>
				</div>
				<div>
					<div>
					</div>
					<div>
						<span>지금 상품평을 등록하면<br>포인트가 2배!</span>
					</div>
				</div>
			</div>
			<div onclick = "location.href = 'USER/HELP/06.html'">
				<div>
					<strong>자주 하는 질문</strong>
				</div>
				<div>
					<div>
					</div>
					<div>
						<span>나의 궁금증을 가장 빨리<br>해결할 수 있는 방법!</span>
					</div>
				</div>
			</div>
		</div>
			<div id = "board">
				<div id = "notice">
					<strong>공지사항</strong>
					<a href = "../HELP/01.html">더보기 > </a>
					<div>
						<ul>
							<li><a href = "../HELP/02.html">상품을 주문하는 방법 안내해 드립니다.</a></li>
							<li><a href = "../HELP/02.html">결제가 잘 되지 않을 떄 이렇게 해보세요!</a></li>
							<li><a href = "../HELP/02.html">장바구니를 이렇게 이용하면 좋습니다.</a></li>
							<li><a href = "../HELP/02.html">배송은 주문 후 2일이내 완료 됩니다.</a></li>
							<li><a href = "../HELP/02.html">상품 등록 시 주의 사항 알려드립니다.</a></li>
						</ul>
					</div>
				</div>
				<div id = "community">
					<strong>커뮤니티</strong>
					<a href = "USER/HELP/03.html">더보기 > </a>
					<div>
						<ul>
							<li><a href = "USER/HELP/04.html">상품 판매는 어떻게 하나요?. 2023.07.07</a></li>
							<li><a href = "USER/HELP/04.html">상품 판매 후 금액은 어떻..... 2023.07.07</a></li>
							<li><a href = "USER/HELP/04.html">포인트는 어떻게 사용하면... 2023.07.07</a></li>
							<li><a href = "USER/HELP/04.html">배송완료된 상품은 삭제해... 2023.07.07</a></li>
							<li><a href = "USER/HELP/04.html">상품은 언제까지 배송가능... 2023.07.07</a></li>
						</ul>
					</div>
				</div>
				<div id = "productReview">
					<strong>상품평</strong>
					<a href = "../REVIEWS/01.html">더보기 > </a>
					<div>
						<ul>
							<li><a href = "USER/REVIEWS/01.html">옷 정말 잘 산 거 같아요! 다음에도 또...</a></li>
							<li><a href = "USER/REVIEWS/01.html">고급 소재라서 그런지 너무 부드럽고...</a></li>
							<li><a href = "USER/REVIEWS/01.html">너무 좋아서 맨날 입고 다니고 있어요...</a></li>
							<li><a href = "USER/REVIEWS/01.html">세탁을 해도 옷 색이 전혀 변하지 않아...</a></li>
							<li><a href = "USER/REVIEWS/01.html">지금 입기에 딱 좋은 옷이네요?다른 색...</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div id = "right">
			<div id = "rightBanner">
				<c:if test = "${empty rightBanner}">
					<img src = "IMAGE/noSearchLR.jpg">
				</c:if>
				<c:if test = "${!empty rightBanner}">
					<img src = "upload/${rightBanner.bnnImageUrl}">
				</c:if>			
			</div>		
		</div>
	</div>
	</div>
	
	<div class = "container" id = "footerDiv">
		<div id = "footer" class = "center-block">
			<div id = "footerNav">
				<a href = "aboutUs01"><span>회사 소개</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "#"><span>이용약관</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "#"><strong>개인정보처리방침</strong></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "../HELP/01.html"><span>고객센터</span></a>
			</div>
			<div id = "footerLogo">
				<span>라라&nbsp;</span><span>마켓</span>
				<br>
				<small>LALA</small> <small>MARKET</small>
			</div>
			<div id = "footerContent">
				<div id = "footerTop">
					<div>
						<p><strong>상호명 :</strong><span>(주)라라마켓</span></p>
						<p><strong>사업자 등록번호 :</strong><span>000-00-0000</span></p>
						<p><button>사업자번호 확인</button></p>
					</div>
					<div>
						<p><strong>대표자 :</strong><span>최한석</span></p>
						<p><strong>통신판매업 신고번호 :</strong><span>0000-서울서초-0000</span></p>	
						<p><strong>개인정보관리책임자 :</strong><span>최한석</span></p>	
						<p><strong>호스팅 제공 사업자 :</strong><span>OOOO</span></p>				
					</div>
				</div>
				<div id = "footerBottom">
					<div>
						<p><strong>주소 :</strong><span>(00000) 서울시 서초구 OOOOO OO</span></p>
						<span>TEL 070-0000-0000</span><span>FAX (02)000-00000</span><span>Email : help@style.co.kr</span>
					</div>
					<div>
						<strong>Copyright 2023 라라마켓 Corp.All Rights Reserved</strong>
					</div>		
				</div>
			</div>
		</div>	
	</div>

<script type = "text/javascript">

</script>

</body>
</html>