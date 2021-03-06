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
	body{
		color:#878787;
	}
	#stateInfo{
		margin-top:10px;
	}
	#stateInfo select{
		margin-left:33px;
	}
	#stateInfo input{
		width:200px;
	}
	#apply table{
		margin-top:10px;
		width:800px;
	}
	#apply table td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	#firstTable tr td:nth-child(1){
		color:#727272;
	}
	#firstTable tr:first-child td:nth-child(2) input,
	#firstTable tr:first-child td:nth-child(4) input{
		width:100px;
	}
	#firstTable tr td:nth-child(6) input{
		width:50px;
	}
	#firstTable tr td:nth-child(1),
	#firstTable tr td:nth-child(3){
		width:120px;
		background-color:#F2F5F7;
	}
	#firstTable tr td:nth-child(2),
	#firstTable tr td:nth-child(4){
		width:140px;
	}
	#firstTable tr td:nth-child(5){
		width:140px;
		background-color:#F2F5F7;
	}
	#firstTable tr td:nth-child(6){
		width:100px;
	}
	#firstTable tr td{
		text-align:center;
	}
	#firstTable tr:first-child td input{
		margin-right:10px;
	}
	#firstTable tr:nth-child(2) td p,
	#firstTable tr:nth-child(3) td p{
		margin:10px 0px 10px 0px;
	}
	#firstTable tr:nth-child(2) td input[type='radio'],
	#firstTable tr:nth-child(3) td input[type='radio']{
		margin-left:30px;
	}
	#firstTable tr:nth-child(2) td input[type='number']{
		width:100px;
		margin-right:5px;
	}
	#firstTable tr:nth-child(3) td input[type='number']{
		width:70px;
		margin-right:5px;
	}
	#productIntroduce #introduceTitle,
	#introduceContent,
	#productDetailInfo,
	#DeliveryDiv{
		margin-top:20px;
	}
	#productIntroduce #secondTable{
		width:800px;
		color:#878787;
	}
	#productIntroduce #secondTable tr td{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		height:50px;
	}
	#productIntroduce #secondTable tr td:first-child{
		width:150px;
		background-color:#F2F5F7;
		border-right:1px solid grey;
		text-align:center;
	}
	#productIntroduce #secondTable tr td:first-child div{
		float:right;
	}
	#productIntroduce #secondTable tr td:first-child div strong{
		position:relative;
		right:10px;
	}
	#productIntroduce #secondTable tr td:last-child{
		width:500px;
	}
	#productIntroduce #secondTable tr td:last-child input[type='text']{
		width:400px;
		margin-left:10px;
		position:relative;
		top:5px;
	}
	#productIntroduce #secondTable tr td:last-child button{
		position:relative;
		top:5px;
		height:26px;
		background-color:#F2F5F7;
		border:1px solid grey;
	}
	#productIntroduce #secondTable tr:nth-child(2) td:last-child{
		padding:10px 0 10px 0;
	}
	#productIntroduce #productDetailInfo{
		margin-top:20px;
	}
	#productDetailInfo a{
		color:#878787;
	}
	#productDetailInfo #write{
		margin-top:20px;
		margin-left:10px;
	}
	#productDetailInfo #writeC{
		margin-top:20px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#productDetailInfo .aditorDiv{
		width:100%;
		height:40px;
		border-left:1px solid #878787;
		border-right:1px solid #878787;
		background-color:#F2F5F7;
		text-align:center;
		line-height:40px;
	}
	#productDetailInfo #writeC ul{
		display:block;
		border-color:#878787;
	}
	#productDetailInfo #writeC ul .active{
		border-color:color:#878787;
	}
	#productDetailInfo #writeArea{
		border-top:0px;
		border-color:#878787;
		resize: none;
	}
	#productDetailInfo .nav-tabs > li.active > a,
	#productDetailInfo .nav-tabs > li.active > a:focus,
	#productDetailInfo .nav-tabs > li.active > a:hover{
		border-left:1px solid #878787;
		border-top:1px solid #878787;
		border-right:1px solid #878787;
	}
	#productDetailInfo .nav-tabs > li > a:hover{
	  background-color: white !important;
  	  border-radius: 5px 5px 0px 0px;
  	  border-left:1px solid white;
	  border-top:1px solid white;
	  border-right:1px solid white;
	  border-bottom:1px solid #878787;
      color:#000;
	} 
	#productDetailInfo textarea:focus {
		outline:none;
	}
	#productDetailInfo .tab-content{
		width:100%;
	}
	#productDetailInfo .tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	border-bottom-right-radius:10px;
	 	border-bottom-left-radius:10px;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	#productIntroduce div{
		padding:0px 10px 0px 10px;
	}
	#productIntroduce,
	#productDetailInfo,
	.radioDiv,
	#ProductLogAndMemo,
	#ProductState{
		margin-top:20px;
	}
	a{
		color:#878787;
	}
	.write{
		margin-top:20px;
		margin-left:10px;
	}
	.writeC{
		margin-top:20px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
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
	.writeC ul{
		display:block;
		border-color:#878787;
	}
	.writeC ul .active{
		border-color:color:#878787;
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
	.tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	border-bottom-right-radius:10px;
	 	border-bottom-left-radius:10px;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	input[type='radio']{
		margin-left:10px;
	}
	#ProductLogAndMemo > div > div{
		padding:0px 10px 0px 10px;
	}
	#ProductLogAndMemo textarea{
		width:100%;
		height:100px;
		margin-top:10px;
		resize:none;
		padding:10px;
	}
	#ProductLog,
	#ProductMemo{
		width:385px;
		display:inline-block;
	}
	#buttonGroup{
		margin:25px;
		text-align:center;
	}
	#buttonGroup button{
		width:100px;
		margin:5px;
	}
	.custom-file-label::after{
	    content: "찾아보기";
	}
	.custom-file-label{
		font-size:12px;
	}
	.custom-file{
	    display: inline-block;
	    width: 500px;
	    padding: 0 !important;
	    margin: 5px 0px 5px 10px;
	}
	#firstTable tr #Goodsintroduce > p{
		display:block;
		margin:5px 0px 0px 0px;
		height:30px;
		width:670px;
		text-align:left;
	}
	#firstTable tr #option > p{
		display:block;
		margin:5px 0px 0px 0px;
		width:670px;
		text-align:left;
	}
	#Goodsintroduce button{
		float:left;
		margin-left:10px;
		width:45px;
		height:25px;
		padding:0;
	}
	#option  p > button{
		margin-left:10px;
		width:45px;
		height:25px;
		padding:0;	
	}
	#Goodsintroduce input[type='checkbox'],
	#option input[type='checkbox']{
		margin-left:10px;
	}
	#Goodsintroduce input[type='text']:nth-child(2){
		width:100px;
		margin-left:5px;
	}
	#Goodsintroduce input[type='text']:nth-child(3){
		width:450px;
		margin-left:5px;
	}
	#option > p > span:nth-child(1) > input[type='text']:nth-child(2){
		width:100px;
	}
	#option > p > span:nth-child(1) > input[type='text']:nth-child(3),
	#option > p > span:not(:nth-child(1)) > input[type='text']:nth-child(1){
		width:224px;
	}
	#option > p > span:nth-child(1) > input[type='number']:nth-child(4),
	#option > p > span::not(:nth-child(1)) > input[type='number']:nth-child(2){
		width:160px;
	}
	#option > p span:not(:nth-child(1)){
		margin:10px 0px 0px 128px;
	}
	#option > p span input{
		margin-bottom:5px;
	}
	#option > p span input[type='text'],
	#option > p span input[type='number']{
		margin-left:5px;
	}
	#option > p span button{
		width:65px;
		height:25px;
		padding:0;
		border-radius:5px;
		position:relative;
		bottom:3px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
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
				<a href="goodsRegister" class = "activeMenu"><span>상품 등록</span></a> 
				<a href="goodsList"><span>상품 목록</span></a> 
				<a href="categoryManagement"><span>카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/goodsadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Product Managament</p>
				<p id = "currentIdx">&#124; 상품 관리 > 상품 등록</p>
			</div>
			<form id = "GoodsForm">
				<input type="text" id = "Test" name = "text" style="display:none" />
				<div id = "apply">
					<div id = "stateInfo">
						<strong>상품 정보 입력</strong>
						<select id = "CategorySelect" name = "category">
							<option value = "0">카테고리 선택</option>
							<c:forEach var = "category" items = "${categories}" varStatus = "state">
								<option value = "${category.godcNum}">${category.godcName}</option>
							</c:forEach>
						</select>
						<input id = "productName" type = "text" name = "productName" placeholder = "상품명을 입력하세요." />
					</div>			
					<div>
						<table id = "firstTable">
							<tr>
								<td>						
									<strong>판매 가격</strong>
								</td>
								<td>
									<span><input id = "sellingPrice" type = "number" name = "sellingPrice" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">원</span>
								</td>
								<td>
									<strong>정상 가격</strong>
								</td>
								<td>
									<span><input id = "normalPrice" type = "number" name = "normalPrice" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">원</span>
								</td>
							</tr>
							<tr>
								<td>
									<strong>재고</strong>
								</td>
								<td>
									<span><input id = "godStock" type = "number" name = "godStock" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">개</span>
								</td>
								<td>
									<strong>최대 구매 개수</strong>
								</td>
								<td>
									<span><input id = "godSellingLimit" type = "number" name = "godSellingLimit" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">개</span>
								</td>
							</tr>
							<tr>
								<td>
									<strong>상품 정보</strong>
								</td>
								<td id = "Goodsintroduce" colspan = "3">
									<p>
										<button id = "addIntroduce"  type=  "button" class = "btn btn-default">추가</button>
										<button id = "deleteIntroduce" type=  "button" class = "btn btn-default">삭제</button>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<strong>상품 옵션</strong>
								</td>
								<td id = "option" colspan = "5">
									<p>
										<button id = "addOption"  type=  "button" class = "btn btn-default">추가</button>
										<button id = "deleteOption" type=  "button" class = "btn btn-default">삭제</button>
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id = "productIntroduce">
					<strong>상품 소개글</strong>
					<div id = "introduceTitle">
						<input id = "introduce" class = "form-control" type = "text" name = 'productIntroduce' placeholder = "20자 이내로 소개글을 입력하세요 "/>
					</div>
					<div id = "introduceContent">
						<table id = "secondTable">
							<tr>
								<td>
									<div>
										<strong>목록 이미지</strong>
										<br>
										<strong>331*421</strong>
									</div>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "Indeximg" type = "file" name = "Indeximg" class = "custom-file-input" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
										<strong>상품 대표 이미지</strong>
										<br>
										<strong>500*466</strong>
									</div>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg" type = "file" name = "repreImg1" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg" type = "file" name = "repreImg2" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg" type = "file" name = "repreImg3" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg" type = "file" name = "repreImg4" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
										<strong>메인 노출 이미지</strong>
										<br>
										<strong>500*466</strong>
									</div>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "mainimg" type = "file" name = "mainimg" class = "custom-file-input" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id = "productDetailInfo">
					<strong>제품 상세 정보</strong>
						<div id = "productDetailInfo">
							<div id = "write">
								<div id = "writeC">
									<div class="tab-content">
										<textarea id = "WriteContent" name = "productInfo"></textarea>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div id = "ProductLogAndMemo">
					<div id = "ProductLog">
						<strong>상품 이력 관리</strong>
						<div>
							<textarea readonly></textarea>				
						</div>
					</div>
					<div id = "ProductMemo">
						<strong>상품 메모 입력</strong>
						<div>
							<textarea id = "memo" name = "memo"></textarea>				
						</div>				
					</div>
				</div>
				<div id = "ProductState">
					<strong>상품 노출 여부 : </strong>
					<input type="radio" name="productstate" id="visible" value = "진열">
					<label for="visible">진열</label>
					<input type="radio" name="productstate" id=invisible value = "숨김">
					<label for="invisible">숨김</label>
					<input type="radio" name="productstate" id=allsold value = "품절">
					<label for="allsold">품절</label>				
				</div>
				<div id = "buttonGroup">
					<button id = "register" type = "button" class = "btn btn-default">등록</button>
					<button type = "button" class = "btn btn-default" onclick="location.href='main'">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type = 'text/javascript'>
