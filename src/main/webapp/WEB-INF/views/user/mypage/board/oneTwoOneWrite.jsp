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
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
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
	#titleBar{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#titleBar input{
		width:648px;
		height:24px;
	}
	#textBox{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#buttonGroup{
		margin-top:30px;
		display:inline-block;
		width:780px;
		text-align:center;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../../header/mypageHeader.jsp" %>
		<div id="content">
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
							<a href = "cart"><span>> 장바구니</span></a>
							<a href = "pointLogs"><span>> 포인트 이용 내역</span></a>
						</div>
						<p>게시판 이용 내역</p>
						<hr>
						<div>
							<a href = "oneTwoOne" class = "activeMenu"><span>> 1:1 문의</span></a>
							<a href = "goodsReview"><span>> 나의 상품평</span></a>
							<a href = "goodsQuestion"><span>> 나의 상품 문의</span></a>
						</div>
						<p>개인정보 수정</p>
						<hr>
						<div>
						<a href = "personalData"><span>> 개인정보 수정</span></a>
						<a href = "passwordModify"><span>> 비밀번호 변경</span></a>
					</div>
					<a href = "unregister"><span>회원탈퇴</span></a>
					</div>
				</div>		
			</div>
			<div id = "tableDiv">
				<strong>&#124;&nbsp;1:1 문의</strong>
				<form id = "otoForm" action = "otoqAM" method = "post">
				<div id = "titleBar">
					<input type = "text" name = "otoqNum" value = "${otoqNum}"  style = 'display:none'/>
					<select name = "otocNum" id = "otoc">
						<option value = "0 ">질문 유형 선택</option>
						<c:forEach var = "otoc" items = "${otoc}">
						<option value = "${otoc.otocNum} ">${otoc.otocName}</option>
						</c:forEach> 
					</select>
					<input type = "text" name = "otoqTitle" placeholder = "제목을 입력해 주세요!"  value = "${otoqTitle}"/>
				</div>
				<div id = "textBox">
					<div>
						<textarea id = "WriteContent" name = "otoqContent" style="width:660px; height:375px;"></textarea>
					</div>
			</div>
			</form>
				<div id = "buttonGroup">
					<button id = "submit" type = "button" class = "btn btn-default">작성 완료</button>
					<button type = "button" class = "btn btn-default" onclick="location.href='01.html'">작성 취소</button>
				</div>
		</div>
	</div>
	</div>
	
<script type="text/javascript">
var otocNum = "${otocNum}"
var otoqContent = "${fn:trim(otoqContent)}"
    CKEDITOR.replace('WriteContent',{
            toolbar: 'Full',
            uiColor: '#F2F5F7',
            height: 400
        }
    );
    
    $(function(){
    	if(otoqContent != ""){
        	var option = $("#otoc option");
        	$.each(option,function(index,item){
        		if($(item).val().trim() == otocNum){
        			$(item).prop("selected",true);
        		}
        	})
        	CKEDITOR.instances.WriteContent.setData(otoqContent);    		
    	}
    })
    
	$("input[name='title']").keyup(function(){
		var content = $(this).val();
		if(content.length > 40){
			$("input[name='title']").val(content.substring(0,40));
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '40자 이내로 입력하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});		
		}
	})
	
	$("#submit").click(function(){
		var text = "";
		var otoc = $("#otoc").val();
		var otoqTitle = $("input[name='otoqTitle']").val();
		var otoqContent = CKEDITOR.instances.WriteContent.getData();
		if(otoc == 0){
			text = "질문 유형을 선택해주세요!"
		}else if(otoqTitle == ""){
			text = "제목을 입력하세요!"
		}else if(otoqContent == ""){
			text = "질문 내용을 입력하세요!"
		}
		if(text != ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: text,
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			 $("#otoForm").submit();
		}
	})
</script>
</body>
</html>