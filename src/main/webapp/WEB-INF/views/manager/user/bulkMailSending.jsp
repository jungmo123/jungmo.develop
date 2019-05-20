<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style>
	#mailForm{
		margin-top:20px;
	}
	#mailAddress{
		width:500px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
		margin-bottom:10px;
	}
	#mailAddress input{
		display:inline-block;
		width:300px;
		margin-left:10px;
	}
	#mailTitle{
		width:500px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#mailTitle input{
		display:inline-block;
		width:300px;
		margin-left:10px;
	}
	a{
		color:#878787;
	}
	#write{
		margin-top:20px;
		margin-left:10px;
	}
	.form-control{
		display:inline;
	}
	#writeT input[type="text"]{
		margin-left:20px;
		width:500px;
	}
	#writeC{
		margin-top:20px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#writeC ul{
		display:block;
		border-color:#878787;
	}
	#writeC ul .active{
		border-color:color:#878787;
	}
	#writeArea{
		border-top:0px;
		border-color:#878787;
		resize: none;
	}
	.nav-tabs > li.active > a,
	.nav-tabs > li.active > a:focus,
	.nav-tabs > li.active > a:hover{
		border-left:1px solid #878787;
		border-top:1px solid #878787;
		border-right:1px solid #878787;
	}
	.nav-tabs > li > a:hover{
	  background-color: white !important;
  	  border-radius: 5px 5px 0px 0px;
  	  border-left:1px solid white;
	  border-top:1px solid white;
	  border-right:1px solid white;
	  border-bottom:1px solid #878787;
      color:#000;
	} 
	textarea:focus {
		outline:none;
	}
	#buttonGroup{
		margin:25px;
		text-align:center;
	}
	#buttonGroup button{
		margin:5px;
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
	.aditorDiv{
		width:100%;
		height:40px;
		border-left:1px solid #878787;
		border-right:1px solid #878787;
		background-color:#F2F5F7;
		text-align:center;
		line-height:40px;
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
	#second div:last-child input{
		width:100px;
		margin-right:10px;
	}
	#second div:last-child{
		position:relative;
		left:17px;
	}
	#second div:first-child span{
		padding-right:18px;
	}
	#second label{
		padding-right:10px;
	}
	#third label,#third span{
		margin-right:20px;
	}
	#fourth{
		text-align:center;
	}
	#receive{
		margin-top:20px;
	}
	#searchBar{
		text-align:center;
		margin-top:10px;
	}
	input[type="text"]{
		display:inline;
		width:250px;
	}
	.container select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar .btn{
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
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	table tr th{
		background-color:#F2F5F7;
	}
	tbody tr:last-child td{
		border-bottom:1px solid #878787;
	}
	#second div:first-child select{
		width:35px !important;
		-webkit-appearance:none;
		text-align:center;
	}
	#receiveList{
		overflow:auto;
		max-height:300px;
	}
	#table tbody{
		width:100%;
		max-height:100px;
		overflow:auto;
	}
	tr td:nth-child(1),
	tr th:nth-child(1){
		width:53px;
	}
	tr td:nth-child(2),
	tr th:nth-child(2){
		width:110px;
	}
	tr td:nth-child(3),
	tr th:nth-child(3){
		width:85px;
	}
	tr td:nth-child(4),
	tr th:nth-child(4){
		width:76px;
	}
	tr td:nth-child(5),
	tr th:nth-child(5){
		width:85px;
	}
	tr td:nth-child(6),
	tr th:nth-child(6),
	tr td:nth-child(8),
	tr th:nth-child(8){
		width:70px;
	}
	tr td:nth-child(7),
	tr th:nth-child(7){
		width:116px;
	}
	tr td:nth-child(9),
	tr th:nth-child(9){
		width:127px;
	}
	.display-none{
		display:none;
	}
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.2); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	    z-index:999;
	}
    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
</style>
</head>
<body>
<div class = "wrap-loading display-none">
	<div><img id = "Img" src="<c:url value ="/IMAGE/Spin.gif" />"/></div>