$(function(){
	CKEDITOR.replace('WriteContent',{
	    toolbar: 'Full',
	    uiColor: '#F2F5F7',
	    height:'200px',
	});
	CKEDITOR.config.language = 'ko';	
	
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
      
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });	
})
$(document).ready(function () {
	  bsCustomFileInput.init()
	});

$("input[type='file']").change(function(){
	var ext = $(this).val().split(".").pop().toLowerCase();
	var file = this.files[0];
	var _URL = window.URL || window.webkitURL;
	var img = new Image();
	var input = $(this).prop("id");
	var name = $(this).prop("name");
	var repre = "input[name='" + name + "']";
	
	img.src = _URL.createObjectURL(file);
	if($.inArray(ext,["gif","jpg","jpeg","png"]) == -1){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '이미지 파일(gif,jpg,jpeg,png)\n만 업로드 가능합니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
		$(this).val("");
		return;
	}
	
	var fileSize = this.files[0].size;
	var maxSize = 1024 * 1024;
	if(fileSize > maxSize){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '파일용량이 1MB를 초과했습니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
		$(this).val("");
		return;
	}
	if(input == "Indeximg"){
		img.onload = function(){
			if(img.width != 331 || img.height != 421){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '331*421 이미지만 가능합니다',
					  showConfirmButton: false,
					  timer: 1500
					});
				$("#Indeximg").val("");
				$("#Indeximg").next().text("");
				return;
			}
		}		
	}else if(input == "repreImg"){
		img.onload = function(){
			if(img.width != 500 || img.height != 466){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '500*466 이미지만 가능합니다',
					  showConfirmButton: false,
					  timer: 1500
					});
				$(repre).val("");
				$(repre).next().text("");
				return;
			}
		}		
	}else if(input == "mainimg"){
		img.onload = function(){
			if(img.width != 500 || img.height != 466){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '500*466 이하 이미지만 가능합니다',
					  showConfirmButton: false,
					  timer: 1500
					});
				$("#mainimg").val("");
				$("#mainimg").next().text("");
				return;
			}
		}		
	}
})

