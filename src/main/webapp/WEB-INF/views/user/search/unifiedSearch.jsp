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
<script src = "<c:url value = "/js/Search.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
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
	#styleShop table,
	#board table{
		margin-top:10px;
	}
	#styleShop table .product,
	#board > table .posts{
		cursor:pointer;
	}
	#styleShop table tr td:nth-child(1){
		width:100px;
	}
	#styleShop table tr td:nth-child(1) > div{
		width:110px;
		height:130px;
		border:1px solid lightgrey;
	}
	#styleShop table tr td img{
		width:110px;
		height:130px;
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
	#board table{
		line-height:25px;
		margin-bottom:10px;
	}
	#board > table{
	    border-top: 1px solid lightgrey;
	    border-bottom: 1px solid lightgrey;
	    width: 800px;
	}
	#board > table span{
		margin-right:5px;
	}
	#board > table div:first-child span:last-child{
		float:right;
	}
	#board{
		margin: 28px 0 100px 0;
	}
	#board div:nth-child(1){
		margin-top:10px;
	}
	#board div:nth-child(2){
		margin-top:20px;
		margin-bottom:10px;
	}
	#godrPagination,
	#godPagination,
	#postsPagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
		cursor:pointer;
	}
	#godrPagination > div > .pagination .active a,
	#godPagination > div > .pagination .active a,
	#postsPagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#godrPagination .currentPage,
	#godPagination .currentPage,
	#postsPagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#godrPagination a,
	#godPagination a,
	#board #postsPagination a{
		color:#878787;
		margin-right:10px;
	}
	#productReview{
		margin:10px 0 10px 0;
	}
	#productReview table{
		width:100%;
		text-align:center;
	}
	#productReview table tr:not(.commentTr){
		border-top:1px solid #BABABA;
		height:90px;
	}
	.container #productReview table .commentTr td:last-child > div{
		background-color:#F2F5F7;
	    width: 750px;
	    height: 100px;
	}
	#productReview table .commentTr td:last-child{
		border-top:2px dotted #BABABA;
	}
	.none{
		display:none;
	}
	#productReview table{
		margin-top:10px;
		border-top:1px solid grey;
		border-bottom:1px solid #BABABA;
	}
	#productReview table tr td:first-child{
		width:50px;
		height:100px;
	}
	#productReview table tr td:nth-child(2){
		width:500px;
	}
	#productReview table tr td:nth-child(2) > div{
		display:inline-block;
		float:left;
	}
	#productReview table tr td:nth-child(2) > .image{
		width:100px;
		height:140px;
		margin-right:10px;
		border:1px solid black;
	}
	#productReview table tr td:nth-child(2) > div:last-child{
		width:400px;
		height:80px;
		line-height:20px;
		padding:5px;
		text-align:left;
	}
	#productReview table tr td:nth-child(2) > div:last-child > span{
		font-size:12px;
		color:#878787;
	}
	.tableButton{
	    border: 1px solid lightgrey;
	    border-radius: 5px;
	    background-color: white;
	    font-weight: bold;	
	}
	#noProduct p{
		position: relative;
    	top: 15px;
	}
	#noReview,
	#noProduct,
	#noPosts{
		text-align:center;
		height: 100px;
	}
	#noReview p,
	#noProduct p,
	#noPosts p{
		margin:0px;
	}
	#noReview p > .glyphicon,
	#noProduct p > .glyphicon,
	#noPosts p > .glyphicon{
		font-size:30px;
	}
	#noReview p span,
	#noProduct p span,
	#noPosts p span{
		color:lightgrey;
	}
	#postsTable tr td > div:nth-child(2){
		height:60px;
	}
	#postsTable tr:not(:last-child){
		border-bottom: 1px solid lightgrey;
	}
	#postsTable tr td > div:nth-child(1) span:nth-child(1){
		font-weight:bold;
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
				<table id = "godTable" class = "table table-hover">

				</table>
				 	<div id = "godPagination">
	
					</div>
			</div>
			<hr>
			<div id = "productReview">
				<strong>상품평</strong>
				<table id = "godrTable" class = "br">				

				</table>
				<div id = "godrPagination">
	
				</div>	
			</div>
			<hr>
			<div id = "board">
				<strong>게시판</strong>
				<table id = "postsTable">

				</table>
				<div id = "postsPagination">
	
				</div>	
			</div>
		</div>
	</div>

<script type = "text/javascript">
	var Search= "${Search}"
</script>

</body>
</html>