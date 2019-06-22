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
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#content > strong{
		font-size:20px;
	}
	#content > hr{
		margin:10px 0 10px 0;
	}
	#content{
		width:1100px;
	}
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:470px;
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
		line-height:30px;
		margin-bottom: 10px;
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
	#nav #navContent div > .activeMenu{
		color:red !important;
	}
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#obTitle div{
		text-align:center;
	}
	#obTitle div span{
		margin:0px 10px 0px 10px;
	}
	#obTitle form > div:first-child button{
		width:80px;
		height:30px;
		padding:0;
		position:relative;
		bottom:2px;
	}
	#obTitle > div:nth-child(2) button{
		width:40px;
		height:20px;
		padding:0;
		font-size:12px;
	}
	#obTitle > div:last-child{
		margin-top:10px;
		color:#878787;
	}
	#input1,#input2{
		display:inline-block;
		width:120px !important;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px !important;
	}
	[type="date"] {
	  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
	}
	[type="date"]::-webkit-inner-spin-button {
	  display: none;
	}
	[type="date"]::-webkit-calendar-picker-indicator {
	  opacity: 0;
	}
	#obContent{
		padding:10px;
	}
	#obContent > div{
		width:792px;
		height:170px;
		border:1px solid #878787;
		margin-bottom:20px;
	}
	#obContent > div > div{
		padding:5px;
	}
	#obContent > div > div:first-child{
		display:inline-block;
		width:30px;
		float:left;
	}
	#obContent > div > div:last-child{
		display:inline-block;
		margin-left:10px;
		width:750px;
		float:left;
	}
	#obContent > div > div:last-child hr{
		margin:5px;
	}
	#obContent > div > div:last-child > div >  span > .btn:nth-child(1){
		width:90px;
		height:25px;
		padding:0px;
		font-size:12px;
		font-weight:bold;
	}
	#obContent > div > div:last-child > div >  span > .btn:nth-child(2){
		width:60px;
		height:25px;
		padding:0px;
		font-size:12px;
		font-weight:bold;
	}
	#obContent > div > div:last-child > div >  span > span{
		margin-right:80px;
	}
	.imageBox{
		width:90px;
		height:110px;
		display:inline-block;
		float:left;
		margin-top:6px;
	}
	.itemInfo{
		display:inline-block;
		width:400px;
		float:left;
		margin:10px 0 0 10px;
	}
	.pAd{
		width:220px;
		height:120px;
		display:inline-block;
		float:left;
		margin-top:6px;
	}
	.pAd > div{
		display:inline-block;
		width:90px;
		height:110px;
		border:1px solid grey;
		float:left;
		margin-right:5px;
		text-align:center;
	}
	.pAd > div > div{
		height:55px;
	}
	.pAd > div > div:first-child{
		background-color:#F2F5F7;
	}
	.pAd > div > div strong,
	.pAd > div > div span{
		position:relative;
		top:20px;
	}
	.pAd > div > div button{
		width:80px;
		height:25px;
		padding:0;
		font-size:12px;
		font-weight:bold;
	}
	<!--modal시작-->
	.modal-content{
		width:500px;
	}
	#inquiry,#state{
		margin-top:10px;
	}
	#inquiry > div,
	#state > div{
		padding:10px;
	}
	.modal-body table{
		width:440px;
	}
	.modal-body table tr th,
	.modal-body table tr td{
		text-align:center;
		height:22px;
	}
	.modal-body table thead tr{
		background-color:#F2F5F7;
	}
	.modal-body table tr td,
	.modal-body table tr th{
		border:1px solid grey;
	}
	.modal-footer{
		text-align:center;
	}
	.modal-footer button{
		width:100px;
		padding:0;
	}
	.modal-footer{
		text-align:center;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
	}
	#pagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
	}
	img{
		width:90px;
		height:110px;
	}
	#obContent  #noOrder{
		border:0px;
		text-align:center;
		margin-top:50px
	}
	#obContent  #noOrder p span{
		font-size:35px;
		color:#BABABA;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/userheader.jsp" %>
	<div id = "content">
		<div id = "navbar">
			<div id="nav">
				<div id="navTitle">
					<span>마이 페이지</span>
				</div>
				<div id="navContent">
					<p>쇼핑 이용 정보</p>
					<hr>
					<div>
						<a href = "#" class= "activeMenu"><span onclick = "location.href = '01.html'">> 주문 내역</span></a>
						<a href = "#"><span onclick = "location.href='04.html'">> 장바구니</span></a>
						<a href = "#"><span onclick = "location.href = '05.html'">> 포인트 이용 내역</span></a>
					</div>
					<p>게시판 이용 내역</p>
					<hr>
					<div>
						<a href = "#"><span onclick = "location.href = '../BOARD/01.html'">> 1:1 문의</span></a>
						<a href = "#"><span onclick = "location.href = '../BOARD/04.html'">> 나의 상품평</span></a>
						<a href = "#"><span onclick = "location.href = '../BOARD/05.html'">> 나의 상품 문의</span></a>
					</div>
					<p>개인정보 수정</p>
					<hr>
					<div>
						<a href = "#"><span onclick = "location.href = '../MYINFO/02.html'">> 개인정보 수정</span></a>
						<a href = "#"><span onclick = "location.href = '../MYINFO/03.html'">> 비밀번호 변경</span></a>
					</div>
					<a href = "#"><span onclick = "location.href = '../MYINFO/04.html'">회원탈퇴</span></a>
				</div>
			</div>		
		</div>
		<div id = "tableDiv">
		<strong>&#124;&nbsp;주문 내역</strong>
		<div id = "orderBreakdown">
			<hr>
			<div id = "obTitle">
				<form id = "dateForm" action = "orderHistorySearch1" method = "post">
				<div>
					<span>주문 기간</span>
						<div id = "input1">
							<input type="date" name="date1" class="dateInput">
						</div>
					<span>~</span>
						<div id = "input2">
							<input type="date" name="date2" class="dateInput">	
						</div>
					<button class = "btn btn-default">조회</button>	
				</div>
				</form>
				<div id = "buttons">
					<button id = "sysdate" class = "btn btn-default">당일</button>
					<button id = "1week" class = "btn btn-default">1주일</button>
					<button id = "3week" class = "btn btn-default">3주일</button>
					<button id = "1month" class = "btn btn-default">1개월</button>
					<button id = "3month"  class = "btn btn-default">3개월</button>
				</div>
				<div>
					<span> 최근 1년 이내 주문 내역만 조회할 수 있습니다.</span>
				</div>
			</div>
			<hr>
			<div id = "obContent">
				<c:if test = "${purchases != null}">
				<c:forEach var = "order" items = "${purchases}">
				<c:set var = "totalprice" value = "0" /> 
				<div id = "${order.ordNum}" class = "ContentBox">
					<div>
						<div>
							<span>
								<button class = "btn btn-default detail">주문 상세 내역</button>
								<c:if test = "${order.ordType == '배송준비중' || order.ordType == '결제완료'}">
								<button type = "button" id = "cancel" class = "btn btn-default" >주문 취소</button>
								</c:if>
								<c:if test = "${order.ordType == '배송중' || order.ordType == '배송완료'}">
								<button type = "button"  id = "reex" class = "btn btn-default">교환/환불</button>
								</c:if>
								<c:if test = "${order.ordType == '교환' || order.ordType == '환불'}">
								<button type = "button"  id = "rexxDetail" class = "btn btn-default">${purchase.ordType} 신청서 수정</button>
								</c:if>
							</span>							
						</div>				
						<hr>
						<div>
							<div class = "imageBox">
								<img src = "../upload/${order.goods[0].godListImageUrl}">
							</div>
							<div class = "itemInfo">
								<p>
									<span>${order.goods[0].godName}
											<c:if test = "${(fn:length(order.goods)-1) != 0}">
												외 ${fn:length(order.goods)-1}건
											</c:if>
									 </span>
								</p>
								<p>
									<span><strong>주문번호 :</strong>${order.ordNum}</span>
								</p>
								<p>
									<span><strong>주문일시 :</strong><fmt:formatDate value = "${order.ordDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
								</p>
							</div>
							<div class = "pAd">
								<c:set var = "total" value = "0" />
								<c:forEach var = "god" items = "${order.goods}" varStatus = "state">
									<c:forEach  var = "option" items= "${god.godoList}" varStatus = "state">
										<c:set var = "total" value = "${(total + option.optPrice)}" />
									</c:forEach>
									<c:set var = "totalprice" value = "${((totalprice+(total+god.godSellingPrice)*god.godAmount))}" />
									<c:set var = "total" value = "0" />
								</c:forEach>
								<c:set var = "usingPoint" value = "${order.usingPoint}" />
								<c:set var = "dvPrice" value = "0" />
								<c:if test = "${totalprice-usingPoint < delivery.freedeliveryMp}" >
									<c:set var = "dvPrice" value = "${delivery.basicFee}" />
								</c:if>		
								<div>
									<div>
										<strong>금액</strong>
									</div>
									<div>
										<span><fmt:formatNumber value="${(totalprice+dvPrice)-usingPoint}" pattern="#,###" />원</span>
									</div>
								</div>
								<div>
									<div>
										<strong>주문/배송</strong>
									</div>
									<div>
										<span>
											<c:if test = "${order.invoiceNumber eq null}">
												<c:set var = "invoiceNum" value = "0" />
												<c:set var = "tcode" value = "0" />
												<c:set var = "tname" value = "0" />
											</c:if>
											<c:if test = "${order.invoiceNumber ne null}">
												<c:set var = "invoiceNum" value = "${order.invoiceNumber}" />
												<c:set var = "tcode" value = "${order.tcode}" />
												<c:set var = "tname" value = "${order.tname}" />
											</c:if>
											<c:choose>
												<c:when test = "${order.ordType eq '배송중'}">
													<button id = "${invoiceNum}" class = "btn btn-default search" >배송중</button>
													<span id = "${tname}" style='display:none'>${tcode}</span>
												</c:when>
												<c:when test = "${order.ordType eq '배송완료'}">
													<button id = "${invoiceNum}" class = "btn btn-default search" >배송완료</button>
													<span id = "${tname}" style='display:none'>${tcode}</span>
												</c:when>
												<c:otherwise>
													${order.ordType}
												</c:otherwise>
											</c:choose>
										</span>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>					
				</c:forEach>
				</c:if>
				<c:if test = "${empty purchases}">
					<div id = "noOrder">
						<p><span class = 'glyphicon glyphicon-info-sign'></span></p>
						<p><span>검색 결과가 없습니다</span></p>
					</div>
				</c:if>
			</div>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "${pageMaker.prev}">
							<li><a href = "orderHistory${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
						</c:if>
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
							<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href = "orderHistory${type}${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test = "${pageMaker.next}">
							<li><a href = "orderHistory${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
						</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
