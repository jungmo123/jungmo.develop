<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("clauses",request.getAttribute("clauses"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>REGISTER</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
   .container{
      width:1000px;
   }
   #nav{
      display:inline-block;
      widht:150px;
      margin-top:30px;
      margin-right:30px;
      float:left;
   }
   #button{
   text-align:center;
   margin-bottom:30px;
   }
   
   .circle{
      width:80px;
      height:80px;
      border-radius:100%;
      border:1px solid #CCCCCC;
      text-align:center;
   }
   #circle1{
   background-color:lightgrey;
   }
   .circle span{
      position:relative;
      top:20px;
   }
   .icon{
      height:50px;
      text-align:center;
   }
   .glyphicon-menu-down{
      font-size:50px;
      color:#F2F5F7;
   }
   .agree{
      width:500px;
      height:80px;
      border:1px solid #878787;
   }
   
 #terms{
 	   width:800px;
       margin-top:30px;
       float:left;
 }
 #terms form textarea{
 	width:770px;
 	height:70px;
 	resize:none;
 }
	.modal-content{
		width:350px !important;
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
	.modal-body{
		height:110px;
	}
	.modal-body div:nth-child(2){
		display:inline-block;
		width:200px;
		height:60px;
		font-size:15px;
		float:left;
		position:relative;
		top:25px;
	}
	.modal-footer{
		text-align:center;
	}
	.modal-footer button{
		width:100px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
</head>

<body>
<div class  = "container">
      <div id = "nav">
         <div class = "circle" id = "circle1">
            <span>약관<br>동의</span>
         </div>
         <div class = "icon">
            <span class= "glyphicon glyphicon-menu-down"></span>
         </div>
         <div class = "circle" id = "circle2">
            <span>정보<br>입력</span>
         </div>
         <div class = "icon">
            <span class= "glyphicon glyphicon-menu-down"></span>
         </div>
         <div class = "circle" id = "circle3">
            <span>가입<br>완료</span>
         </div>
      </div>
 <div id="terms">
   <h4>|라라마켓 서비스 약관 동의</h4>
   <hr>
   		<form id = "registerForm" action = "register02" method = "post">
			<c:forEach var = "clause" items = "${clauses}" varStatus = "state">
				<div>
					<p>${clause.clsTitle}</p>
					<div>
					<textarea>${clause.clsContent}</textarea>
					</div>
					<input id = "${clause.clsNum}" type = "checkbox" name = "${clause.clsNum}" value = "동의">
					<label for = "${clause.clsNum}">
						<c:choose>
							<c:when test = "${clause.clsUsage=='필수'}">
								동의함(필수)
							</c:when>
							<c:when test = "${clause.clsUsage=='사용'}">
								동의함(선택)
							</c:when>					
						</c:choose>
					</label>
					</div>
			</c:forEach>
		<div>
		   <input type="checkbox" id ="check_all">
		   <label id = "check_all">모두 동의</label>
		   <br><br><br>
		   <div id="button">
		   <button class="btn btn-default" type = "submit"> 다음 </button>
		   <button class="btn btn-default"> 취소 </button>
		   </div>		
		</div>
   </form>
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
						<p id = "modal-text"></p>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">확인</button>
				</div>
			</div>
		</div>
	</div>

<script type = "text/javascript">
	$("#check_all").click(function(){	
		if($(this).prop("checked")){
			$("#registerForm").find("input").prop("checked",true);
		}else{
			$("#registerForm").find("input").prop("checked",false);
		}
	})
	
	$("#registerForm").submit(function(e){
		var label = $(this).find("label");
		$.each(label,function(index,item){
			if($(item).text().trim() == '동의함(필수)'){
				if($(item).prev().prop("checked") == true){
					console.log("선택")
				}else{
					$("#Alert .modal-title").text("Alert");
					$("#Alert #modal-text").text($(item).siblings('p').text() + "에 동의해 주세요!");
					$("#Alert").modal();
					e.preventDefault();
				}
			}
		})

	})
</script>

</body>
</html>