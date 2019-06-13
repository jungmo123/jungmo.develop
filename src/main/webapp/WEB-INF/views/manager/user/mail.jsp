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
	#mailInfo{
		width:400px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
		margin-bottom:10px;
	}
	#mailForm select{
		display:inline-block;
		width:160px;
		margin-right:20px;
	}
	#mailForm input{
		margin-left:10px;	
	}
	#mailTitle{
		width:400px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#mailTitle input{
		display:inline-block;
		width:340px;
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
	}
	#writeC ul{
		display:block;
		border-color:#878787;
	}
	#writeC ul .active{
		border-color:color:#878787;
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
	.tab-content{
		width:100%;
	}
	.tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	#buttonGroup{
		margin:25px;
		text-align:center;
	}
	#buttonGroup button{
		margin:5px;
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
				</span> <span>회원 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="userIdx"><span>회원 목록</span></a>
				<a href="leaveUserIdx"><span>탈퇴 회원 목록</span></a>
				<a href="mail" class = "activeMenu"><span>메일 관리</span></a>
				<a href="sms"><span>SMS 관리</span></a>
				<a href="bulkMailSending"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > 메일 관리</p>
			</div>
			<form>
				<div id = "mailForm">
					<div id = "mailInfo">
						<select id = "mailTypeSelect" class = "form-control">
							<option value = "회원 가입 완료 메일">회원 가입 완료 메일</option>
							<option value = "상품 주문 완료 메일">상품 주문 완료 메일</option>
							<option value = "상품 취소 완료 메일">상품 취소 완료 메일</option>
							<option value = "상품 배송 완료 메일">상품 배송 완료 메일</option>
							<option value = "회원 탈퇴 완료 메일">회원 탈퇴 완료 메일</option>
						</select>
						<strong>자동 발송 여부</strong>
						<input type="radio" name="mailSend" id="auto" class="custom-control-input" value = "예">
						<label class="custom-control-label" for="auto">예</label>
						<input type="radio" name="mailSend" id="hand" class="custom-control-input" value = "아니요">
						<label class="custom-control-label" for="hand">아니요</label>						
					</div>
					<div id = "mailTitle">
						<strong>제목</strong>
						<input class = "form-control" type = "text" name = "emailTitle" />
					</div>
					<div id = "mailContent">
						<div id = "write">
							<div id = "writeC">
								<div class="tab-content">
									<textarea id = "WriteContent" name = "WriteContent"></textarea>
								</div>
							</div>
							<div id = "buttonGroup">
								<button id = "submit" type = "button" class = "btn btn-default">작성 완료</button>
								<button class = "btn btn-default">작성 취소</button>
							</div>
						</div>					
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type = "text/javascript">
CKEDITOR.replace('WriteContent',{
    toolbar: 'Full',
    uiColor: '#F2F5F7',
    height:'330px'
}
);
CKEDITOR.config.language = 'ko';

$(function(){
		$.ajax({
			url:"getMailForm",
			method:"post",
			data: {
				mailType:"회원 가입 완료 메일",
			},
			success:function(list){
				$("input[name='mailSend']").val([list.automaticallySend]);
				$("input[name='emailTitle']").val(list.mailTitle);
				CKEDITOR.instances.WriteContent.setData(list.mailContent);
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
})

$("#mailTypeSelect").change(function(){
	var select = $(this).val();
 	$.ajax({
		url:"getMailForm",
		method:"post",
		data: {
			mailType:select
		},
		success:function(list){
			$("input[name='mailSend']").val([list.automaticallySend]);
			$("input[name='emailTitle']").val(list.mailTitle);
			CKEDITOR.instances.WriteContent.setData(list.mailContent);
		},
		error:function(a,b,errMsg){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '실패',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
	})
})

$("#submit").click(function(){
	var mailType = $("#mailTypeSelect").val();
	var auto = $("input[name='mailSend']").val();
	var mailTitle = $("input[name='emailTitle']").val();
	var mailContent = CKEDITOR.instances.WriteContent.getData();
 	$.ajax({
		url:"modifyMailForm",
		method:"post",
		data: {
			mailType:mailType,
			auto:auto,
			mailTitle:mailTitle,
			mailContent
		},
		success:function(list){
			Swal.fire({
				  position: 'top',
				  type: 'success',
				  title: '저장에 성공했습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		},
		error:function(a,b,errMsg){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '저장에 실패했습니다!0',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
	})
})

</script>

</body>
</html>