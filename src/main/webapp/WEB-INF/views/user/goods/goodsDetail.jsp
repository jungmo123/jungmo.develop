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
<script src = "<c:url value = "/js/Goods.js" />"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style>	
	.container{
		width:1010px;
	}
	body .container:nth-child(2) > div > strong{
		font-size:24px;
	}
	#productIntroduce{
		height:650px;
	}
	#productImg{
		display:inline-block;
		width:510px;
		height:470px;
		float:left;
	}
	#productInfo{
		display:inline-block;
		width:360px;
		height:390px;
		float:left;
		margin-left:10px;
	}
	#img{
		width:502px;
		height:468px;;
		border:1px solid #BABABA;
		margin:5px;
	}
	#mainIMG{
		width:500px;
		height:466px;
	}
	#thumbnail{
		text-align:center;
	}
	#thumbnail div{
		display:inline-block;
		width:120px;
		height:100px;
		border:1px solid #BABABA;
		margin:10px;
	}
	#productInfo{
		padding:10px;
		line-height:38px;
	}
	#productTable{
		width:360px;
	}
	#productTable tr:last-child td:last-child strong{
		margin-left:10px;
	}
	#productTable tr td:first-child{
		width:100px;
		text-align:right;
	}
	#productTable tr td:last-child{
		width:280px;
	}
	#productTable tr td:last-child span,
	#productTable tr td:last-child input,
	#productTable tr td:last-child select{
		margin-left:10px;
	}
	#productTable tr:nth-child(1),
	#productTable tr:nth-child(2){
		background-color:#F2F5F7;
	}
	.optionFirst{
		border-top:1px solid lightgrey;
	}
	.optionLast{
		border-bottom:1px solid lightgrey;
	}
	#productTable .goodsStockClass td input[type='number']{
		width:40px;
		height:15px;
		text-align:center;
	}
	#productTable .goodsStockClass button{
		padding:0;
		width:25px;
		height:20px;
		position:relative;
		bottom:1px;
	}
	#productTable .goodsStockClass button:nth-child(2) span{
		margin-left:0;
		position:relative;
		bottom:2px;
	}
	#productTable .goodsStockClass button:nth-child(3) span{
		margin-left:0;
		position:relative;
		bottom:3px;
	}
	#buttonGroup{
		margin-top:10px;
		width:330px;
		text-align:center;
	}
	#buttonGroup button{
		width:120px;
		margin:5px;
	}
	#detailInfo{
		margin-top:10px;
		text-align:center;
	}
	#evaluation{
		margin-top:30px;
		width:980px;
	}
	#evaluation > strong{
		margin-right:10px;
	}
	#evaluation > a{
		float:right;
		color:black;
		margin-right:22px;
	}
	#evaluation > hr{
		margin:5px 0 5px 0;
	}
	#evaluationTable{
		margin:10px 0 10px 0;
	}
	#evaluationTable table{
		width:100%;
		text-align:center;
	}
	#evaluationTable table tr:not(.commentTr){
		border-top:1px solid #BABABA;
		height:90px;
	}
	.container #evaluationTable table .commentTr td:last-child > div{
		width:930px;
		height:150px;
		padding:10px;
		background-color:#F2F5F7;
	}
	#evaluationTable table .commentTr td:last-child > div > div{
		display:inline-block;
		height:120px;
	}
	#evaluationTable table .commentTr td:last-child{
		border-top:2px dotted #BABABA;
	}
	.commentTr{
		height:120px;
	}
	.Bigimage{
		width:180px;
		height:110px;
		border:1px solid black;
		float:left;
		margin-left:10px;
	}
	.commentTr td:last-child div:nth-child(1){
		padding:10px;
		line-height:25px;
	}
	.commentTr td:last-child div:nth-child(2){
		float:right;
	}
	.commentTr td:last-child div:nth-child(2) button{
		padding:0;
		width:35px;
		height:20px;
		margin-right:5px;
	}
	.commentTr p{
		margin:0 0 3px;
	}
	#evaluationTable table{
		border-top:1px solid grey;
		border-bottom:1px solid #BABABA;
	}
	#evaluationTable table tr td:first-child{
		width:50px;
		height:100px;
	}
	#evaluationTable table tr td:nth-child(2){
		width:600px;
	}
	#evaluationTable table tr td:nth-child(2) > div{
		display:inline-block;
		float:left;
	}
	#evaluationTable table tr td:nth-child(2) > .image{
		width:100px;
		height:140px;
		margin-right:10px;
		border:1px solid black;
	}
	#evaluationTable table tr td:nth-child(2) > div:last-child{
		width:400px;
		height:80px;
		line-height:20px;
		padding:5px;
		text-align:left;
	}
	#evaluationTable table tr td:nth-child(2) > div:last-child > span{
		font-size:12px;
		color:#878787;
	}
	#godrPagination,
	#qnapagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
	}
	#godrPagination > div > .pagination .active a,
	#qnapagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#godrPagination .currentPage,
	#qnapagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#godrPagination a,
	#qnapagination a{
		color:#878787;
		margin-right:10px;
	}
	.block{
		display:inline-block;
	}
	.none{
		display:none;
	}
