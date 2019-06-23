<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<div class = "center-block" id = "header">
			<div id = "title">
				<a href = "/shoppingmall/"><strong>라라</strong><strong>마켓</strong></a>
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
							<a href = "../join01"><span>회원가입</span></a>
							<span>&#124;</span>
							<a href = "../login"><span>로그인</span></a>
							<span>&#124;</span>
							<a href = "../admin/login"><span>관리자 로그인</span></a>
							<span>&#124;</span>
							<a href = "../USER/HELP/08.html"><span>ID/비밀번호 찾기</span></a>
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
							<a href = "../MYPAGE/SHOPPING/01.html"><span>마이 페이지</span></a>
							<span>&#124;</span>
							<a href = "../logout"><span>로그아웃</span></a>
						</div>
					</c:if>
					<div id = "navDiv" class = "btn-group btn-group-justified">
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">스타일 숍</button>
							<ul class= "dropdown-menu">
								<c:forEach var = "gc" items = "${goodsCategories}">
									<li><a href = "../styleshop${gc.godcNum}I1IAll">${gc.godcName}</a></li>
								</c:forEach>
							</ul>
						</div>				
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">라라마켓</button>
							<ul class= "dropdown-menu">
								<li><a href = "../aboutUs01">소개</a></li>
								<li><a href = "../aboutUs02">찾아오시는 길</a></li>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">상품평</button>
							<ul class= "dropdown-menu">
								<c:forEach var = "gc" items = "${goodsCategories}">
									<li><a href = "../goodsReview${gc.godcNum}I1">${gc.godcName}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">이벤트</button>
							<ul class= "dropdown-menu">
								<li><a href = "../event">진행 중인 이벤트</a></li>
							</ul>
						</div>
						<div class = "btn-group drop">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">고객센터</button>
							<ul class= "dropdown-menu">
								<li><a href = "../notice">공지사항</a></li>
								<li><a href = "../community">커뮤니티</a></li>
								<li><a href = "../idSearch">아이디 찾기</a></li>
								<li><a href = "../pwdSearch">비밀번호 찾기</a></li>
							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
</body>
</html>