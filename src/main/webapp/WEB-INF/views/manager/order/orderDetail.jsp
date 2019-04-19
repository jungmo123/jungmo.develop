<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/AdminCss.css" />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<style>
	button,input{
		height:25px;
		line-height:3px;
	}
	#orderBox{
		height:50px;
		border-radius:10px;
		background-color:#F2F5F7;
		margin:5px 0px 20px 0px;
	}
	#orderBox div{
		height:50px;
		padding-top:8px;
		padding-left:10px;
	}
	#orderBox #firstLine div{
		display:inline-block;
		float:left;
		width:33%;
		padding-bottom:5px;
	}
	#orderitem{
		margin-bottom:10px;
	}
	#deliveryForm div{
		margin-top:10px;
		display:inline-block;
	}
	#deliveryForm div:nth-child(1) .form-control,#deliveryForm div:nth-child(2) .form-control{
		display:inline-block;
		font-size:12px;
		width:90px;
		padding:2px;
	}
	#deliveryForm div:nth-child(2){
		float:right;
	}
	#deliveryForm b{
		margin-right:10px;
	}
	#orderitem table{
		width:100%;
		text-align:center;
	}
	#orderitem table tr{
		border:1px solid lightgrey;
		height:30px;
	}
	#orderitem table th{
		text-align:center;
		margin-left:10px;
	}
	.br{
		margin-top:10px;
	}
	select{
		width:80px;
	}
	#item{
		width:300px;
		line-height:28px;
	}
	#item div{
		display:inline-block;
		margin:5px;
	}
	#item strong{
		margin-right:5px;
	}
	.itemName{
		float:left;
		margin-right:5px;
	}
	#image{
		width:80px;
		height:100px;
		border:1px solid black;
		margin:10px;
		display:inline-block;
	}
	.left1{
		position:relative;
		right:1px;
	}
	.left2{
		position:relative;
		right:8px;		
	}
	#itemOption strong{
		float:left;
	}
	#buyerInfo table{
		width:700px;
		height:50px;
	}
	#buyerInfo2  tr  td:nth-child(1){
		width:120px;
	}
	.buy1{
		text-align:right;
		padding-right:10px;
		font-weight:bold;
	}
	.buy2{
		padding-left:10px;
	}
	.phone input{
		width:80px;
	}
	#buyerInfo table{
		width:700px;
		margin-bottom:10px;
	}
	#buyerInfo2  tr  td{
		border-top:2px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	.buy1{
		text-align:right;
		border-right:1px solid grey;
		width:120px;
		padding:10px;
		font-weight:bold;
	}
	.buy2{
		padding:10px;
	}
	#address1{
		width:150px;
		margin-bottom:8px;
		margin-right:10px;
	}
	#address1Btn{
		border-radius:5px;
		background-color:white;
	}
	#address2{
		width:300px;
	}
	#address3{
		width:180px;
	}
	.phone input{
		width:80px;
	}
	#deilveryRequest{
		width:500px;
		height:50px;
	}
	.right{
		float:right;
		position:relative;
		right:60px;
	}
	.right span{
		color:grey;
	}
	.br{
		margin-top:10px;
	}
	#paymentWindow > div{
		margin-top:10px;
		width:320px;
		height:200px;
		display:inline-block;
		margin:10px;
	}
	.divLeft{
		width:45%;
		float:left;
		box-sizing:border-box;
	}
	.divRight{
		width:45%;
		float:right;
		box-sizing:border-box;
	}
	.paymentRight div{
		margin:10px 0px 0px 0px;
	}
	#paymentWindow table{
		margin-top:10px;
		width:330px;
	}
	#paymentWindow tr td{
		border-top:2px solid grey;
		border-bottom:2px solid grey;
		height:33px;
	}
	#paymentWindow td:first-child{
		text-align:right;
		padding-right:10px;
	}
	#paymentWindow:first-child{
		margin-right:20px;
	}
	#logDiv{
		position:relative;
		right:10px;
	}
	#manage > div{
		margin-top:10px;
		width:320px;
		height:175px;
		display:inline-block;
		margin:10px;
	}
	#manage textarea{
		line-height:23px;
	}
	#submitDiv{
		text-align:center;
	}
	#submitDiv input{
		width:100px;
		margin-right:5px;
	}
	#submitDiv button{
		width:100px;
		margin-left:5px;
		position:relative;
		left:12px;
	}
