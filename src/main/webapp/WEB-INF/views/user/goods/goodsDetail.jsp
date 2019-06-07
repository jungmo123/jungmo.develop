<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		height:500px;
		position: relative;
   		left: 100px;
	}
	#productImg{
		display:inline-block;
		width:390px;
		height:390px;
		float:left;
	}
	#productInfo{
		display:inline-block;
		width:360px;
		height:390px;
		float:left;
	}
	#img{
		width:380px;
		height:380px;
		border:1px solid grey;
		margin:5px;
	}
	#thumbnail{
		text-align:center;
	}
	#thumbnail div{
		display:inline-block;
		width:100px;
		height:70px;
		border:1px solid grey;
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
	#productTable tr:nth-child(5){
		border-top:1px solid lightgrey;
	}
	#productTable tr:nth-child(6),
	#productTable tr:nth-child(7),
	#productTable tr:nth-child(8),
	#productTable tr:nth-child(9)	{
		border-bottom:1px solid lightgrey;
	}
	#productTable tr:nth-child(7) td input[type='number']{
		width:40px;
		height:15px;
		text-align:center;
	}
	#productTable tr:nth-child(7) button{
		padding:0;
		width:20px;
		height:15px;
		position:relative;
		bottom:2px;
	}
	#productTable tr:nth-child(7) button:nth-child(2) span{
		margin-left:0;
		position:relative;
		bottom:4px;
	}
	#productTable tr:nth-child(7) button:nth-child(3) span{
		margin-left:0;
		position:relative;
		bottom:6px;
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
		width:980px;
		height:500px;
		border:1px solid grey;
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
	#evaluationTable table tr:nth-child(3) .visible{
		
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
		position:relative;
		right:160px;
	}
	#deliveryInfo,
	#sAr{
		margin-top:50px;
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
						
						</div>
						<div id = "thumbnail">
							<div>
								<span>{썸네일1}</span>
							</div>
							<div>
								<span>{썸네일1}</span>
							</div>
							<div>
								<span>{썸네일1}</span>
							</div>
						</div>
					</div>
					<div id = "productInfo">
						<div>
							<strong>{상품명}</strong>
						</div>
						<div>
							<form>
							<table id = "productTable">
								<tr>
									<td>
										<span>판매 가격 : </span>
									</td>
									<td>
										<span>{가격}원</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>포인트 : </span>
									</td>
									<td>
										<span>{적립 포인트} 포인트</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>{항목명 1} : </span>
									</td>
									<td>
										<span>{내용}</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>{항목명 2} : </span>
									</td>
									<td>
										<span>{내용}</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>{옵션 1} : </span>
									</td>
									<td>
										<select>
											<option>{옵션1}을 선택해 주세요.</option>
											<option>{옵션1}</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<span>{옵션 2} : </span>
									</td>
									<td>
										<select>
											<option>{옵션2}을 선택해 주세요.</option>
											<option>{옵션2}</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<span>수량 : </span>
									</td>
									<td>
										<input type = "number" name = "amount" value = "1"/>
										<button id = "pluse" class = "btn btn-default"><span>+</span></button>
										<button id = "minus" class = "btn btn-default"><span>-</span></button>
									</td>
								</tr>
								<tr>
									<td>
										<span>배송비 : </span>
									</td>
									<td>
										<span>{배송비}원</span>
									</td>
								</tr>
								<tr>
									<td>
										<strong>총 결제 금액 : </strong>
									</td>
									<td>
										<strong>{합계 금액}원</strong>
									</td>
								</tr>
							</table>
						</form>
						<div id = "buttonGroup">
							<button class = "btn btn-default">장바구니</button>
							<button class = "btn btn-default">구매하기</button>
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
			
		</div>
		<div id = "evaluation">
			<strong>&#124;&nbsp;상품평</strong>
			<span>해당 상품에 대한 상품평을 보실 수 있습니다.</span>
			<a href = "#"><span>더 보기</span><span class = "glyphicon glyphicon-plus"></span></a>
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
			<a href = "#"><span>더 보기</span><span class = "glyphicon glyphicon-plus"></span></a>
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
					<textarea placeholder = "- 띄어쓰기를 포함하여 최대 1000자까지 작성할 수 있습니다.&#13;&#10;※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
					<button class = "btn btn-default">등록</button>
				</div>
				<span>0자 / 1,000자</span>
			</div>
		</div>
		<div id = "deliveryInfo">
			<strong>&#124;&nbsp;배송 안내</strong>
			<div>
				<span>{관리자에서 등록한 글 호출}</span>
			</div>
			<div>
				<span>(등록 예)</span>
				<br>
				<strong>기본 배송료 : </strong>
				<span>2,500원  (도서산간 지역 배송비 추가)</span>
				<br>
				<strong>무료 배송 : </strong>
				<span>100,000원 이상 구매 시 (도서산간 지역 200,000원 이상 구매 시)</span>
				<br>
				<strong>상품배송</strong>
				<br>
				<span>&nbsp;- 결제 완료 후 1,2일 이내 도착</span>
				<br>
				<span>&nbsp;- 영업일 오후 3시 이전 주문 시 : 당일 발송</span>
				<br>
				<span>&nbsp;- 영업일 오후 3시 이후 주문 시 : 명일 발송</span>
				<br>
				<span>&nbsp;- 토,일 공휴일 주문 시 : 휴일 이후 영업일 첫날 발송</span>
				<br>
				<strong>※ 천재지변, 명절(설/추석)에는 택배사 배송 물량 폭주로 배송이 지연될 수 있으니 양해 부탁드립니다.</strong>
			</div>
		</div>
		<div id = "sAr">
			<strong>&#124;&nbsp;교환 및 반품</strong>
			<div>
				<span>{관리자에서 등록한 글 호출}</span>
			</div>
			<div>
				<span>(등록 예)</span>
			</div>
			<div>
				<div>
				
				</div>
				<div>
					<span>교환 및 반품은 배송 완료 후 7일 이내까지 가능</span>
					<br>
					<span>&nbsp;- 제품 품질 이상,오 배송의 경우 교환 및 반품 비용은 회사에서 부담합니다.</span>
					<br>
					<span>&nbsp;- 고객님의 단순 변심의 경우 교환 및 반품 비용은 본인 부담입니다.</span>
					<br>
					<strong>※ 상품을 확인하기 위해 택배 박스의 포장은 제거할 수 있으나,내부 상품을 보호하는<br>
					비밀을 제거할 경우 반품할 수 없습니다.내부 상품을 보호하는 비닐은 투명 비닐을<br>
					사용했기 때문에 비닐을 제거하지 않아도 충분히 상품을 확인할 수 있습니다.</strong>			
				</div>
			</div>
		</div>
		<div>
			<span>비닐 제거 시 반품/환불 불가!</span>
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

	<div class = "modal fade" id  ="loginAlert">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">Comfirm 2-2</h4>
				</div>
				<div class = "modal-body">
					<div id = "iconInfo">
						<i class="fas fa-question-circle"></i>
					</div>
					<div>
						<span>로그인 후 이용 가능합니다.</span>
						<br>
						<span>로그인 하시겠습니까?</span>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal"  onclick = "location.href = '../LOGIN/01.html'">예</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">아니요</button>
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
	
	<script type ="text/javascript">
	CKEDITOR.replace('GoodsReview',{
	    toolbar: 'Full',
	    uiColor: '#F2F5F7',
	    height:'200px'
	});
	CKEDITOR.config.language = 'ko';	
		var godNum = "${godNum}"
	</script>
</body>
</html>