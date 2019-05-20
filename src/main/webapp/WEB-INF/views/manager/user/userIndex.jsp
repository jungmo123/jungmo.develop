<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/AdminCss.css" />">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>
	#searchBar{
		text-align:center;
		margin:10px 0px 20px 0px;
	}
	#searchBar input[type="text"]{
		display:inline;
		width:350px;
	}
	#searchBar select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar button{
		width:100px;
		position:relative;
		bottom:2px;
	}
	#detailOpen,
	#detailClose{
		width:120px !important;
	}
	#detailBox{
		margin:20px 0px 20px 0px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
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
	#first div:first-child,
	#first div:last-child,
	#second div:first-child,
	#second div:last-child{
		display:inline-block;
		width:350px;
	}
	#first div:nth-child(2) input{
		display:inline-block;
		margin-right:10px;
		width:100px;
	}
	#first,#second,#third{
		margin:10px;
	}
	#second div .form-control{
		display:inline-block;
	}
	#second div:first-child select{
		width:35px;
		-webkit-appearance:none;
		text-align:center;
	}
	#second div:last-child input{
		width:100px;
		margin-right:10px;
	}
	#second div:last-child{
		position:relative;
		left:17px;
	}
	#third label,#third span{
		margin-right:20px;
	}
	#fourth{
		text-align:center;
	}
	#lank{
		text-align:center;
	}
	#lank i{
		margin-right:5px;
	}
	#searchNumber{
		float:right;
		margin:30px 0px 10px 0px;
	}
	#searchNumber select{
		display:inline-block;
		width:140px;
		margin-left:10px;
		position:relative;
		top:1px;		
	}
	#searchNumber .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	table tr th,
	table tr td{
		text-align:center;
	}
	#table tr{
		cursor:pointer;
	}
	#table button{
		width:50px;
		height:20px;
		padding:0;
		position:relative;
		left:20px;
	}
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	table tr{
		border:1px solid #F2F5F7;
	}
	table tr th{
		background-color:#F2F5F7;
	}
	tbody tr:last-child{
		border-bottom:1px solid #878787;
	}
	tr td:nth-child(1){
		width:53px;
	}
	tr td:nth-child(2){
		width:110px;
	}
	tr td:nth-child(3){
		width:69px;
	}
	tr td:nth-child(4){
		width:76px;
	}
	tr td:nth-child(5){
		width:85px;
	}
	tr td:nth-child(6),
	tr td:nth-child(8){
		width:70px;
	}
	tr td:nth-child(7){
		width:116px;
	}
	tr td:nth-child(9){
		width:127px;
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
	.none{
		display:none;
	}
	#givePoint .modal-content{
		width:300px;
	}
	#Reason{
		display:inline-block;
		width:200px;
	}
	#gp{
		display:inline-block;
		width:100px;		
	}
	#closeButton{
		text-align:center;
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
		<div id="title">
			<div id="logo">
				<a href="main"><span>LALA&nbsp;</span>MARKET</a>
				<div id="Admin">
					<h5>Administrator</h5>
				</div>
			</div>
			<div>
				<span> <i class="far fa-edit"></i>
				</span> <span>게시판 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="userIdx" class = "activeMenu"><span>회원 목록</span></a>
				<a href="leaveUserIdx"><span>탈퇴 회원 목록</span></a>
				<a href="mail"><span>메일 관리</span></a>
				<a href="sms"><span>SMS 관리</span></a>
				<a href="bulkMailSending"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > 회원 목록</p>
				<hr>
			</div>
			<div id = "searchBox">
				<form action = "userIdxSearch1" method = "post">
				<div id = "searchBar">
						<select name = "SearchBar" class = "form-control">
							<option value = "1">이름</option>
						</select>
						<input type = "text" class = "form-control" name = "title" />
						<button type = "submit" class = "btn btn-default">검색</button>
					<button type = "button" id = "detailOpen" class = "btn btn-default">상세 검색 열기<span class = "glyphicon glyphicon-triangle-bottom"></span></button>
				</div>
				<hr>
				<div id = "detailBox" class = "none">
					<div id = "first">
						<div>
							<span>가입일</span>
							<div id = "input1">
								<input type="date" name="sdate" class="dateInput">
							</div>
							<span>~</span>
							<div id = "input2">
								<input type="date" name="edate" class="dateInput">	
							</div>						
						</div>
						<div>
							<span>구매 금액</span>
							<input class = "form-control" type = "number" name = "minPrice" />원
							<span>&nbsp; ~ &nbsp;</span>
							<input class = "form-control" type = "number" name = "maxPrice" />원
						</div>
					</div>
					<div id = "second">
						<div>
							<span>회원 등급</span>
							<select name = "userLevel" class = "form-control">
								<option value = "0">0</option>
								<option value = "1">1</option>
								<option value = "2">2</option>
								<option value = "3">3</option>
								<option value = "4">4</option>
							</select>
						</div>
						<div>
							<span>적립금</span>
							<input class = "form-control" type = "number" name = "minSaved" />원
							<span>&nbsp; ~ &nbsp;</span>
							<input class = "form-control" type = "number" name = "maxSaved" />원
						</div>
					</div>
					<div id = "third">
						<div>
							<div class="custom-control custom-radio">
								<span>메일 수신</span>
								<input type="radio" name="mail" id="mailAgree" class="custom-control-input" value = "수신">
								<label class="custom-control-label" for="mail">수신</label>
								<input type="radio" name="mail" id="mailReject" class="custom-control-input" value = "거부">
								<label class="custom-control-label" for="mailReject">거부</label>
							</div>
						</div>
					</div>
					<div id = "fourth">
						<button class = "btn btn-default">상세 검색</button>
					</div>
				</div>
				<div id = "lank">
					<strong><i class="fas fa-asterisk"></i>회원 등급: 1.회원, 2. 고객센터, 3. 운영팀, 4. 사업팀</strong>
				</div>
				</form>
			</div>
			<div id = "searchNumber">
				<span>${cnt} 건의 검색 결과가 있습니다.</span>
			</div>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>가입일</th>
							<th>이름</th>
							<th>아이디</th>
							<th>회원등급</th>
							<th>방문수</th>
							<th>구매 금액</th>
							<th>적립금</th>
							<th>메일 수신 여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "post" items = "${posts}" varStatus = "state">
							<tr id = "${post.userId}">
								<td><input type = "checkbox"  id = "${post.userId}" class = "check" /></td>
								<td>${post.userJoinDate}</td>
								<td>${post.userName}</td>
								<td>${post.userId}</td>
								<td>${post.userLevel}</td>
								<td>${post.userVisitCnt}</td>
								<td><fmt:formatNumber value="${post.purchaseAmount}" pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${post.userHp}" pattern="#,###" />원</td>
								<td>${post.userMailAgreement}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id = "leave" class = "btn btn-default">선택 탈퇴</button>
				<button id = "checkP" class = "btn btn-default" data-toggle = "modal" data-target = "#givePoint">선택 회원 포인트 지급</button>
				<button id = "SearchP" class = "btn btn-default" data-toggle = "modal" data-target = "#givePoint">검색된 회원 포인트 지급</button>
			</div>
			 <div id = "pagination">
				<div>
					<ul class = "pagination">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "userIdx${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
										
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "userIdx${type}${idx}">${idx}</a>
								</li>
							</c:forEach>
				
							<c:if test = "${pageMaker.next}">
								<li><a href = "userIdx${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