</style>
</head>
<body>

<div class="container">
	<%@ include file = "../navigation/orderNav.jsp" %>
		<div id="content">
			<%@ include file = "../header/header.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Order Managament</p>
				<p id = "currentIdx">&#124; 주문관리 > 스타일 숍 주문 > 상세보기</p>
			</div>
			<div id = "deliveryForm">
				<div>
					<b>주문 처리 상태</b>
					<select class = "form-control">
						<option>배송준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
					</select>
					<button class = "form-control">교환 진행</button>			
				</div>
				<div>
					<b>운송장번호</b>	
					<select class = "form-control">
						<option>택배회사</option>
					</select>
					<input class = "form-control" type = "text" name = "deliveryNumber" placeholder = "운송장번호 입력">
					<button class = "form-control">배송 조회</button> 
					<button class = "form-control">주문 취소하기</button>		
				</div>
			</div>
				<div id = "orderBox">
					<div id = "firstLine">
						<div>
							<b>주문일 : </b><span> {년,월,일,시,분,초}</span>					
						</div>
						<div>
							<b>주문고객 : </b><span>이름 {ID}</span>
						</div>
						<div>
							<b>주문번호 : </b><span>{주문번호}</span>
						</div>			
					</div>
				</div>
				<div id = "orderitem">
				<strong>&#124; 주문 상품</strong>
					<table class = "br">
						<tr>
							<th>번호</th>
							<th></th>
							<th>상품 정보</th>
							<th>수량</th>
							<th>합계 금액</th>
							<th>적립금액</th>
						</tr>				
						<tr>
							<td>
								<span class = "number">2</span>
							</td>
							<td>
								<div id = "image">목록이미지</div>
							</td>
							<td id = "item">
								<div>
									<strong class = "itemName">상품명</strong>
									<span>{상품명}</span>
									<br>
									<strong class = "itemName">옵션명</strong>
									<select>
										<option>선택옵션</option>
									</select>
									<br>
									<strong class = "itemName">옵션명</strong>
									<select class = "left1">
										<option>선택옵션</option>
									</select>						
								</div>
								<div>
									<span>{상품가격}원</span>
									<br>
									<span>{옵션가격}원</span>
									<br>
									<span>{옵션가격}원</span>					
							</div>						
						</td>
						<td>
							<strong>{수량}</strong>
							<span>개</span>					
						</td>
						<td>
							<span>상품가격+<br>옵션가격}<br>*(수량)원</span>
						</td>
						<td>
							<strong>{적립금}</strong><span>원</span>
						</td>
					</tr>
						<tr>
							<td>
								<span class = "number">1</span>
							</td>
							<td>
								<div id = "image">목록이미지</div>
							</td>
							<td id = "item">
								<div id = "itemOption">
									<strong id = "itemName">자수 실크 린넨 브라우스</strong>
									<br>
									<strong>색상: </strong>
									<select>
										<option>C형</option>
									</select>
									<br>
									<strong>디자인: </strong>
									<select class = "left2">
										<option>블랙</option>
									</select>						
								</div>
								<div>
									<strong>20,000원</strong>
									<br>
									<strong>-</strong>
									<br>
									<strong>2,000원</strong>					
							</div>						
						</td>
						<td>
							<strong>1개</strong>		
						</td>
						<td>
							<span>22,000원</span>
						</td>
						<td>
							<strong>220원</strong>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<br>
				<strong>&#124; 배송 정보</strong>
				<div class = "br"></div>
				<strong>주문자 정보</strong>	
				<form id = "buyerInfo" >
					<table>
						<tr>
							<td>
								<table id = "buyerInfo2">
									<tr>
										<td class = "buy1">이름</td>
										<td class = "buy2"><input type = "text"  name = "name" placeholder = "&nbsp;{주문자명}" /></td>
									</tr>
									<tr>
										<td class = "buy1">휴대폰 번호</td>
										<td class = "buy2 phone">
											<input type = "tel"  name = "phone1" />&#45;
											<input type = "tel"  name = "phone2" />&#45;
											<input type = "tel"  name = "phone3" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
	<strong>&#124; 수령자 정보</strong>
	<div class = "br"></div>
	<form id = "buyerInfo" >
		<table>
			<tr>
				<td>
					<table id = "buyerInfo2">
						<tr>
							<td class = "buy1">이름(회사명)</td>
							<td class = "buy2"><input type = "text"  name = "name" placeholder = "&nbsp;{받는 분 성함}" /></td>
						</tr>
						<tr>
							<td class = "buy1">주소</td>
							<td class = "buy2 address">
								<div>
									<input id = "address1" type = "text" name = "address1" placeholder = "{우편번호}"  /><button id = "address1Btn">우편번호 검색</button>
								</div>
								<div>
									<input id = "address2" type = "text" name = "address2" placeholder = "{주소}" />
									<input id = "address3" type = "text" name = "address3" placeholder = "{나머지 주소}"  />								
								</div>
							</td>
						</tr>
						<tr>
							<td class = "buy1">휴대폰 번호</td>
							<td class = "buy2 phone">
								<input type = "tel"  name = "phone1" />&#45;
								<input type = "tel"  name = "phone2" />&#45;
								<input type = "tel"  name = "phone3" />
							</td>
						</tr>
						<tr>
							<td class = "buy1">배송 요청사항</td>
							<td class = "buy2">
								<div>
									<input id = "deilveryRequest" type = "text" name = "deilveryRequest" placeholder = "{배송 요청 사항 표기}">						
								</div>
								<div class = "right">
									<span>0자 </span><b> /100자</b>	
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td id = "price">	
					<strong>&#124; 결제 정보</strong>
					<div id = "paymentWindow">
						<div class = "divtLeft">
							<strong>결제 방법 및 금액</strong>
							<table>
								<tr>
									<td>
										<strong>상품가격</strong>
									</td>
									<td>
										<strong>{상품가격 표기}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>포인트 사용</strong>
									</td>
									<td>
										<strong>{사용 포인트 표기}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>배송료</strong>
									</td>
									<td>
										<strong>{배송료 표기}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>총 결제 금액</strong>
									</td>
									<td>
										<strong>{합계 금액 표기}원</strong>
									</td>
								</tr>
								<tr>
									<td>
										<strong>결제 방법</strong>
									</td>
									<td>
										<strong>{신용카드,계좌이체}</strong>
									</td>
								</tr>
							</table>
						</div>
						<div class = "divRight">
							<strong>결제 로그</strong>
							<div class = "br"></div>
							<textarea name = "log" cols = "44" rows = "8">
결제요청 결과

결과 코드 : 0000(성공)

결과 내용 : 결제 성공

결제 방법 신용 카드
							</textarea>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<strong>&#124; 관리</strong>
					<div id = "manage">
						<div class = "divLeft">
							<strong>관리 이력</strong>
							<div class = "br"></div>
							<textarea name = "log" cols = "44" rows = "6">
- {배송 요청 사항 표기}
- 2023.08.16 10:10:35 주문
- 2023.08.16 10:10:35 결제완료로 수정
- 2023.08.16 10:10:35 배송 준비 중으로 수정
- 2023.08.18 10:10:35 배송 완료로 수정
							</textarea>		
						</div>
						<div class = "divRight">
							<strong>상담 메모</strong>
							<div class = "br"></div>
							<textarea name = "log" cols = "44" rows = "6">
							
							</textarea>		
						</div>				
					</div>			
				</td>
			</tr>
			<tr>
				<td>
					<div id = "submitDiv">
						<input type = "submit" value = "저장" />
						<button>취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	  	</div>		
		</div>
  	</div>

</body>
</html>