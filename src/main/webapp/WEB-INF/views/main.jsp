<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "../JS/Navigation.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:850px;
	}
	#header{
		width:800px;
		margin-top:50px;
		text-align:center;
		position:relative;
		left:10px;
	}
	#header #banner{
		height:100px;
		border:1px solid black;
	}
	#header #title{
		margin-top:30px;
	}
	#header #title > strong{
		font-size:30px;
	}
	#searchBar{
		text-align:center;
		margin-top:10px;
	}
	input[type="text"]{
		display:inline;
		width:280px;
		height:25px;
	}
	#searchBar select{
		display:inline;
		width:100px;
		height:26px;
		padding:0;
		font-size:12px;	
		position:relative;
		bottom:1px;	
	}
	#searchBar .btn{
		width:60px;
		height:25px;
		padding:0;
		font-size:12px;
		font-weight:bold;
		position:relative;
		bottom:2px;	
	}
	#nav{
		margin-top:50px;
	}
	#nav #loginBar{
		float:right;
		margin:0 10px 2px 0;
	}
	#nav #loginBar a{
		color:#878787;
		margin:0 5px 0px 5px;
		font-size:12px;
	}
	#content{
		margin-top:10px;
	}
	#content #banner2{
		margin:50px 0 50px 0;
		height:250px;
		border:1px solid black;
		position:relative;
	}
	#content #banner2 div{
		position:absolute;
		bottom:2px;
		right:4px;
	}
	#content #banner2 div span{
		font-size:12px;
	}
	.nav-tabs{
		margin-top:50px;
	}
	.nav-tabs li{
		width:164px;
		text-align:center;
	}
	.nav-tabs a{
		color:#878787;
	}
	.tab-content{
		margin-bottom:50px;
		width:818px;
		height:200px;
		padding:10px;
		border-left:1px solid #ddd;
		border-right:1px solid #ddd;
		border-bottom:1px solid #ddd;
	}
	.tab-content > div{
		padding:0 20px 0 20px;
	}
	.tab-content > div > div{
		display:inline-block;
		width:160px;
		text-align:center;
		margin:0 10px 0 10px;
		cursor:pointer;
	}
	.tab-content > div > div > div:first-child{
		width:160px;
		height:100px;
		border:1px solid black;
	}
	#newProduct{
		margin:10px;
		height:350px;
	}
	#newProduct > div{
		display:inline-block;
		width:140px;
		font-size:12px;
		float:left;
		margin-right:20px;
		cursor:pointer;
	}
	#newProduct > div > div:first-child{
		width:120px;
		height:150px;
		border:1px solid grey;
		margin-bottom:10px;
	}
	#newProduct > div > div:last-child div:nth-child(3){
		height:40px;
	}
	#bestProduct{
		display:inline-block;
		margin-top:10px;
		width:800px;
	}
	#bestProduct strong{
		float:left;
	}
	#bestProduct div{
		margin-top:10px;
		height:60px;
		float:left;
	}
	#bestProduct > div > .activeDiv{
		background-color:lightgrey;
	}
	#bestProduct > div > div{
		display:inline-block;
		border:1px solid grey;
		float:left;
	}
	#bestProduct > div > div{
		cursor:pointer;
	}
	#bestProduct > div > div > div{
		position:relative;
		display:inline-block;
		width:79px;
		float:left;
	}
	#bestProduct > div > div > div:nth-child(2){
		text-align:center;
	}
	#bestProduct > div > div > div:nth-child(1) span{
		position:relative;
		left:5px;
		top:25px;
	}
	#bestProduct > div > div > div:nth-child(2) > div{
		margin-top:2px;
		width:65px;
		height:35px;
		border:1px dotted grey;
	}
	#bestProduct > div > div > div:nth-child(2) > div span{
		position:relative;
		top:5px;
	}
	#productList{
		width:800px;
		text-align:center;
	}
	#productList div{
		display:inline-block;
		margin-top:10px;
		width:744px;
		text-align:left;
	}
	#productList > div div{
		display:inline-block;
		width:180px;
		margin-right:6px;
		font-size:12px;
		float:left;
		cursor:pointer;
	}
	#productList > div > div > div:first-child{
		height:200px;
		border:1px solid grey;
		margin-bottom:10px;
	}
	#productList > div > div > div:last-child div:nth-child(3){
		height:40px;
	}
	#footerBox{
		margin-top:30px;
		width:760px;
		height:100px;
		text-align:left;
		position:relative;
		left:30px;
	}
	#footerBox > div{
		display:inline-block;
		width:237px;
		height:120px;
		margin-right:10px;
		border:1px solid grey;
		padding:5px;
		float:left;
		cursor:pointer;
	}
	#footerBox > div:first-child > div:nth-child(2){
		text-align:center;
		font-size:25px;
		margin:10px 0 10px 0;
	}
	#footerBox > div:first-child > div:nth-child(3){
		text-align:center;
	}
	#footerBox > div:nth-child(2) > div:nth-child(2),
	#footerBox > div:nth-child(3) > div:nth-child(2){
		margin-top:10px;
	}
	#footerBox > div:nth-child(2) > div:nth-child(2) > div:first-child,
	#footerBox > div:nth-child(3) > div:nth-child(2) > div:first-child{
		display:inline-block;
		width:80px;
		height:70px;
		border:1px solid grey;
		float:left;
	}
	#footerBox > div:nth-child(2) > div:nth-child(2) > div:last-child,
	#footerBox > div:nth-child(3) > div:nth-child(2) > div:last-child{
		display:inline-block;
		float:left;
		position:relative;
		top:15px;
		left:5px;
	}
	#board{
		margin:100px 0 50px 0;
		height:160px;
	}
	#board #notice{
		width:250px;
		float:left;
		margin-left:20px;
	}
	#board div a{
		float:right;
		color:black;
	}
	#board #notice div,
	#board #community div,
	#board #productReview div{
		margin-top:10px;
		line-height:23px;
	}
	#board div ul{
		padding-left:20px;
	}
	#board div ul li{
		float:left;
	}
	#board #community{
		width:260px;
		float:left;
		margin-left:20px;
	}
	#board #productReview{
		width:250px;
		float:left;
		margin-left:20px;	
	}
	#footer{
		width:850px;
		height:170px;
		margin-top:50px;
	}
	#footerNav{
		margin-bottom:30px;
		height:40px;
		line-height:35px;
		text-align:center;
		border-top:1px solid grey;
		border-bottom:1px solid grey;
	}
	#footerNav a{
		color:black;
	}
	#footerLogo{
		display:inline-block;
		width:300px;
		height:170px;
		float:left;
	}
	#footerLogo span{
		position:relative;
		top:55px;
		font-size:35px;
	}
	#footerLogo small{
		position:relative;
		top:50px;
	}
	#footerContent{
		display:inline-block;
		width:550px;
		height:170px;
		text-align:left;
		float:left;
	}
	#footerTop{
		height:120px;
	}
	#footerTop > div{
		display:inline-block;
		height:90px;
		float:left;		
	}
	#footerTop div:first-child{
		width:200px;
	}
	#footerTop div:last-child{
		width:300px;
	}
	#footerTop div p,
	#footerBottom div p{
		border-left:1px solid grey;
	}
	#footerTop div p strong,
	#footerTop div p span,
	#footerBottom div p strong,
	#footerBottom div p span{
		margin-left:5px;
	}
	#footerTop div button{
		margin-left:5px;
		background-color:white;
	}
	#footerDiv{
		text-align:center;
	}
	#footerBottom div:nth-child(2){
		margin-top:30px;
		text-align:center;
		color:lightgrey;
	}
	#footerBottom div:nth-child(1) > span{
		border-left:1px solid grey;
		padding-left:5px;
		margin-right:5px;
	}
