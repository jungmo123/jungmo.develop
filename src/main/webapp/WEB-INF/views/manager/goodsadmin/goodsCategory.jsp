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
<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script src = "https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<style>
	#AllContent{
		position:relative;
		height:620px;
	}
	#categoryBox{
		display:inline-block;
		width:150px;
		height:400px;
		text-align:center;
	}
	#categoryBox div{
		margin-top:10px;
		width:140px;
		height:150px;
		padding:10px;
		border:1px solid black;
		position:relative;
		left:5px;
	}
	#categoryBox div a{
		color:#727272;
	}
	#categoryTable{
		display:inline-block;
		width:620px;
		height:200px;
		padding:10px;
		float:right;
	}
	#categoryTable tr td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
	}
	#categoryTable tr td:nth-child(1){
		width:120px;
		height:40px;
		border-right:1px solid grey;
		text-align:right;
		background-color:#F2F5F7;
	}
	#categoryTable tr td:nth-child(1) span{
		margin-right:10px;
		font-weight:bold;
	}
	#categoryTable tr td:nth-child(2) span{
		font-size:12px;
		color:#878787;
	}
	#categoryTable tr td:nth-child(2){
		padding-left:10px;
	}
	#categoryTable tr:nth-child(2) td:nth-child(2),
	#categoryTable select,#categoryTable label{
		padding-top:5px;
	}
	#categoryTable label{
		margin-right:10px;
	}
	#categoryTable button{
		width:80px;
		height:27px;
		padding:0;
		position:relative;
		bottom:2px;
	}
	#buttonGroup{
		margin-top:20px;
	    position: relative;
	    left: 10px;
	}
	.modal-content{
		width:400px !important;
	}
	#iconInfo{
		display:inline-block;
		margin:10px;
	}
	#iconInfo i{
		font-size:50px;
	}
	.modal-body div:nth-child(2){
		display:inline-block;
		position:relative;
		bottom:15px;
	}
	.modal-footer{
		text-align:center;
	}
	.modal-footer button{
		width:100px;
	}
	.none{
		display:none !important;
	}
	#categoryOne{
		overflow: auto;
	}
	#categoryOne span{
		cursor:pointer;
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
				</span> <span>상품 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="goodsRegister"><span>상품 등록</span></a> 
				<a href="goodsList"><span>상품 목록</span></a> 
				<a href="categoryManagement" class = "activeMenu"><span>카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/goodsadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Product Managament</p>
				<p id = "currentIdx">&#124; 상품 관리 > 카테고리 관리</p>
				<hr>
			</div>
			<div id = "categoryBox">
				<button class = "btn btn-default">카테고리 생성</button>
				<div id = "categoryOne">
					<c:forEach var = "category" items = "${categories}">
					<p>
						<span class = "godcName">${category.godcName}</span>
						<span class = "godcNum" style="display:none">${category.godcNum}</span>
						<span class = "godcDisplay"  style="display:none">${category.godcViewState}</span>
					</p>
					</c:forEach>
				</div>
			</div>
			<div id = "categoryTable" class = "none">
				<form id = "registerForm">
				<table>
					<tr>
						<td>
							<span>카테고리명</span>
						</td>
						<td>
							<input type = "text" name = "categoryName" />
							<span>특수문자 입력 불가</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>카테고리 코드</span>
						</td>
						<td>
							<input type = "number" name = "categoryNum" placeholder = "수정시 자동입력"  readonly/>
						</td>
					</tr>
					<tr>
						<td>
							<span>카테고리 노출</span>
						</td>
						<td>
							<input type = "radio" name = "show" value = "visible">
							<label for  = "visible">노출</label>
							<input type = "radio" name = "show" value = "hide">
							<label for  = "hide">숨김</label>
						</td>
					</tr>
				</table>
				</form>
				<div id = "buttonGroup">
					<button id = "create" class = "btn btn-default">생성</button>
					<button id = "modify" class = "btn btn-default">수정</button>
					<button id = "cancel" class = "btn btn-default">취소</button>
					<button id = "delete" class = "btn btn-default">삭제</button>
					<button id  = "remove" class = "btn btn-default">지우기</button>
				</div>
			</div>
			<div id = "information">
				<p>
					<strong>카테고리 등록/수정 안내</strong>
				</p>
				<p>
					<strong>[카테고리 생성]</strong>
					<span>왼쪽 상단의 '카테고리 생성' 버튼을 클릭하시면 카테고리명,카테고리 노출 여부를 설정 한 후 생성버튼을 클릭하세요.</span>
				</p>
				<p>
					<strong>[카테고리 수정]</strong>
					<span>수정하려는 카테고리 선택 시 카테고리명,카테고리 노출 여부를 수정 한 후 수정 버튼을 클릭하세요.</span>
				</p>
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id  ="deleteInfo">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">Comfirm 9-1</h4>
				</div>
				<div class = "modal-body">
					<div id = "iconInfo">
						<i class="fas fa-info-circle"></i>
					</div>
					<div>
						<p>카테고리를 삭제하겠습니까?</p>
					</div>
				</div>
				<div class ="modal-footer">
					<button id = "ok" type = "button" class = "btn btn-default" data-dismiss = "modal">예</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	$("#categoryOne span").click(function(){
		var godcName = $(this).text();
		var godcNum = $(this).next().text();
		var godcDisplay = $(this).next().next().text();
		$("input[name='categoryName']").val(godcName);
		$("input[name='categoryNum']").val(godcNum);
		var displayType = $("input[name='show']");
		$.each(displayType,function(index,item){
			if($(item).val() == godcDisplay){
				$(item).prop("checked",true);
			}
		})
	})
	
	$("#remove").click(function(){
		$("input[name='categoryName']").val("");
		$("input[name='categoryNum']").val("");
		var displayType = $("input[name='show']").attr("checked",false);
	})
	
	$("#create").click(function(){
		var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		var obj = document.getElementsByName('categoryName')[0];
		var displayType = $("input[name='show']:checked");
		if(RegExp.test(obj.value)){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '특수문자는 입력 할 수 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}else if(obj.value == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '카테고리명을 입력하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}else if(displayType.length == 0){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: ' 노출 여부를 선택하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;			
		}else{
			var formData = new FormData($("#registerForm")[0]);
			$.ajax({
				url:"createCategory",
				data: formData,
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					location.href = "/shoppingmall/admin/categoryManagement";
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
	})
	
	$("#modify").click(function(){
		var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		var obj = document.getElementsByName('categoryName')[0];
		var displayType = $("input[name='show']:checked");
		var categoryNum = $("input[name='categoryNum']").val();
		if(categoryNum == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '수정할 카테고리를 선택해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;	
		}else if(RegExp.test(obj.value)){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '특수문자는 입력 할 수 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}else if(obj.value == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '카테고리명을 입력하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}else if(displayType.length == 0){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: ' 노출 여부를 선택하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;			
		}else{
			var formData = new FormData($("#registerForm")[0]);
			$.ajax({
				url:"modifyCategory",
				data: formData,
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					if(data != ""){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '중복된 카테고리명 입니다.',
							  showConfirmButton: false,
							  timer: 1500
							});						
					}else{
						location.href = "/shoppingmall/admin/categoryManagement";
					}
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
	})
	
	$("#cancel").click(function(){
		Swal.fire({
			  title: '설정을 취소하시겠습니까?',
			  type: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.value) {
				window.location.href = "/shoppingmall/admin/main";
			  }
			})
	})
	
	$("#delete").click(function(){
		var categoryNum = $("input[name='categoryNum']").val();
		if(categoryNum == ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '수정할 카테고리를 선택해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;	
		}else{
			$("#deleteInfo").modal();
		}		
	})
	
	$("#ok").click(function(){
		var categoryNum = $("input[name='categoryNum']").val();
		console.log(categoryNum);
		$.ajax({
			url:"deleteCategory",
			data:{
				categoryNum:categoryNum
			},
			method:"post",
			success:function(data){
				location.href = "/shoppingmall/admin/categoryManagement";
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