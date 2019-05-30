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
<script src = "<c:url value = "/js/NavigationGa.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
	.inputDiv .btn{
		float:right;
	}
	.inputDiv label{
		margin-right:10px;
	}
	.add{
		float:right;
		margin:10px 0 10px 0
	}
	.inputDiv{
		margin-top:20px;
	}
	.inputBox textarea{
		width:780px;
		height:120px;
		resize:none;
		color:grey;
	}
	#buttonGroup{
		margin-top:50px;
		text-align:center;
	}
</style>
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
				</span> <span>상품 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="clause" class = "activeMenu"><span>약관</span></a> 
				<a href="goodsList"><span>정책</span></a> 
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/policyheader.jsp" %>
			<div id = "AllContent">
				<div id = "menuBar">
					<p id = "menuName">Policy Managament</p>
					<p id = "currentIdx">&#124; 기본 정책 관리> 약관</p>
				</div>
				<div id = "clauseDiv">
					<p>
						<button class = "btn btn-default add">약관 추가하기</button>
					</p>
				</div>
				<div id = "buttonGroup">
					<button class = "btn btn-default">저장</button>
					<button class = "btn btn-default">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<script type = "text/javascript">
	$(function(){
		$.ajax({
			url:"getClause",
			method:"post",
			success:function(data){
				$.each(data,function(index,item){
					console.log(item);
					var div1 = $("<div class = 'inputDiv'>");
					var div2 = $("<div class = 'inputBox'>");
					var form = $("<form id = 'registerForm' method='post'></form>");
					var input = $("<input type = 'number' name = 'clsNum' style='display:none'/>");
					input.val(item.clsNum);
					var input1 = $("<input class  ='form-control' type = 'text' name = 'title' />");
					input1.val(item.clsTitle);
					var textarea = $("<textarea name = 'clauseContent'></textarea>");
					textarea.val(item.clsContent);
					var radio1 = $("<input type = 'radio' id ='agree' value = '사용'>");
					var label1 = $("<label for  = 'agree'>사용함</label>");
					var radio2 = $("<input type = 'radio' id ='reject' value = '사용하지않음'>");
					var label2 = $("<label for  = 'reject'>사용하지 않음</label>");
					var radio3 = $("<input type = 'radio' id ='necessariness' value = '필수'>");
					var label3 = $("<label for  = 'necessariness'>필수 동의</label>");
					var button = $("<button type = 'button' class = 'btn btn-default delete'>삭제</button>");
					var name = "agree" + index;
					radio1.attr("name",name);
					radio2.attr("name",name);
					radio3.attr("name",name);
					if(item.clsUsage == '사용'){
						radio1.prop("checked",true);
					}else if(item.clsUsage == '사용하지않음'){
						radio2.prop("checked",true);
					}else if(item.clsUsage == '필수'){
						radio3.prop("checked",true);
					}
					form.append(input1);
					form.append(textarea);
					form.append(textarea);
					form.append(radio1);
					form.append(label1);
					form.append(radio2);
					form.append(label2);
					form.append(radio3);
					form.append(label3);
					form.append(button);
					form.append(input);
					div2.append(form);
					div1.append(div2);
					$("#clauseDiv").append(div1);
				})
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})		
	})
	$(document).on("click",".delete",function(){
		var clsNum = $(this).parents("#registerForm").find("input[type='number']").val();
		$.ajax({
			url:"deleteClause",
			data:{
				clsNum:clsNum	
			},
			method:"post",
			success:function(data){
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패하였습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	})
</script>

</body>
</html>