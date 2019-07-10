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
<script src = "<c:url value = "/js/jQueryRotateCompressed.js" />"></script>
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
	.dropdown-toggle::after{
		display:none;
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
	.custom-file-label::after{
	    content: "찾아보기";
	}
	#thumbnailX{
		width:622px;
		height:98px;
	}
	#thumbnailY{
		width:98px;
		height:622px;
		position: relative;
		bottom: 262px;
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
				</span> <span>배너 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="banner" class = "activeMenu"><span>메인</span></a>
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
				<li id = "top" class = "active"><a href = "#home" data-toggle = "tab">상단 배너</a>
				<li id = "right"><a data-toggle="tab" href = "#menu1">우측 배너</a>
				<li id = "left"><a data-toggle="tab" href = "#menu2">좌측 배너</a>
				<li id = "main"><a data-toggle="tab" href = "#menu3">메인 배너</a>
			</ul>
			<div id = "bannerTitle">
				<strong>등록된 배너</strong>
				<button class = "btn btn-default">배너 추가</button>
			</div>
			<div class = "bannerBody">

			</div>
		</div>
	</div>
</div>

<script type=  "text/javascript">
$(document).ready(function () {
	  bsCustomFileInput.init()
	});

function getBanner(bnnLocation){
 	$.ajax({
		url:"getBanner",
		method:"post",
		data: {
			bnnLocation:bnnLocation
		},
		success:function(list){
			$(".bannerBody").text("");
			for(var i = 0 ; i < list.length ; i++){
			var div1 = $("<div id = 'bannerDiv'></div>");
			div1.attr({
				"class":list[i].bnnImageUrl
			})
			var form = $("<form id = 'uploadForm' enctype = 'multipart/form-data'></form>")
			var div2 = $("<div id = 'bannerImage'></div>");
			var div3 = $("<div></div>");
			var imgDiv = $("<div id = 'banner1'></div>");
			if(bnnLocation == 'top' || bnnLocation == 'main'){
				var imgX = $("<img id = 'thumbnailX'>")
				imgX.attr({
					"src":'../upload/'+list[i].bnnImageUrl
				})
				imgDiv.append(imgX);
			}else{
				var imgY = $("<img id = 'thumbnailY'>")
				imgY.attr({
					"src":'../upload/'+list[i].bnnImageUrl
				})
				$(imgY).rotate(-90);
				imgDiv.append(imgY);
			}
			div2.append(imgDiv);
			
			var p1 = $("<p id = 'imageUrl'></p>");
			var p2 = $("<p></p>");
			var p3 = $("<p></p>");
			var p4 = $("<p></p>");
			var p5 = $("<p></p>");
			p4.append($("<span>배너 이미지</span>"));
			p4.css('display','inline-block');
			p1.css({
				'display':'inline-block',
				'width':'500px'
			})
			p1.append($("<input id = 'getFile' type = 'file' name = 'file' class='custom-file-input' onchange = 'LoadImg(this)'>"));
			var origin = $("<input type = 'text' name = 'original' style='display:none'>");
			origin.val(list[i].bnnImageUrl);
			p1.append(origin);
			var bnnNum = $("<input type = 'number' name = 'bnnNum' style='display:none'>");
			bnnNum.val(list[i].bnnNum);
			p1.append(bnnNum);
			var label = $("<label class='custom-file-label' for='inputGroupFile01'>");
			label.text(list[i].bnnImageUrl);
			p1.append(label);		
			p2.append($("<span>링크 주소</span>"));
			var link = $("<input type = 'text' class = 'form-control' name = 'linkAddress' />");
			link.val(list[i].bnnLink);
			p2.append(link);
			var blank = $("<input type = 'radio' name = 'bannerLink' value = 'blank' />");
			var self = $("<input type = 'radio' name = 'bannerLink' value = 'self' />");
			if(list[i].bnnType == 'blank'){
				blank.prop("checked",true);
			}else{
				self.prop("checked",true);
			}
			p2.append(blank);
			p2.append($("<label for = 'blank'>새 창(Blank)</label>"));
			p2.append(self);
			p2.append($("<label for = 'self'>본 창(Self)</label>"));
			
			p5.append($("<span>배너 설명</span>"));
			var explainment = $("<input type = 'text' class = 'form-control' name = 'bannerExplainment' />");
			explainment.val(list[i].bnnExplainment);
			p5.append(explainment);
			p5.append($("<button type = 'button' class = 'btn btn-deafult' id = 'bannerModify' style='font-weight:bold'>수정하기</button>"));
			p5.append($("<button type = 'button' class = 'btn btn-deafult' id = 'bannerDelete' style='font-weight:bold'>삭제하기</button>"));
			
			p3.append($("<span>노출 여부</span>"));
			var visible = $("<input type='radio' name='eventType' id='visible' value = 'visible'>");
			var unvisible = $("<input type='radio' name='eventType' id='unvisible' value = 'unvisible'>'");
			if(list[i].bnnDisplayType == 'visible'){
				visible.prop("checked",true);
			}else{
				unvisible.prop("checked",true);
			}
			p3.append(visible);
			p3.append("<label for='visible'>노출</label>")
			p3.append(unvisible);
			p3.append("<label for='unvisible'>노출되지 않음</label>")
			
			div3.append(p4);
			div3.append(p1);
			div3.append(p2);
			div3.append(p3);
			div3.append(p5);
			
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
}

	$(function(){
		getBanner('top');
	});
	
function LoadImg(value){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			var bnnLocation = $(".nav-tabs > .active").prop("id");
			if(bnnLocation == 'top' || bnnLocation == 'main'){
				$(value).parents("#bannerDiv").find("#thumbnailX").attr('src',e.target.result);
			}else{
				$(value).parents("#bannerDiv").find("#thumbnailY").attr('src',e.target.result);
			}
			$(value).siblings("label").text(value.files[0].name);
		}
		reader.readAsDataURL(value.files[0]);
	}
};

$(document).on("click","#bannerModify",function(){
	var form = new FormData($(this).parents("#uploadForm")[0]);
	var linkAddress = $(this).parents("#uploadForm").find("input[name='linkAddress']").val();
	var bannerExplainment = $(this).parents("#uploadForm").find("input[name='bannerExplainment']").val();
	if(linkAddress == "" || bannerExplainment == ""){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '모든 값을 입력해주세요!.',
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}
	$.ajax({
		url:"modifyBanner",
		data:form,
		dataType:'text',
		processData:false,
		contentType:false,
		type:'POST',
		success:function(data){
			Swal.fire({
				  position: 'top',
				  type: 'success',
				  title: '수정 되었습니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
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

$(document).on("click","#bannerAdd",function(){
	var formData = new FormData($(this).parents("#uploadForm")[0]);
	var form = $(this).parents("#uploadForm").find("#imageUrl");
	var linkAddress = $(this).parents("#uploadForm").find("input[name='linkAddress']").val();
	var bannerExplainment = $(this).parents("#uploadForm").find("input[name='bannerExplainment']").val();
	if(linkAddress == "" || bannerExplainment == ""){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '모든 값을 입력해주세요!.',
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}
	var saveButton = $(this);
	var deleteButton = $(this).next();
	$.ajax({
		url:"addBanner",
		data:formData,
		processData:false,
		contentType:false,
		type:'POST',
		success:function(data){
			Swal.fire({
				  position: 'top',
				  type: 'success',
				  title: '저장되었습니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
			saveButton.text("수정하기");
			saveButton.attr({
				"id":"bannerModify"
			})
			deleteButton.attr({
				"id":"bannerDelete"
			})
			var origin = $("<input type = 'text' name = 'original' style='display:none'>");
			origin.val(data.bnnImageUrl);
			form.append(origin);
			var bnnNum = $("<input type = 'number' name = 'bnnNum' style='display:none'>");
			bnnNum.val(data.bnnNum);
			form.append(bnnNum);
		},
		error:function(a,b,errMsg){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '모든 값을 입력해주세요!.',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
	})
})

$(".nav-tabs > li").click(function(){
	var bnnLocation = $(this).prop("id");
	getBanner(bnnLocation);
})

$(document).on("click","#Delete",function(){
	var form = $(this).parents("#uploadForm");
	var hr = $(form).next();
	$(hr).remove();
	$(form).remove();
})

$(document).on("click","#bannerDelete",function(){
	var bnnNum =  $(this).parents("#uploadForm").find("#imageUrl").find("input[name='bnnNum']").val();
	var bnnImageUrl =  $(this).parents("#uploadForm").find("#imageUrl").find("input[name='original']").val();
	var form = $(this).parents("#uploadForm");
	var hr = $(form).next();
	Swal.fire({
		  title: '삭제하시겠습니까?',
		  type: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '네',
		  cancelButtonText: '아니요'
		}).then((result) => {
		  if (result.value) {
 				$.ajax({
					url:"deleteBanner",
					data:{
						bnnNum:bnnNum,
						bnnImageUrl:bnnImageUrl
					},
					type:'post',
					success:function(data){
						$(hr).remove();
						$(form).remove();
						Swal.fire({
							  position: 'top',
							  type: 'success',
							  title: '삭제되었습니다.',
							  showConfirmButton: false,
							  timer: 1500
							});
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
		  }
	});

})
</script>

</body>
</html>