#commentWrite{
	margin-top:50px;
}
#commentWrite  button {
	width: 42px;
	height: 22px;
	padding: 0;
	font-size: 12px;
	font-weight: bold;
}

#commentWrite hr {
	margin: 10px;
}

#commentWrite strong {
	margin-right: 20px;
}

#commentWrite textarea {
	resize: none;
	padding: 5px;
	border-radius: 5px;
}

#commentWrite form div button {
	width: 130px;
	height: 70px;
	float: right;
	margin-right: 10px;
}

.commentInfo {
	margin: 10px;
}

.commentInfo span {
	position: relative;
	bottom: 4px;
	margin-left: 5px;
}

.commentInfo span:nth-child(2) {
	font-weight: bold;
}
.fa-comment-dots {
	font-size: 25px;
}

.commentContent {
	margin: 10px 0px 50px 10px;
	line-height: 25px;
}
	#productInquiry{
		margin-top:30px;
		width:980px;
	}
	#productInquiry > strong{
		margin-right:10px;
	}
	#productInquiry > a{
		float:right;
		color:black;
		margin-right:22px;
	}
	#productInquiry > hr{
		margin:5px 0 5px 0;
	}
	#orderitem{
		margin:10px 0 10px 0;
	}
	#orderitem table{
		width:100%;
		text-align:center;
		border-bottom: 1px solid lightgrey;
	}
	#orderitem table tr:not(.commentBox){
		border-top:1px solid #BABABA;
		height:45px;
	}
	#orderitem table th{
		text-align:center;
		background-color:#F2F5F7;
	}
	#orderitem table tr:nth-child(2n + 3){
		border-top:1px dotted #BABABA;
	}
	#orderitem table tr th:first-child{
		width:60px;
	}
	#orderitem table tr:nth-child(3n+2) td:nth-child(2),
	#orderitem table tr:nth-child(3n) td:nth-child(1){
		text-align:left;
	}
	.DocumentOpen{
		border-top:1px solid black !important;
		border-bottom:1px solid grey;
	}
	.DocumentOpen td:nth-child(2){
		height:200px;
	}
	.DocumentOpen td:nth-child(2) div,
	.divv{
		height:100px;
		padding:10px;
		text-align:left;
	}
	.DocumentOpen td:nth-child(2) > div:first-child{
		border-bottom:1px dotted grey;
	}
	.DocumentOpen td:nth-child(2) button{
		padding:0;
		width:35px;
		height:20px;
		text-align:center;
		margin-right:5px;
		float:right;
	}
	.divv strong{
		font-size:30px;
		color:#FF6F43;
		text-shadow:3px 10px 4px lightgrey;
	}
	.DocumentOpen td div > p{
		display:inline-block;
	}
	#pagination{
		margin-top:20px;
		margin-bottom:100px;
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
	#inputBar > div{
		background-color:#F2F5F7;
		height:100px;
	}
	#inputBar > div > div{
		margin-top:10px;
		width:980px;
		height:80px;
		padding:10px 10px 0px 10px;
	}
	#inputBar > div textarea{
		width:800px;
		height:70px;
		resize:none;
		float:left;
		margin-left:10px;
		padding:10px;
	}
	#inputBar > div button{
		width:120px;
		height:70px;
		text-align:center;
		float:right;
		margin-right:10px;
	}
	#inputBar > div > span{
		float:right;
	}
	#deliveryInfo,
	#sAr{
		margin-top:50px;
	}
	#deliveryInfo > strong:nth-child(1),
	#sAr > strong:nth-child(1){
		position:relative;
		bottom:10px;
	}
	#deliveryInfo div:nth-child(2){
		margin-top:20px;
		height:50px;
	}
	#deliveryInfo div:nth-child(3){
		line-height:30px;
	}
	#sAr > div:nth-child(2),
	#sAr > div:nth-child(3){
		margin-top:10px;
	}
	#sAr div:nth-child(4){
		height:150px;
	}
	#sAr div:nth-child(4) div{
		line-height:25px;
	}
	#sAr div:nth-child(4) div {
		display:inline-block;
		float:left;
	}
	#sAr div:nth-child(4) > div:first-child{
		width:220px;
		height:150px;
		border:1px solid black;
	}
	#sAr div:nth-child(4) > div:last-child{
		height:150px;
		margin-left:10px;
	}
	body .container:nth-child(2) > div:last-child{
		margin-bottom:100px;
	}
	#iconInfo{
		display:inline-block;
		width:80px;
		height:60px;
		float:left;
		margin:10px;
	}
	#iconInfo i{
		font-size:50px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	.pagination > li > a{
		cursor:pointer;
	}
	#noReview{
		height: 100px;
	}
	#noReview p{
		margin:0px;
	}
	#noReview p > .glyphicon{
		font-size:30px;
	}
	#noReview p span{
		color:lightgrey;
	}
	#qnaTable tr th:nth-child(1){
		width:60px;
	}
	#qnaTable tr th:nth-child(2){
		width:471px;
	}
	#qnaTable tr th:nth-child(3){
		width:109px;
	}
	#qnaTable tr th:nth-child(4){
		width:182px;
	}
	#qnaTable tr th:nth-child(5){
		width:158px;
	}
	.tableButton{
	    border: 1px solid lightgrey;
	    border-radius: 5px;
	    background-color: white;
	    font-weight: bold;	
	}
	div > strong{
		color:#5D646E;
	}
	#content > strong{
		font-size:24px;
	}
	.modal-footer{
		border:0;
		text-align:center;
	}
	#selectDiv{
		padding:10px 10px 0px 10px;
	}
	#selectDiv span{
		float:right;
	}
	#textBox{
		display:inline-block;
		width:565px;
		padding:5px 10px 10px 10px
	}
	#textBox div:first-child{
		height:30px;
		background-color:#F2F5F7;
		text-align:center;
		border:1px solid grey;
		border-bottom:0;
	}
	#textBox textarea{
		width:545px;
		height:150px;
		resize:none;
		border-color:grey;
		border-top:0;
	}
	#grade{
		width:568px;
		height:100px;
		padding:10px;
	}
	#grade > div{
		width:548px;
		height:70px;
		border:1px solid grey;
	}
	#grade div > div{
		display:inline-block;
	}
	#grade div > div:first-child{
		width:50px;
		float:left;
		text-align:center;
		position:relative;
		top:25px;
		margin-right:10px;
	}
	#grade div > div:last-child{
		position:relative;
		bottom:16px;
		width:490px;
		float:right;
	}
	#grade div > div:last-child p:first-child label{
		margin-right:30px;
	}
	#grade div > div:last-child p:last-child label{
		margin-right:104px;
	}
	p{
		margin-bottom:3px;
	}
	#reference{
		padding:10px;
		line-height:25px;
	}
	#pim .modal-header{
		border:0;
	}
	#pim .modal-body{
		padding:0px 15px 0px 15px;
	}
	#pim .modal-body textarea{
		resize: none;
	}
	#pim .modal-footer{
		border:0;
		text-align:center;
	}
	#pim .modal-title{
		font-weight:bold;
	}
	#pim hr{
		margin:5px;
	}
	#inputBar > div > #currentDiv{
		height:0;
		text-align:right;
		position:relative;
		bottom:20px;
	}
	#remitByte{
		margin-right:150px;
		margin-left:5px;
	}
	#productInquiry #moreQna,
	#evaluation #moreReview{
		background-color:lightgrey;
		padding:5px;
		border-radius:10px;
		margin-right:45px;
	}
	#moreQna strong,
	#moreReview strong{
		margin-right:3px;
		color:grey;
	}
	#moreQna span,
	#moreReview span{
		color:grey;
	}
	#productTable span{
		font-size:12px;
	}
	#thumbnail div > img{
		width:118px;
		height:98px;
		cursor:pointer;
	}
	.Optionprice{
	    position: relative;
	    bottom: 3px;	
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
			<div id="content">
				<strong>&#124;&nbsp;상품 소개</strong>
				<hr>
				<div id = "productIntroduce">
					<div id = "productImg">
						<div id = "img">
							<img id = "mainIMG" src = "upload/${goods.godMainImageUrl}">
						</div>
						<div id = "thumbnail">
							<c:forEach var = "img" items = "${subimages}">
								<div>
									<img class = "subImg" src = "upload/${img.subImageUrl}" />
								</div>							
							</c:forEach>
						</div>
					</div>
					<div id = "productInfo">
						<div>
							<strong>${goods.godName}</strong>
						</div>
						<div>
							<form>
							<table id = "productTable">
								<tr>
									<td>
										<span>판매 가격 : </span>
									</td>
									<td>
										<span><fmt:formatNumber value="${goods.godSellingPrice}" pattern="#,###" />원</span>
										<span id = "godPrice" style='display:none'>${goods.godSellingPrice}</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>적립 포인트 : </span>
									</td>
									<c:set var = "point" value = "${goods.godSellingPrice/pointPolicy.savePointPercent}" />
									<fmt:parseNumber var="p" value="${point}" integerOnly="true" />
									<td>
										<span><fmt:formatNumber value="${p}" pattern="#,###" /> 포인트</span>
									</td>
								</tr>
								<c:forEach var = "intro" items = "${godi}">
								<tr class = "introClass">
									<td>
										<span>${intro.itrName}</span>
									</td>
									<td>
										<span>${intro.itrContent}</span>
									</td>
								</tr>
								</c:forEach>
								<c:forEach var = "godo" items = "${godoList}" varStatus = "state">
								<c:choose>
								<c:when test = "${fn:length(godoList)>=2}">
								<c:choose>
									<c:when test ="${state.first}">
										<tr class = "optionClass optionFirst">
									</c:when>
									<c:when test ="${state.last}">
										<tr class = "optionClass optionLast">
									</c:when>
									<c:otherwise>
										<tr class = "optionClass">
									</c:otherwise>
								</c:choose>
									<td>
										<span>${godo.optName} : </span>
										<span class = 'optionName' style='display:none'>${godo.optName}</span>
									</td>
									<td>
										<select class = "optionSelect">
												<option value = "0">옵션을 선택해주세요</option>
											<c:forEach var = "option" items = "${godo.godoList}">
												<option value = "${option.optContent}" class = "${option.optPrice}">${option.optContent}</option>
											</c:forEach>
										</select>
										<span class = "Optionprice"></span>
									</td>
								</tr>
								</c:when>
								<c:when test = "${empty godoList[0].optName}">
									<tr class = "optionClass">
									
									</tr>
								</c:when>
								<c:when test = "${not empty godoList[0].optName}">
									<tr class = "optionClass optionFirst optionLast">
									<td>
										<span>${godo.optName} : </span>
									</td>
									<td>
										<select class = "optionSelect">
												<option value = "0">옵션을 선택해주세요</option>
											<c:forEach var = "option" items = "${godo.godoList}">
												<option value = "${option.optContent}" class = "${option.optPrice}">${option.optContent}</option>
											</c:forEach>
										</select>
										<span class = "Optionprice"></span>
									</td>									
									</tr>
								</c:when>
								</c:choose>
								</c:forEach>
								<tr class = "goodsStockClass">
									<td>
										<span>수량 : </span>
									</td>
									<td>
										<input type = "number" name = "amount" value = "1"/>
										<button type = "button" id = "pluse" class = "btn btn-default"><span>+</span></button>
										<button type = "button" id = "minus" class = "btn btn-default"><span>-</span></button>
									</td>
								</tr>
								<tr class = "deliveryClass">
									<td>
										<span>배송비 : </span>
									</td>
									<td>
									<span id = "deliveryPrice">
										<c:if test = "${goods.godSellingPrice>=deliveryPolicy.freeDeliveryMp}">
											<c:set var = "delivery" value = "0" />
										</c:if>
										<c:if test = "${goods.godSellingPrice<deliveryPolicy.freeDeliveryMp}">
											<c:set var = "delivery" value = "${deliveryPolicy.basicFee}" />
										</c:if>
										<c:if test = "${delivery==0}">
										무료&nbsp;&nbsp;[<fmt:formatNumber value="${deliveryPolicy.freeDeliveryMp}" pattern="#,###" />이상 구매시 배송비 무료]
										</c:if>
										<c:if test = "${delivery!=0}">
<fmt:formatNumber value="${delivery}" pattern="#,###" />
										원&nbsp;&nbsp;[<fmt:formatNumber value="${deliveryPolicy.freeDeliveryMp}" pattern="#,###" />이상 구매시 배송비 무료]										
										</c:if>
									</span>
									</td>
								</tr>
								<tr class = "totalPriceClass">
									<td>
										<strong>총 결제 금액 : </strong>
									</td>
									<td>
										<strong id = "totalPrice"><fmt:formatNumber value="${goods.godSellingPrice+delivery}" pattern="#,###" />원</strong>
									</td>
								</tr>
							</table>
						</form>
						<div id = "buttonGroup">
							<button id = "cart" class = "btn btn-default">장바구니</button>
							<button id = "buy" class = "btn btn-default">구매하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<div class = "btn-group btn-group-justified">
			<a href = "#detailInfo" class = "btn btn-default">상품 상세 정보</a>
			<a href = "#evaluation" class = "btn btn-default">상품평</a>
			<a href = "#productInquiry" class = "btn btn-default">상품문의</a>
			<a href = "#deliveryInfo" class = "btn btn-default">배송안내</a>
			<a href = "#sAr" class = "btn btn-default">교환 및 반품</a>
		</div>	
		<div id = "detailInfo">
			${goods.godDetailInfo}
		</div>
		<div id = "evaluation">
			<strong>&#124;&nbsp;상품평</strong>
			<span>해당 상품에 대한 상품평을 보실 수 있습니다.</span>
			<a id = "moreReview" href = "#"><strong>더 보기</strong><span class = "glyphicon glyphicon-plus"></span></a>
			<div id = "evaluationTable">
				<table id = "godrTable" class = "br">				

				</table>
				<div id = "godrPagination">
	
				</div>
			</div>
		</div>
		<div id = "productInquiry">
			<strong>&#124;&nbsp;상품 문의</strong>
			<span>상품에 대한 최신 Q&A를 보실 수 있습니다.</span>
			<a id = "moreQna" href = "#"><strong>더 보기</strong><span class = "glyphicon glyphicon-plus"></span></a>
			<div id = "orderitem">
				<table id = "qnaTable" class = "br">				
					<tr>
						<th>
							<span>번호</span>
						</th>
						<th>
							<span>문의 내용</span>
						</th>
						<th>
							<span>작성자</span>
						</th>
						<th>
							<span>작성일</span>
						</th>
						<th>
							<span>보기/닫기</span>
						</th>
					</tr>
				</table>
				<div id = "qnapagination">
		
				</div>
			</div>
		</div>
		<div id = "inputBar">
			<strong>상품 문의하기</strong>
			<span>(문의하신 내용 및 답변은 [마이 페이지 > 나의 상품 문의] 에서도 확인 가능합니다.)</span>
			<div>
				<div>
					<textarea onkeyup="chkword(this,800)" placeholder = "- 띄어쓰기를 포함하여 최대 800자까지 작성할 수 있습니다.&#13;&#10;※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
					<button id = "godqRegister" class = "btn btn-default">등록</button>
				</div>
				<div id = "currentDiv">
 					<span id = "currentByte">0</span><strong id = "remitByte">/ 800자</strong>
				</div>
			</div>
		</div>
		<div id = "deliveryInfo">
			<strong>&#124;&nbsp;배송 안내</strong>
			${commonPolicy.cmpDeliveryGuide}
		</div>
		<div id = "sAr">
			<strong>&#124;&nbsp;교환 및 반품</strong>
			${commonPolicy.cmpExchangeGuide}
		</div>
	</div>
	
	<div class = "modal fade" id  ="Alert">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title"></h4>
				</div>
				<div class = "modal-body">
					<div id = "iconInfo">
						<i class="fas fa-info-circle"></i>
					</div>
					<div>
						<p></p>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id = "godrModify">
		<div class = "modal-dialog modal-md">
			<div class = "modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">X</button>
					<strong>&#124;&nbsp;상품평 수정하기</strong>
					<span>Write Review</span>
				</div>
				<div class = "modal-body">
					<div id = "editor">
						<div id = "textBox">
							<div>
								<input type = 'number' name = 'currentNum' style = 'display:none'>
								<input type = 'number' name = 'godr' style = 'display:none'>
								<textarea id = "GoodsReview" name = "GoodsReview"></textarea>
							</div>
						</div>						
					</div>
					<div id = "grade">
						<div>
							<div>
								<span>평점</span>
							</div>
							<div>
								<p>
									<input type = 'radio' name = "grade" value = "5" />
									<label for = "wellContent">매우 만족 ☆☆☆☆☆</label>
									<input type = 'radio' name = "grade" value = "4" />
									<label for = "content"> 만족 ☆☆☆☆</label>
									<input type = 'radio' name = "grade" value = "3" />
									<label for = "normal">보통 ☆☆☆</label>
								</p>
								<p>
									<input type = 'radio' name = "grade" value = "2" />
									<label for = "highlyUnsatisfactory">불만 ☆☆</label>
									<input type = 'radio' name = "grade" value = "1 " />
									<label for = "unsatisfactory"> 매우 불만 ☆</label>
								</p>
							</div>						
						</div>
					</div>
					<div id = "reference">
						<strong>※ 참고하세요!</strong>
						<br>
						<span>- 상품평은 상품당 1회만 작성 할 수 있습니다.</span>
						<br>
						<span>- 작성한 상품평은 [마이 페이지 > 상품평]에서 수정할 수 있습니다..</span>
					</div>
				</div>
				<div class = "modal-footer">
					<button id = "godrComplete" class = "btn btn-default"  data-dismiss = "modal">작성 완료</button>
					<button class = "btn btn-default"  data-dismiss = "modal">작성 취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id  ="pim">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;상품 문의 : 수정하기</h4>
					<hr>
				</div>
				<form id = "modalForm">
				<div class = "modal-body">
					<textarea id = "godqContent" class = "form-control" cols = "20" rows = "6" name = "godqContent"></textarea>
					<input id = "godqNum" type = "text"  name = "godq" style = "display:none"/>
					<input id = "idx" type = "text" name = "idx" style = "display:none" />
				</div>
				<div class ="modal-footer">
					<button id = "godqComplete" type = "button" class = "btn btn-default complete" data-dismiss = "modal">작성완료</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성취소</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type ="text/javascript">
	var length = "${fn:length(godoList)}"
	console.log(length);
	CKEDITOR.replace('GoodsReview',{
	    toolbar: 'Full',
	    uiColor: '#F2F5F7',
	    height:'200px'
	});
	CKEDITOR.config.language = 'ko';	
		var godNum = "${godNum}"
		var userId = "${user}"
		var mainImageUrl;
		var godSellingLimit = "${goods.godSellingLimit}"
		var dfm = "${deliveryPolicy.freeDeliveryMp}"
		var basicFee = "${deliveryPolicy.basicFee}"
		var deliveryP = "<fmt:formatNumber value='${delivery}' pattern='#,###' />&nbsp;원&nbsp;&nbsp;"
		var deliveryMsg = "[<fmt:formatNumber value='${deliveryPolicy.freeDeliveryMp}' pattern='#,###' />이상 구매시 배송비 무료]"
	</script>
</body>
</html>