</div>
</div>
	
	<div class = "modal fade" id  ="mySmallModal">
		<div class = "modal-dialog">
			<div class ="modal-content">
				<div class = "modal-body">
					<div id = "inquiry">
						<strong>&#124;&nbsp; 배송 조회</strong>
						<button type = "button" class = "close" data-dismiss = "modal">X</button>
						<div>
							<table id = "firstTable">
								<thead>
									<tr>
										<th>택배사</th>
										<th>송장번호</th>
										<th>보내는사람</th>
									</tr>
								</thead>
								<tbody id = "dvInfo">

								</tbody>
							</table>
						</div>
					</div>
					<div id = "state">
						<strong>&#124;&nbsp; 배송 상황</strong>
						<div>
							<table id = "secondTable">
								<thead>
									<tr>
										<th>날짜</th>
										<th>송장위치</th>
										<th>배송상태</th>
										<th>연락처</th>
									</tr>
								</thead>
								<tbody id = "dvData">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
<script type = "text/javascript">
$(function(){
	var myKey = "7AcD6E0ePa57zoyXEUW0AQ"; // sweet tracker에서 발급받은 자신의 키 넣는다.
		// 배송정보와 배송추적 tracking-api
        $(".search").click(function() {
        	var t_code = $(this).next().text();
        	var t_invoice = $(this).prop("id");
        	var name = $(this).next().prop("id");
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	  				
	            		myInvoiceData += ('<td>'+name+'</td>');     				               				
	            		myInvoiceData += ('<td>'+data.invoiceNo+'</td>');     				        	 				
	            		myInvoiceData += ('<td>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');      		
                	}
        			
                	
                	$("#dvInfo").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#dvData").html(myTracking);
                	
            		$("#mySmallModal").modal();
                }
            });
        });		
});

$("#dateForm").submit(function(e){
	if($("#dateForm #input1 input").val()=="" || $("#dateForm #input2 input").val()==""){
		Swal.fire({
			  position: 'top',
			  type: 'warning',
			  title: '날짜를 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});
		return false;
	}
})

$("#buttons button").click(function(){
	var period = $(this).prop("id");
	var form = $("<form action = 'orderHistorySearch1' method = 'post' style = 'display:none'></form>");
	var input = $("<input type = 'text' name = 'period'></input>");
	input.val(period);
	form.append(input);
	$("body").append(form);
	form.submit();
})

$(".detail").click(function(){
	var ordNum = $(this).parents(".ContentBox").prop("id");
	var form = $("<form style = 'display:none'></form>");
	form.attr({
		action:"orderHistoryDetail"+ordNum,
		method:"post"
	})
	$("body").append(form);
	form.submit();
})

</script>	
	
</body>
</html>