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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src = "<c:url value = "/js/NavigationBn.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="../bootstrapFileinput/dist/bs-custom-file-input.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/AdminCss.css" />">
<style>
	#AllContent strong{
		color:#727272;
	}
	.nav{
		margin-top:30px;
	}
	.nav a{
		color:#878787;
	}
	.nav .active a{
		color:#727272;
		font-weight:bold;
	}
	#eventType,#bannerTitle{
		margin-top:10px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#eventType input[type='radio']{
		margin-left:30px;
	}
	#eventType label{
		color:#878787;
	}
	#bannerTitle{
		margin-bottom:30px;
	}
	#bannerTitle > button{
		float:right;
		width:80px;
		height:25px;
		padding:0;
		border-radius:20px;
		position:relative;
		bottom:3px;
		color:#878787;
	}
	.bannerBody{
		color:#878787;
	}
	.bannerBody div > div:first-child{
		text-align:center;
	}
	.bannerBody #banner1{
		display:inline-block;
		width:80%;
		height:100px;
		border:1px solid #878787;;
	}
	.bannerBody div > div:first-child{
		height:100px;
		margin-bottom:20px;
	}
	.bannerBody div > div:last-child input[type='text']{
		display:inline-block;
		width:300px;
		height:20px;
	}
	.bannerBody div > div:last-child button{
		position:relative;
		bottom:2px;
		width:70px;
		height:20px;
		padding:0;
		font-size:12px;
		color:#878787;
		margin-left:5px;
	}
	i{
		margin-right:5px;
	}
	.bannerBody p > span{
		font-size:12px;
		width:100px;
		margin-right:5px;
	}
	.bannerBody p{
		position:relative;
		left:85px;
	}
	.bannerBody p:nth-child(2) input[type='text']{
		margin:0px 5px 0px 11px;
	}
	.bannerBody hr{
		margin:20px 0px 20px 0px;
	}
	#buttonBox{
		float:right;
	}
	.custom-file-label::after{
	    content: "찾아보기";
	}
	img{
		width:622px;
		height:98px;
	}
	label{
		font-size:12px;
	}
	input[type='radio']{
		margin-left:10px;
		position:relative;
		top:2px;
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
				<a href="banner" class = "activeMenu"><span>GNB</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/bannerheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Banner Managament</p>
				<p id = "currentIdx">&#124; 배너관리 > 메인</p>
			</div>
			<ul class = "nav nav-tabs">
				<li class = "active"><a href = "#home" data-toggle = "tab">상단 배너</a>
				<li><a data-toggle="tab" href = "#menu1">우측 배너</a>
				<li><a data-toggle="tab" href = "#menu2">좌측 배너</a>
				<li><a data-toggle="tab" href = "#menu3">하단 배너</a>
			</ul>
			<div id = "eventType">
				<strong>노출 방식</strong>
				<input type="radio" name="eventType" id="slide">
				<label for="slide">슬라이드</label>
				<input type="radio" name="eventType" id="random">
				<label for="random">랜덤</label>
				<input type="radio" name="eventType" id="unvisible">
				<label for="unvisible">노출되지 않음</label>				
			</div>
			<div id = "bannerTitle">
				<strong>등록된 배너</strong>
				<button class = "btn btn-default">배너 추가</button>
			</div>
			<div class = "bannerBody">

			</div>
			<div id = "buttonBox">
				<button class = "btn btn-default">선택 삭제</button>
				<button class = "btn btn-default">선택 수정</button>
			</div>
		</div>
	</div>
</div>

<script type=  "text/javascript">
$(document).ready(function () {
	  bsCustomFileInput.init()
	});


	$(function(){
	 	$.ajax({
			url:"getBanner",
			method:"post",
			data: {
				bnnLocation:"top"
			},
			success:function(list){
				for(var i = 0 ; i < list.length ; i++){
				var div1 = $("<div id = 'bannerDiv'></div>");
				div1.attr({
					"class":list[i].bnnImageUrl
				})
				var form = $("<form id = 'uploadForm' enctype = 'multipart/form-data'></form>")
				var div2 = $("<div id = 'bannerImage'></div>");
				var div3 = $("<div></div>");
				var imgDiv = $("<div id = 'banner1'></div>");
				var img = $("<img id = 'thumbnail'>")
				img.attr({
					"src":'..'+list[i].bnnImageUrl
				})
				imgDiv.append(img);
				var checkbox = $("<input type = 'checkbox' name = 'banner1' />");
				checkbox.attr({
					value:list[i].bnnNum
				})
				div2.append(checkbox);
				div2.append(imgDiv);
				
				var p1 = $("<p></p>");
				var p2 = $("<p></p>");
				var p3 = $("<p></p>");
				var p4 = $("<p></p>");
				p4.append($("<span>배너 이미지</span>"));
				p4.css('display','inline-block');
				p1.css({
					'display':'inline-block',
					'width':'500px'
				})
				p1.append($("<input id = 'getFile' type = 'file' class='custom-file-input' onchange = 'LoadImg(this)'>"));
				var label = $("<label class='custom-file-label' for='inputGroupFile01'>");
				label.text(list[i].bnnImageUrl);
				p1.append(label);		
				p2.append($("<span>링크 주소</span>"));
				var link = $("<input type = 'text' class = 'form-control' name = 'linkAddress' />");
				link.val(list[i].bnnLink);
				p2.append(link);
				var blank = $("<input type = 'radio' name = 'bannerLink' id = 'blank' />");
				var self = $("<input type = 'radio' name = 'bannerLink' id = 'self' />");
				if(list[i].bnnType == 'blank'){
					blank.prop("checked",true);
				}else{
					self.prop("checked",true);
				}
				console.log(list[i].bnnType);
				p2.append(blank);
				p2.append($("<label for = 'blank'>새 창(Blank)</label>"));
				p2.append(self);
				p2.append($("<label for = 'self'>본 창(Self)</label>"));
				
				p3.append($("<span>대체 텍스트</span>"));
				var altText = $("<input type = 'text' class = 'form-control' name = 'bannerAddress' />");
				altText.val(list[i].bnnAltText);
				p3.append(altText);
				p3.append($("<button type = 'button' class = 'btn btn-deafult' id = 'bannerModify' style='font-weight:bold'>수정하기</button>"));
				
				div3.append(p4);
				div3.append(p1);
				div3.append(p2);
				div3.append(p3);
				
				div1.append(div2);
				div1.append(div3);
				form.append(div1);
				$(".bannerBody").append(form);
				$(".bannerBody").append($("<hr>"));
				}
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
	});
	
function LoadImg(value){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$(value).parents("#bannerDiv").find("#thumbnail").attr('src',e.target.result);
			$(value).next().text(value.files[0].name);
		}
		reader.readAsDataURL(value.files[0]);
	}
};

$(document).on("click","#bannerModify",function(){
	var form = new FormData(document.getElementById('uploadForm'));
	console.log(form);
	$.ajax({
		url:"uploadBanner",
		data:form,
		dataType:'text',
		processData:false,
		contentType:false,
		type:'POST',
		success:function(data){
			console.log("성공");
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