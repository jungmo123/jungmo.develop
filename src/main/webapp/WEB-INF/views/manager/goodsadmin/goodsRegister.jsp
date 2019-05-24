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
		width:40px;
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
				<a href="goodsIndex"><span>상품 목록</span></a> 
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
			<form>
				<div id = "apply">
					<div id = "stateInfo">
						<strong>상품 정보 입력</strong>
						<select id = "CategorySelect">
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
									<span><input id = "sellingPrice" type = "number" name = "sellingPrice">원</span>
								</td>
								<td>
									<strong>정상 가격</strong>
								</td>
								<td>
									<span><input id = "normalPrice" type = "number" name = "normalPrice">원</span>
								</td>
								<td>
									<strong>최대 구매 개수</strong>
								</td>
								<td>
									<span><input id = "godStock" type = "number" name = "godStock">개</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id = "productIntroduce">
					<strong>상품 소개글</strong>
					<div id = "introduceTitle">
						<input id = "introduce" class = "form-control" type = "text" name = "itTitle" placeholder = "20자 이내로 소개글을 입력하세요 "/>
					</div>
					<div id = "introduceContent">
						<table id = "secondTable">
							<tr>
								<td>
									<div>
										<strong>목록 이미지</strong>
										<br>
										<strong>000*000</strong>
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
										<strong>000*000</strong>
									</div>
								</td>
								<td>
									<div class = "custom-file">
										<input id = "check" type = "text" style = "display:none"/>
										<input id = "repreImg1" type = "file" name = "repreImg1" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg2" type = "file" name = "repreImg2" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg3" type = "file" name = "repreImg3" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
									<div class = "custom-file">
										<input id = "repreImg4" type = "file" name = "repreImg4" class = "custom-file-input repreImg" />
										<label class="custom-file-label" for="inputGroupFile01"></label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
										<strong>메인 노출 이미지</strong>
										<br>
										<strong>000*000</strong>
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
							<textarea id = "memo"></textarea>				
						</div>				
					</div>
				</div>
				<div id = "ProductState">
					<strong>상품 노출 여부 : </strong>
					<input type="radio" name="productstate" id="visible">
					<label for="visible">진열</label>
					<input type="radio" name="productstate" id=invisible>
					<label for="invisible">숨김</label>
					<input type="radio" name="productstate" id=allsold>
					<label for="allsold">품절</label>				
				</div>
				<div id = "buttonGroup">
					<button id = "register" type = "button" class = "btn btn-default">등록</button>
					<button class = "btn btn-default">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type = 'text/javascript'>
$(document).ready(function () {
	  bsCustomFileInput.init()
	});
	
CKEDITOR.replace('WriteContent',{
    toolbar: 'Full',
    uiColor: '#F2F5F7',
    height:'200px'
}
);
CKEDITOR.config.language = 'ko';

$("input[type='file']").change(function(){
	var ext = $(this).val().split(".").pop().toLowerCase();
	var input = $(this);
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
	}
})

$("#Indeximg").change(function(){
	var file = this.files[0];
	var _URL = window.URL || window.webkitURL;
	var img = new Image();
	
	img.src = _URL.createObjectURL(file);
	img.onload = function(){
		if(img.width > 500 || img.height > 470){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '500*470 이하 이미지만 가능합니다',
				  showConfirmButton: false,
				  timer: 1500
				});
			$("#check").val("바보");
		}
	}
	console.log($("#check").val());
})

$("#register").click(function(){
	var text = "";
	var category = $("#CategorySelect").val();
	var product = $("#productName").val();
	var normalPrice = $("#normalPrice").val();
	var sellingPrice = $("#sellingPrice").val();
	var godStock = $("#godStock").val();
	var introduce = $("#introduce").val();
	var indeximg = $("#Indeximg").val();
	var repreImg1 = $("#repreImg1").val();
	var repreImg2 = $("#repreImg2").val();
	var repreImg3 = $("#repreImg3").val();
	var repreImg4 = $("#repreImg4").val();
	var mainImg = $("#mainimg").val();
	var WriteContent = CKEDITOR.instances.WriteContent.getData();
	var productState = $("#ProductState").find("input[type='radio']:checked");
	
	if(category == "0"){
		text = "카테고리를 선택하세요!";
	}else if(product == ""){
		text = "상품명을 입력하세요!";
	}else if(normalPrice == ""){
		text = "판매 가격을 입력하세요!";
	}else if(sellingPrice == ""){
		text = "정상 가격을 입력하세요!";
	}else if(godStock == ""){
		text = "최대 구매 개수를 입력하세요!";
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
	
	console.log(text);
})
</script>

</body>
</html>