$("#register").click(function(){
	var text = "";
	var introvalue;
	var category = $("#CategorySelect").val();
	var product = $("#productName").val();
	var normalPrice = $("#normalPrice").val();
	var sellingPrice = $("#sellingPrice").val();
	var godSellingLimit = $("#godSellingLimit").val();
	var godStock = $("#godStock").val();
	var introduce = $("#introduce").val();
	var indeximg = $("#Indeximg").val();
	var repreImg1 = $("input[name='repreImg1']").val();
	var repreImg2 = $("input[name='repreImg2']").val();
	var repreImg3 = $("input[name='repreImg3']").val();
	var repreImg4 = $("input[name='repreImg4']").val();
	var mainImg = $("#mainimg").val();
	var WriteContent = CKEDITOR.instances.WriteContent.getData();
	var productState = $("#ProductState").find("input[type='radio']:checked");
	var infoList = [];
	var optionList = [];
	var goodsInfo = $("#Goodsintroduce").find("p:not(:nth-child(1))");
	var goodsOption = $("#option").find("p:not(:nth-child(1))");
	$.each(goodsInfo,function(index,item){
		if($(item).find("input[name='goodsName']").val() == "" || $(item).find("input[name='goodsIntroduce']").val() == ""){
			introvalue = "";
		}else{
			var a = $(item).find("input[name='goodsName']").val();
			var b = $(item).find("input[name='goodsIntroduce']").val();
			var result = a.concat("@^&",b);
			infoList.push(result);
		}
	})
	$.each(goodsOption,function(index,item){
		var optionName = "";
		$.each($(item).find("span"),function(index,item){
			if(index == 0){
				optionName = $(item).find("input[name='goodsOptionName']").val();
			}
			var a = $(item).find("input[name='goodsOptionIntroduce']").val();
			var b = $(item).find("input[name='goodsOptionPrice']").val();
			var result = optionName.concat("@^&",a,"@^&",b);
			optionList.push(result);
		})
	})
	
	if(category == "0"){
		text = "카테고리를 선택하세요!";
	}else if(product == ""){
		text = "상품명을 입력하세요!";
	}else if(sellingPrice == ""){
		text = "판매 가격을 입력하세요!";
	}else if(normalPrice == ""){
		text = "정상 가격을 입력하세요!";
	}else if(godStock == ""){
		text = "최대 구매 개수를 입력하세요!";
	}else if(introvalue == ""){
		text = "상품 정보를 입력하세요!";
	}else if(introduce == ""){
		text = "상품 소개글을 입력하세요!";
	}else if(!indeximg){
		text = "목록 이미지를 선택 하세요!";
	}else if(!repreImg1 && !repreImg2 && !repreImg3 && !repreImg4){
		text = "대표 이미지를 하나 이상 선택 하세요!";
	}else if(!mainImg){
		text = "메인 노출 이미지를 선택 하세요!";
	}else if(WriteContent == ""){
		text = "상세 정보를 입력하세요!";
	}else if(productState.length == 0){
		text = "상품 노출 여부를 선택하세요!";
	}
	if(infoList == ""){
		infoList.push("");
	}
	if(optionList == ""){
		optionList.push("");
	}
		if(text == ""){
			var formData = new FormData($("#GoodsForm")[0]);
			var text = CKEDITOR.instances.WriteContent.getData();
			text = text.replace(/(\n|\r\n)/g, '');
			formData.append('WriteContent', text);
			formData.append('optionList',optionList.join('$$%'));
			formData.append('infoList',infoList.join('$$%'));
			$.ajax({
				url:"addGoods",
				data: formData,
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					if(data == "itr"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '상품 정보에 중복된 값을 입력했습니다!',
							  showConfirmButton: false,
							  timer: 1500
							});					
					}else if(data == "godo"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '상품 옵션에 중복된 값을 입력했습니다!',
							  showConfirmButton: false,
							  timer: 1500
							});						
					}else if(data == "nameoverlap"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '중복된 상품명 입니다!',
							  showConfirmButton: false,
							  timer: 1500
							});								
					}else if(data == "error"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '실패하였습니다.',
							  showConfirmButton: false,
							  timer: 1500
							});						
					}else{
						Swal.fire({
							  position: 'top',
							  type: 'success',
							  title: '등록되었습니다!',
							  showConfirmButton: false,
							  timer: 1500
							});
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
		}else{
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: text,
				  showConfirmButton: false,
				  timer: 1500
				});			
		}
})