</style>
</head>
<body>

	<div class = "container">
		<div id = "header">
			<div id = "banner">
				배너1
			</div>
			<div id = "title">
				<strong>라라마켓</strong>
				<br>
				<span>안 입는 옷을 판매하고, 새 옷으로 구매하세요!</span>
				<div id = "searchBar">
					<select class = "form-control">
						<option>전체 검색</option>
					</select>
					<input type = "text" class = "form-control" name = "title" placeholder = "검색어를 입력하세요!"/>
					<button type = "button" class = "btn btn-default" onclick = "location.href = '../SEARCH/01.html'">검색</button>
				</div>
				<div id = "nav">
					<div id = "loginBar">
						<a href = "register01"><span>회원가입</span></a>
						<span>&#124;</span>
						<a href = "login"><span>로그인</span></a>
						<span>&#124;</span>
						<a href = "MANAGER/LOGING/01.html"><span>관리자 로그인</span></a>
						<span>&#124;</span>
						<a href = "USER/HELP/08.html"><span>ID/비밀번호 찾기</span></a>
					</div>
					<div class = "btn-group btn-group-justified">
						<div class = "btn-group">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">스타일 숍</button>
							<ul class= "dropdown-menu">
								<li><a href = "USER/GOODS/01.html">Outer</a></li>
								<li><a href = "USER/GOODS/01.html">Top</a></li>
								<li><a href = "USER/GOODS/01.html">Bottom</a></li>
								<li><a href = "USER/GOODS/01.html">Skirt</a></li>
								<li><a href = "USER/GOODS/01.html">Dress</a></li>
							</ul>
						</div>				
						<div class = "btn-group">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">라라마켓</button>
							<ul class= "dropdown-menu">
								<li><a href = "USER/ABOUTUS/01.html">소개</a></li>
								<li><a href = "USER/ABOUTUS/02.html">찾아오시는 길</a></li>
							</ul>
						</div>
						<div class = "btn-group">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">상품평</button>
							<ul class= "dropdown-menu">
								<li><a href = "USER/REVIEWS/01.html">상품평</a></li>
							</ul>
						</div>
						<div class = "btn-group">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">이벤트</button>
							<ul class= "dropdown-menu">
								<li><a href = "USER/EVENT/01.html">진행 중인 이벤트</a></li>
							</ul>
						</div>
						<div class = "btn-group">
							<button type = "button" class = "btn btn-default dropdown-toggle" type = "button" data-toggle="dropdown">고객센터</button>
							<ul class= "dropdown-menu">
								<li><a href = "USER/HELP/01.html">공지사항</a></li>
								<li><a href = "USER/HELP/03.html">커뮤니티</a></li>
								<li><a href = "USER/HELP/06.html">자주 하는 질문</a></li>
								<li><a href = "USER/HELP/07.html">상품 문의</a></li>
								<li><a href = "USER/HELP/08.html">아이디/비밀번호 찾기</a></li>
							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<div id= "content">
			<div id = "banner2">
				{Banner Image}
				<div>
					<span>●</span>
					<span>○</span>
					<span>○</span>
					<span>○</span>
					<span>○</span>
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
	
	<div class = "container" id = "footerDiv">
		<div id = "footer">
			<div id = "footerNav">
				<a href = "../ABOUTUS/01.html"><span>회사 소개</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "#"><span>이용약관</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "#"><span>개인정보처리방침</span></a>
				<span>&nbsp;&#124;&nbsp;</span>
				<a href = "../HELP/01.html"><span>고객센터</span></a>
			</div>
			<div id = "footerLogo">
				<span>라라&nbsp;</span><span>마켓</span>
				<br>
				<small>LALA MARKET</small>
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

</body>
</html>