</div>
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
				<a href="userIdx"><span>회원 목록</span></a>
				<a href="leaveUserIdx"><span>탈퇴 회원 목록</span></a>
				<a href="mail"><span>메일 관리</span></a>
				<a href="sms"><span>SMS 관리</span></a>
				<a href="bulkMailSending" class = "activeMenu"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > 대량 메일 발송</p>
			</div>
				<div id = "mailForm">
					<div id = "mailAddress">
						<strong>발송 메일 주소</strong>
						<input class = "form-control" type = "text" name = "emailAddress" value = "endia9858@gmail.com"/>
					</div>
					<div id = "mailTitle">
						<strong>제목</strong>
						<input class = "form-control" type = "text" name = "emailTitle" value = "스타일 숍 회원 가입을 축하드립니다.">
					</div>
					<div id = "mailContent">
						<div id = "write">
							<div id = "writeC">
								<div class="tab-content">
									<textarea name = "WriteContent" id = "WriteContent"></textarea>
								</div>
							</div>
						</div>					
					</div>
					<form id = "mailForm">
					<div id = "receive">
						<strong>수신대상</strong>
						<div id = "detailBox">
							<div id = "first">
								<div>
									<span>가입일</span>
									<div id = "input1">
										<input id = "date1" type="date" name="date1" class="dateInput">
									</div>
									<span>~</span>
									<div id = "input2">
										<input id = "date2" type="date" name="date2" class="dateInput">	
									</div>						
								</div>
								<div>
									<span>구매 금액</span>
									<input id = "minPrice" class = "form-control" type = "number" name = "minPrice" />원
									<span>&nbsp; ~ &nbsp;</span>
									<input id = "maxPrice" class = "form-control" type = "number" name = "maxPrice" />원
								</div>
							</div>
							<div id = "second">
								<div>
									<span>회원 등급</span>
									<select id = "userLevel" name = "userLevel" class = "form-control">
										<option value = "0">0</option>
										<option value = "1">1</option>
										<option value = "2">2</option>
										<option value = "3">3</option>
										<option value = "4">4</option>
									</select>									
								</div>
								<div>
									<span>적립금</span>
									<input id = "minSaved" class = "form-control" type = "number" name = "minSaved" />원
									<span>&nbsp; ~ &nbsp;</span>
									<input id = "maxSaved" class = "form-control" type = "number" name = "maxSaved" />원
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
								<button type = "button" id = "submit" class = "btn btn-default">검색</button>
							</div>
						</div>
					</div>
					</form>
					<div id = "receiveList">
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
									<th>메일</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>	
					</div>
				</div>
				<div id = "buttonGroup">
					<button id = "Search" type = "button" class = "btn btn-default">검색된 회원 모두 발송</button>
					<button id = "Select" class = "btn btn-default">선택 회원만 발송</button>
				</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	function numberWithCommas(n) {
	    var parts=n.toString().split(".");
	    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
	}
	
	
var userIdList = []
var getUsers = function(list){
	$("tbody").text("");
	userIdList = [];
	for(var i = 0 ; i < list.length ; i++){
		userIdList.push(list[i].userId);
		var tr = $("<tr></tr>");
		var td = $("<td></td>");
		var td1 = $("<td></td>");
		var td2 = $("<td></td>");
		var td3 = $("<td></td>");
		var td4 = $("<td></td>");
		var td5 = $("<td></td>");
		var td6 = $("<td></td>");
		var td7 = $("<td></td>");
		var td8 = $("<td></td>");
		var checkbox = $("<input></input>");
		var button = $("<button></button>")
		checkbox.attr({
			type:"checkbox",
			"class":list[i].userId
		});
		td.append(checkbox);
		tr.append(td);		
		td1.text(list[i].userJoinDate);
		tr.append(td1);	
		td2.text(list[i].userName);		
		tr.append(td2);
		td3.text(list[i].userId);
		tr.append(td3);
		td4.text(list[i].userLevel);
		tr.append(td4);
		td5.text(list[i].userVisitCnt);
		tr.append(td5);
		td6.text(numberWithCommas(list[i].purchaseAmount)+"원");
		tr.append(td6);
		td7.text(numberWithCommas(list[i].userHp)+"원");
		tr.append(td7);
		td8.text(list[i].userMailAgreement);
		tr.append(td8);
		$("tbody").append(tr);
	}				
}

CKEDITOR.replace('WriteContent',{
    toolbar: 'Full',
    uiColor: '#F2F5F7',
    height:'300px'
}
);
CKEDITOR.config.language = 'ko';

$("#submit").click(function(){
	var date1 = $("#date1").val();
	var date2 = $("#date2").val();
	var minPrice = $("#minPrice").val();
	var maxPrice = $("#maxPrice").val();
	var userLevel = $("#userLevel").val();
	var minSaved = $("#minSaved").val();
	var maxSaved = $("#maxSaved").val();
	var mailagreement = $("input[name='mail']:radio:checked").val();
	if(mailagreement === undefined){
		mailagreement = "";
	}
 	 $.ajax({   
		   type: "POST"  
		  ,url: "mailSearch"
		  ,data:{
			  date1:date1,
			  date2:date2,
			  minPrice:minPrice,
			  maxPrice:maxPrice,
			  userLevel:userLevel,
			  minSaved:minSaved,
			  maxSaved:maxSaved,
			  mailagreement:mailagreement
		  }
		  ,success:function(data){
		    getUsers(data);
		  }
		  ,beforeSend:function(){
		        $('.wrap-loading').removeClass('display-none');
		  }
		    ,complete:function(){
		        $('.wrap-loading').addClass('display-none');
		    }
		  ,error:function(data){
		    alert("error");
		  }
		  });
})

$("#Search").click(function(){
		if($("tbody tr").length == 0){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '검색결과가 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});			
		}else{
			var mailAddress = $("input[name=emailAddress]").val();
			var mailTitle = $("input[name=emailTitle]").val();
			var mailContent = CKEDITOR.instances.WriteContent.getData();
			jQuery.ajaxSettings.traditional = true;
			console.log(userIdList);
		 	 $.ajax({   
				   type: "POST"  
				  ,url: "SearchSend"
				  ,data:{
					  mailAddress:mailAddress,
					  mailTitle:mailTitle,
					  mailContent:mailContent,
					  userIdList:userIdList
				  }
				  ,success:function(data){
				   	console.log(data);
				  }
				  ,beforeSend:function(){
				        $('.wrap-loading').removeClass('display-none');
				  }
				    ,complete:function(){
				        $('.wrap-loading').addClass('display-none');
				    }
				  ,error:function(data){
				    alert("error");
				  }
				  });			
		}
})
</script>

</body>
</html>