$("#addIntroduce").click(function(){
	var td = $(this).parents("td");
	var length = $(this).parents("td").find("p").length;
	if(length < 5){
		var p = $("<p></p>");
		p.append($("<input type = 'checkbox'>"));
		p.append($("<input type = 'text' name = 'goodsName' placeholder = '항목명'>"));
		p.append($("<input type = 'text' name = 'goodsIntroduce' placeholder ='설명'>"));
		td.append(p);		
	}else{
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '최대 4개까지만 등록이 가능합니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
	}
})

$("#addOption").click(function(){
	var td = $(this).parents("td");
	var length = $(this).parents("td").find("p").length;
	if(length < 4){
		var p = $("<p></p>");
		var span1 = $("<span></span>");
		var span2 = $("<span></span>");
		span1.append($("<input type = 'checkbox'>"));
		span1.append($("<input type = 'text' name = 'goodsOptionName' placeholder = '옵션명'>"));
		span1.append($("<input type = 'text' name = 'goodsOptionIntroduce' placeholder = '설명'>"));
		var input1 = $("<input type = 'number' name = 'goodsOptionPrice' placeholder = '가격'>");
		input1.attr({
			onkeyup:"this.value=this.value.replace(/[^0-9]/g,'')"
		})
		span1.append(input1);
		span1.append($("<button id = 'optionAdd' type = 'button' class = 'btn btn-default'>항목 추가</button>"));
		span2.append($("<input type = 'text' name = 'goodsOptionIntroduce' placeholder = '설명'>"));
		var input2 = $("<input type = 'number' name = 'goodsOptionPrice' placeholder = '가격'>");
		input2.attr({
			onkeyup:"this.value=this.value.replace(/[^0-9]/g,'')"
		})		
		span2.append(input2);
		span2.append($("<button id = 'optionDelete' type = 'button' class = 'btn btn-default'>항목 삭제</button>"));
		p.append(span1);
		p.append(span2);
		td.append(p);		
	}else{
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '최대 3개까지만 등록이 가능합니다!',
			  showConfirmButton: false,
			  timer: 1500
			});
	}
})

