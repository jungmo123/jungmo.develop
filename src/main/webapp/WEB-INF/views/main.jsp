<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script src = "<c:url value = "/js/Main.js" />"></script>
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
	    position: relative;
	    top: 50px;
	}
	#rightBanner{
		float:right;
		width:150px;
		height:803px;
	    position: relative;
	    top: 50px;
	}
	#left{
		width:150px;
		display:inline-block;
		float: left;
	}
	#right{
		width:150px;
		display:inline-block;
		float: left;
	}
	#middle{
		display:inline-block;
		width:820px;
		float: left;
		margin:0px 10px 0px 10px;
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
	.latelyGoods img{
		width:110px;
		height:130px;
	}
	.newGoods img{
		width:120px;
		height:150px;
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
					<a href="${topBanner.bnnLink}" target="_black"><img src = "upload/${topBanner.bnnImageUrl}"></a>
				</c:if>
			</div>
			<div id = "title">
				<a href = "/shoppingmall"><strong>라라</strong><strong>마켓</strong></a>
				<br>
				<span>안 입는 옷을 판매하고, 새 옷으로 구매하세요!</span>
				<div id = "searchBar">
					<select class = "form-control">
						<option value = "0">전체 검색</option>
					</select>
					<input id = "Search" type = "text" class = "form-control" name = "Search" placeholder = "검색어를 입력하세요!"/>
					<button id = "SearchB" type = "button" class = "btn btn-default">검색</button>
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
							<a href = "idSearch"><span>ID/비밀번호 찾기</span></a>
						</div>
					</c:if>
					<c:if test = "${user!=null}">
						<div id = "loginBar">
							<a href = "mypage/cart"><span>장바구니</span></a>
							<span>&#124;</span>
							<a href = "mypage/orderHistory1"><span>주문내역</span></a>
							<span>&#124;</span>
							<a href = "mypage/oneTwoOne"><span>1:1 문의</span></a>
							<span>&#124;</span>
							<a href = "mypage/orderHistory1"><span>마이 페이지</span></a>
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
					<a href="${leftBanner.bnnLink}" target="_black"><img src = "upload/${leftBanner.bnnImageUrl}"></a>
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
									<li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li></a>
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
										<a href="${main.bnnLink}" target="_black"><img src = "upload/${main.bnnImageUrl}" alt = "a" width = "460" height = "345"></a>
									</div>	
								</c:when>
								<c:otherwise>
								<div class = "item">
									<a href="${main.bnnLink}" target="_black"><img src = "upload/${main.bnnImageUrl}" alt = "b" width = "460" height = "345"></a>
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
			<ul id = "latelyGoods" class = "nav nav-tabs">
				<li class = "active"><a id = "${category[0].godcNum}" class = "home" data-toggle="tab" href = "#home">${category[0].godcName}</a></li>
				<li><a id = "${category[1].godcNum}" class = "menu1" data-toggle="tab" href = "#menu1">${category[1].godcName}</a></li>
				<li><a id = "${category[2].godcNum}" class = "menu2" data-toggle="tab" href = "#menu2">${category[2].godcName}</a></li>
				<li><a id = "${category[3].godcNum}" class = "menu3" data-toggle="tab" href = "#menu3">${category[3].godcName}</a></li>
				<li><a id = "${category[4].godcNum}" class = "menu4" data-toggle="tab" href = "#menu4">${category[4].godcName}</a></li>
			</ul>
			<div class = "tab-content">
				<div id = "home" class = "tab-pane fade in active">
					<p><strong>최근 등록한 상품</strong></p>		
				</div>
				<div id = "menu1" class = "tab-pane fade">
					<p><strong>최근 등록한 상품</strong></p>
				</div>
				<div id = "menu2" class = "tab-pane fade">
					<p><strong>최근 등록한 상품</strong></p>
				</div>
				<div id = "menu3" class = "tab-pane fade">
					<p><strong>최근 등록한 상품</strong></p>
				</div>				
				<div id = "menu4" class = "tab-pane fade">
					<p><strong>최근 등록한 상품</strong></p>
				</div>
			</div>
		<div id = "newProduct">
			<strong>스타일 숍 신상품</strong>
			<hr>
			<c:forEach var = "goods" items = "${latelyGoods}">
			<div id = "${goods.godNum}" class = "newGoods">
				<div>
					<img src = "upload/${goods.godListImageUrl}">
				</div>
				<div>
					<div>
						<span><fmt:formatNumber value="${goods.godSellingPrice}" pattern="#,###" />원</span>
					</div>
					<div>
						<span>${goods.godName}</span>
					</div>
					<div>
						<span>
							<c:if test = "${fn:length(goods.godIntroduce) > 20}">
								${fn:substring(goods.godIntroduce,0,20)}...
							</c:if>
							<c:if test = "${fn:length(goods.godIntroduce) < 20}">
								${goods.godIntroduce}
							</c:if>	
						</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</div>
		</div>
		<div id = "right">
			<div id = "rightBanner">
				<c:if test = "${empty rightBanner}">
					<img src = "IMAGE/noSearchLR.jpg">
				</c:if>
				<c:if test = "${!empty rightBanner}">
					<a href="${rightBanner.bnnLink}" target="_black"><img src = "upload/${rightBanner.bnnImageUrl}"></a>
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
				<a href = "accessTerms"><span>이용약관</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "PersonalDataPolicy"><strong>개인정보처리방침</strong></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "notice1"><span>고객센터</span></a>
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
	$("#SearchB").click(function(){
		var Search = $("#Search").val();
		var form = $("<form></form>");
		form.attr({
			action:"unifiedSearch="+Search,
			method:"get"
		})
		$("body").append(form);
		form.submit();
	})
</script>

</body>
</html>