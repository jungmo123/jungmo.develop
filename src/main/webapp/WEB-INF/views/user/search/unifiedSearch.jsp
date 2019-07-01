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
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#content{
		width:800px;
	}
	#nav{
		display:inline-block;
		width:160px;
		height:180px;
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
		margin-bottom:20px;
		line-height:25px;
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
	#content > strong{
		font-size:20px;
	}
	#content > div:first-child{
		width:100px;
		height:25px;
		background-color:lightgrey;
		text-align:center;
	}
	#styleShop a,
	#productReview a,
	#board a{
		float:right;
		color:black;
	}
	#styleShop table,
	#productReview table,
	#board > div{
		margin-top:10px;
	}
	#styleShop table tr td:nth-child(1){
		width:100px;
	}
	#styleShop table tr td:nth-child(1) > div{
		width:110px;
		height:120px;
		border:1px solid lightgrey;
	}
	#styleShop table tr td:nth-child(2){
		width:400px;
	}
	#styleShop table tr td:nth-child(2) > div{
		height:100px;
		padding:10px;
		line-height:25px;
	}
	#styleShop table tr td:nth-child(2) > div > div:last-child{
		height:50px;
	}
	#productReview table tr td:nth-child(1){
		width:130px;
		height:130px;
	}
	#productReview table tr td:nth-child(1) > div{
		width:110px;
		height:130px;
		border:1px solid lightgrey;
	}
	#productReview table tr td:nth-child(2) > div > div:first-child span{
		margin-left:345px;
	}
	#productReview table tr td:nth-child(2) > div{
		line-height:25px;
	}
	#productReview table tr td:nth-child(2) > div > div:nth-child(2){
		height:50px;
	}
	#productReview table tr td:nth-child(2) > div > div:last-child span{
		margin-right:5px;
	}
	#board div{
		line-height:25px;
		margin-bottom:10px;
	}
	#board > div{
	    border-top: 1px solid lightgrey;
	    border-bottom: 1px solid lightgrey;	
	}
	#board > div span{
		margin-right:5px;
	}
	#board > div > div:first-child span:last-child{
		float:right;
	}
	#board{
		margin: 28px 0 100px 0;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<div>통합 검색</div>
			<hr>
			<strong>&#124;&nbsp;통합 검색</strong>
			<hr>
			<div id = "styleShop">
				<strong>스타일 숍</strong>
				<a href = "../GOODS/01.html">검색 결과 더 보기 ></a>
				<table class = "table table-hover">
					<tr>
						<td>
							<div onclick = "location.href = '../GOODS/02.html'">
							</div>
						</td>
						<td>
							<div>
								<div>
									<strong>{상품명}</strong>
								</div>
								<div>
									<span>{상품 특징 표기 (2줄)}</span>
								</div>
							</div>
						</td>
						<td>
							<div>
								<strong>42,000원</strong>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div onclick = "location.href = '../GOODS/02.html'">
							</div>
						</td>
						<td>
							<div>
								<div>
									<strong>기모 티셔츠</strong>
								</div>
								<div>
									<span>깃털처럼 가벼운 것에 비해<br>최고의 보온 효과!</span>
								</div>
							</div>
						</td>
						<td>
							<div>
								<strong>42,000원</strong>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<div id = "productReview">
				<strong>상품평</strong>
				<a href = "../REVIEWS/01.html">검색 결과 더 보기 ></a>
				<table id = "godrTable" class = "table table-hover">
					<tr>
						<td>
							<div onclick = "location.href = '../GOODS/02.html'">
							</div>
						</td>
						<td>
							<div>
								<div>
									<strong>{상품명}</strong>
									<span>조회수 : 100</span>
								</div>
								<div>
									<span>{상품평}</span>
								</div>
								<div>
									<span>{아이디}</span>
									<span>&#124;</span>
									<span>{등록일시}</span>
								</div>
							</div>
						</td>
					</tr>
				</table>
				 	<div id = "godrPagination">
						<div>
							<ul class = "pagination">
									<c:if test = "${pageMaker.prev}">
										<li><a href = "goodsReview${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
									</c:if>
									
									<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
										<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
											<a href = "goodsReview${type}${idx}">${idx}</a>
										</li>
									</c:forEach>
					
									<c:if test = "${pageMaker.next}">
										<li><a href = "goodsReview${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
									</c:if>
								</ul>
							</div>		
						</div>		
			</div>
			<hr>
			<div id = "board">
				<strong>게시판</strong>
				<a href = "../HELP/01.html">검색 결과 더 보기 ></a>
				<div onclick = "location.href = '../HELP/02.html'">
					<div>
						<span>{[게시판 경로 표기]}</span>
						<span>{글 제목 표기}</span>
						<span>{작성일}</span>
					</div>
					<div>
						<span>고객님 안녕하세요! 라라마켓 관리자입니다.추석 명절로 인해 택배 회사에서 더 이상 배송 접수를 하지<br> 않고
						있습니다.이점 너그러운 양해를 부탁드리며,자세한 내용은 아래의 안내 사항을 참고 바랍니다....</span>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>