$("#deleteIntroduce").click(function(){
	var checkbox = $(this).parents("td").find("input[type='checkbox']:checked");
	for(var i = 0 ; i < checkbox.length ; i++){
		$(checkbox[i]).parents("p").remove();
	}
})

$("#deleteOption").click(function(){
	var checkbox = $(this).parents("td").find("input[type='checkbox']:checked");
	for(var i = 0 ; i < checkbox.length ; i++){
		$(checkbox[i]).parents("p").remove();
	}
})

$(document).on("click","#optionAdd",function(){
	var td = $(this).parents("p");
	var span = $("<span></span>");
	span.append($("<input type = 'text' name = 'goodsOptionIntroduce' placeholder = '설명'>"));
	var input1 = $("<input type = 'number' name = 'goodsOptionPrice' placeholder = '가격'>");
	input1.attr({
		onkeyup:"this.value=this.value.replace(/[^0-9]/g,'')"
	})
	span.append(input1);
	td.append(span);
})

$(document).on("click","#optionDelete",function(){
	var td = $(this).parents("p").find("span");
	if(td.length > 2){
		$(td[td.length-1]).remove();
	}else{
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '옵션은 최소 2개 이상 있어야합니다!',
			  showConfirmButton: false,
			  timer: 1500
			});		
	}
})

$("#introduce").keyup(function(){
	var content = $(this).val();
	if(content.length > 20){
		$("#introduce").val(content.substring(0,20));
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '20자 이내로 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});		
	}
})

    var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload){
        	$.ajax({
        		url:"deleteImg",
        		data:"1",
        		method:"post",
        		success:function(data){
        			console.log("성공");
        		},
        		error:function(a,b,errMsg){
        			console.log("에러");
        		}
        	})
        }
    });
</script>

</body>
</html>