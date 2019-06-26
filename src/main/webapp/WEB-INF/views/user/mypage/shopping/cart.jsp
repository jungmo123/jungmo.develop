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
	//공통 끝
	#basket{
		padding:10px;
	}
	#basket table{
		width:780px;
		text-align:center;
	}
	#basket table tr td,
	#basket table tr th{
		border-top:1px solid lightgrey;
		border-bottom:1px solid lightgrey;
	}
	#basket table tr td{
		padding:5px;
	}
	#basket table tr th{
		background-color:#F2F5F7;
		height:40px;
		text-align:center;
	}
	#basket table tr th:nth-child(1){
		width:30px;
	}
	#basket table tr th:nth-child(2){
		width:30px;
	}
	#basket table tr th:nth-child(3){
		width:390px;
	}
	#basket table tr td:nth-child(3){
		text-align:left;
	}
	#item{
		display:inline-block;
		width:90px;
		margin-left:10px;
		float: left;
	}
	#itemInfo{
	    display: inline-block;
	    width: 270px;
	    height: 90px;
	    margin: 8px 0 0 10px;
	    float: left;
	    overflow: auto;
	}
	#basket table tr td:nth-child(4){
		width:90px;
	}
	#basket table tr td:nth-child(5){
		width:120px;
	}
	#basket table tr td:nth-child(5) input[type='number']{
		width:40px;
		height:20px;
	}
	#basket table tr td:nth-child(5) button{
		padding:0;
		width:30px;
		height:20px;
		font-size:12px;
		font-weight:bold;
		position:relative;
		bottom:2px;
	}
	#basketFooter{
	 margin-top:10px;
	}
	#basketFooter span{
		float:right;
		font-size:16px;
	}
	#basketFooter span strong{
		margin-left:20px;
		font-size:25px;
	}
	#buttonGroup{
		text-align:center;
	}
	#buttonGroup button{
		font-size:12px;
		font-weight:bold;
		position:relative;
		left:100px;
		top:30px;
	}
	img{
		width:90px;
		height:100px;
	}
	#option{
	    overflow: auto;
	    height: 90px;	
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/mypageHeader.jsp" %>
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
						<a href = "orderHistory1"><span>> 주문 내역</span></a>
						<a href = "cart" class= "activeMenu"><span>> 장바구니</span></a>
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
		<strong>&#124;&nbsp;장바구니</strong>
		<hr>
		<div id = "basket">
			<table>
				<thead>
					<tr>
						<th>
							<input type = "checkbox" name = "Allnumber"/>
						</th>
						<th>
							<span>번호</span>
						</th>
						<th>
							<span>상품정보</span>
						</th>
						<th>
							<span>판매가</span>
						</th>
						<th>
							<span>수량</span>
						</th>
						<th>
							<span>합계금액</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "cart" items = "${carts}" varStatus = "state">
					<c:set var = "total" value = "0" />
					<tr>
						<td>
							<input class = "${cart.cartNum}" type = "checkbox" name = "number" />
						</td>
						<td>
							<span>${state.index+1}</span>
						</td>
						<td>
							<div id = "item">
								<img src = "../upload/${cart.godListImageUrl}">
							</div>
							<div id = "itemInfo">
								<p>
									<strong>${cart.godName}</strong>
								</p>
								<c:if test = "${!empty cart.godoList[0].optName}">
								<c:forEach var = "option" items = "${cart.godoList}">
								<p>
									<strong id = "${fn:length(cart.godoList)}">${option.optName} : </strong>
									<span>${option.optContent}</span>
									<c:set var = "total" value = "${(total + option.optPrice)}" />
								</p>								
								</c:forEach>
								</c:if>
							</div>
						</td>
						<td>
							<div id = "option">
							<p>
								<c:set var = "total" value = "${(total + cart.godSellingPrice)}" />
								<span><fmt:formatNumber value="${cart.godSellingPrice}" pattern="#,###" />원</span>
								<c:set var = "total" value = "${(total*cart.godAmount)}" />
							</p>
							<c:if test = "${!empty cart.godoList[0].optName}">
							<c:forEach var = "option" items = "${cart.godoList}">
							<p>
								<span><fmt:formatNumber value="${option.optPrice}" pattern="#,###" />원</span>
							</p>								
							</c:forEach>
							</c:if>
							</div>
						</td>
						<td>
							<input type = "number" name = "amount" value = "${cart.godAmount}"/>
							<button class = "btn btn-default modify">수정</button>
						</td> 
						<td>
							<span id = "${total}" class = "total"><fmt:formatNumber value="${total}" pattern="#,###" />원</span>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id = "basketFooter">
			<button class = "btn btn-default">선택 삭제</button>
			<span>상품 총 금액 : <strong id = "totalprice">0</strong><strong>원</strong></span>
		</div>
		<div id = "buttonGroup">
			<button class = "btn btn-default" onclick="location.href='../../GOODS/01.html'">계속 쇼핑하기</button>
			<button class = "btn btn-default" onclick="location.href='../../BUY/01.html'">선택 구매</button>
		</div>
	</div>
	</div>
</div>

<script>
$("input[type='number']").keyup(function(){
	var point = $(this).val();
	if(point < 0){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '음수는 입력할 수 없습니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
		$(this).val("");
	}else if(point == "0"){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '수량은 최소 1개 이상입니다.',
			  showConfirmButton: false,
			  timer: 1500
			});
		$(this).val("1");
	}
})

function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
}

function commaDelete(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}

$("input[type='checkbox']").click(function(){
    if($(this).is(":checked")){
    	var total = $(this).parents("tr").find(".total").prop("id");
    	var totalprice = $("#totalprice").text();
    	$("#totalprice").text(comma(Number(total)+Number(commaDelete(totalprice))));
    }else{
    	var total = $(this).parents("tr").find(".total").prop("id");
    	var totalprice = $("#totalprice").text();
    	$("#totalprice").text(comma(Number(commaDelete(totalprice))-Number(total)));
    }
})

$(".modify").click(function(){
	var cartNum = $(this).parents("tr").find("input[type='checkbox']").prop("class");
	var cartAmount = $(this).parents("tr").find("input[type='number']").val();
	if(cartAmount != ""){
		$.ajax({
			url:"amountModify",
			data:{
				cartNum:cartNum,
				cartAmount:cartAmount
			},
			method:"post",
			success:function(data){
				location.href = "/shoppingmall/mypage/cart";
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '수정에 실패했습니다!',
					  showConfirmButton: false,
					  timer: 1500
					});				
			}
		})		
	}else{
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '수량을 입력해주세요!',
			  showConfirmButton: false,
			  timer: 1500
			});		
	}
})
</script>

</body>
</html>