</div>

	<div class = "modal fade" id ="givePoint">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;포인트 지급</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div id = "loginLog">
						<form id = "pointForm" method ="post">
							<input id = "checkPoint" name = "checkPoint" type = "text" style="display:none"/>
							<p>지급 사유 : <input id = "Reason" type = "text" class = "form-control" name = "reason"></p>
							<p>지급할 포인트 : <input id = "gp" type = "number" class = "form-control" name = "point"></p>
						</form>
					</div>
					<div id = "closeButton">
						<button id = "submit" class = "btn btn-default">완료</button>
						<button class = "btn btn-default" data-dismiss = "modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type = "text/javascript">
	$(document).on("click","#detailOpen",function(event){
		$(this).text("상세 검색 닫기");
		var span = $("<span></span>");
		span.attr({
			"class":"glyphicon glyphicon-triangle-top"
		})
		$(this).append(span);
		$(this).attr({
			"id":"detailClose"
		})
		$("#detailBox").removeClass("none");
	})
	
$(document).on("click","#detailClose",function(event){
		$(this).text("상세 검색 열기");
		var span = $("<span></span>");
		span.attr({
			"class":"glyphicon glyphicon-triangle-bottom"
		})
		$(this).append(span);
		$(this).attr({
			"id":"detailOpen"
		})
		$("#detailBox").addClass("none");
	})
	
	$("#leave").click(function(){
		var input = $(".check:checked");
		var list = [];
		$.each(input,function(index,item){
			list[index] = $(item).prop("id");
		})
		var form = $("<form></form>");
		form.attr({
			action:"userStateChange",
			method:"post",
			style:"display:none"
		})
		var $input = $("<input></input>");
		$input.attr({
			type:"text",
			name:"list"
		})
		$input.val(list);
		form.append($input);
		$("body").append(form);
		form.submit();
	})
	
	$("td").not('td:nth-child(1)').click(function(){
		var userId = $(this).parents("tr").prop("id");
		location.href = "/shoppingmall/admin/userInfo" + userId;
	})
	
	$("#checkP").click(function(){
		var list = [];
		var checkbox = $("tbody input:checked");
		$.each(checkbox,function(index,item){
			list.push($(item).prop("id"));
		})
		$("#checkPoint").val(list);
		$("#pointForm").attr({
			action:"checkPoint"
		})
	})
	
	$("#SearchP").click(function(){
		$("#pointForm").attr({
			action:"SearchPoint"
		})		
	})
	
	$("#submit").click(function(){
		if($("tbody input:checked").length == 0){
			if($("#pointForm").attr("action")=='checkPoint'){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: "포인트를 지급할 사용자를 선택하세요!",
					  showConfirmButton: false,
					  timer: 1500
					});	
			}else if($("#Reason").val() == ''){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: "지급 사유를 입력하세요!",
					  showConfirmButton: false,
					  timer: 1500
					});					
			}else if($("#gp").val() == ''){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: "지급할 포인트를 입력하세요!",
					  showConfirmButton: false,
					  timer: 1500
					});				
			}else{
				$("#pointForm").submit();	
			}
		}
	})
	
$("#gp").change(function() { 
    var num = $(this).val() - 1; 
    if(typeof num !== "number" || num < 0) { 
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: "양수만 입력해주세요!",
			  showConfirmButton: false,
			  timer: 1500
			});	
		$(this).val("");
        $(this).focus(); 
        return false; 
    } 
}); 
</script>

</body>
</html>