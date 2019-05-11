<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="../fileinput/css/fileinput.css" rel="stylesheet">
<script src="../fileinput/js/fileinput.min.js"></script>
<script src="../fileinput/js/locales/es.js"></script>


<style>
	#event{
		background-color:#F2F5F7;
		padding:10px;
		border-radius:10px;
	}
	#eventForm div:first-child input{
		margin:10px 0px 10px 0px;
	}
	#eventForm div:first-child textarea{
		resize:none;
	}
	#eventForm{
		width:100%;
		display:inline-block;		
	}
	#input-group{
		display:inline;
	}
	#input1,#input2{
		display:inline-block;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px;
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
	#viewDiv{
		display:inline-block;
		float:right;
		position:relative;
		top:8px;
	}
	#viewDiv input{
		width:120px;
		display:inline-block;
	}
	#keyword{
		float:right;
		position:relative;
		bottom:2px;
	}
	#keyword .form-control{
		display:inline-block;
	}
	#keyword select{
		width:110px;
		position:relative;
		top:1px;
	}
	#keyword span{
		position:relative;
		bottom:1px;
		right:8px;
	}
	#keyword input{
		width:140px;
	}
	#keyword button{
		padding:0px 5px 0px 5px;
		margin:0px 10px 5px 10px;
	}
	#eventForm div:nth-child(2) span{
		font-weight:bold;
	}
	#eventBody{
		margin-top:30px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:10px;
	}
	#imgBox{
		display:inline-block;
		width:184px;
		height:100px;
		border:1px solid #878787;
		border-radius:10px;
		text-align:center;
		background-color:white;
	}
	#imgBox span{
		font-size:12px;
	}
	#eventImg{
		margin-top:10px;
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
	#writeC{
		margin-top:20px;
		height:400px;
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
	.aditorDiv{
		width:100%;
		height:40px;
		border-left:1px solid #878787;
		border-right:1px solid #878787;
		background-color:#F2F5F7;
		text-align:center;
		line-height:40px;
	}
	textarea:focus {
	outline:none;
	}
	.tab-content{
		width:100%;
		height:400px;
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
				</span> <span>게시판 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="styleshop"><span>스타일 숍 공지</span></a> 
				<a href="cic"><span>고객센터 공지</span></a> 
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event" class="activeMenu"><span>이벤트</span></a>
				<a href="boardCategory"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판관리 > 이벤트 등록/수정하기</p>
			</div>
			<c:if test = "${event!=null}">
			<form id = "modify" action = "addEvent" method = "post" enctype = "multipart/form-data">
				<input type = "text" name = "eventNum" value = "${event.eventNum}" style="display:none" />
				<div id = "event">
					<div id = "eventForm">
						<div>
							<input id = "eventTitle" type = "text" name = "title" class = "form-control" placeholder = "제목을 입력하세요!" onkeyup="chkword(this,40)" value = "${event.eventTitle}"/>
							<textarea id = "eventSummary" class = "form-control" name = "summary" placeholder = "이벤트 요약 내용을 입력하세요!(50자 이내 , 줄바꿈 1회 가능)" onkeyup="chkword(this,100)">${event.eventSummary}</textarea>
						</div>
						<div>
							<span>이벤트 기간</span>
							<div id = "input-group">
								<div id = "input1">
									<input type="date" name="sdate" class="dateInput" value = "${event.eventSDate}">
								</div>
								<span>~</span>
								<div id = "input2">
									<input type="date" name="edate" class="dateInput" value = "${event.eventEDate}">		
								</div>
								<div id = "viewDiv">
									<span>조회수 :</span>
									<input id = "viewCnt" class = "form-control" type = "number" name = "viewcount" value = "${event.eventViewCnt}"/>
								</div>
							</div>					
						</div>
					</div>
				</div>
				<div id = "eventBody">
					<strong>목록 이미지 수정(미등록시 기존 이미지 사용)</strong>
					<div id = "eventImg">
						<div class="form-group">
						<input id="file" type="file" class="file" name = "file" data-preview-file-type="any">
						<input type = "text" name = "original" value = "${event.eventListImageUrl}" style = "display:none"/>
						</div>
					</div>
						<div id = "write">
							<div id = "writeC">
								<div class="tab-content">
									<textarea id = "WriteContent" name = "content" style = "height:500px;"></textarea>
								</div>
							</div>
							<div id = "buttonGroup">
								<button type = "submit" class = "btn btn-default">작성 완료</button>
								<button class = "btn btn-default">작성 취소</button>
							</div>
						</div>				
				</div>
			</form>
			</c:if>
			<c:if test = "${event==null}">
			<form id = "submit" action = "addEvent" method = "post" enctype = "multipart/form-data">
				<div id = "event">
					<div id = "eventForm">
						<div>
							<input id = "eventTitle" type = "text" name = "title" class = "form-control" placeholder = "제목을 입력하세요!" onkeyup="chkword(this,40)" value = "${event.eventTitle}"/>
							<textarea id = "eventSummary" class = "form-control" name = "summary" placeholder = "이벤트 요약 내용을 입력하세요!(50자 이내 , 줄바꿈 1회 가능)" onkeyup="chkword(this,100)">${event.eventSummary}</textarea>
						</div>
						<div>
							<span>이벤트 기간</span>
							<div id = "input-group">
								<div id = "input1">
									<input type="date" name="sdate" class="dateInput" value = "${event.eventSDate}">
								</div>
								<span>~</span>
								<div id = "input2">
									<input type="date" name="edate" class="dateInput" value = "${event.eventEDate}">		
								</div>
								<div id = "viewDiv">
									<span>조회수 :</span>
									<input id = "viewCnt" class = "form-control" type = "number" name = "viewcount" value = "${event.eventViewCnt}"/>
								</div>
							</div>					
						</div>
					</div>
				</div>
				<div id = "eventBody">
					<strong>목록 이미지 수정(미등록시 기존 이미지 사용)</strong>
					<div id = "eventImg">
						<div class="form-group">
						<input id="file" type="file" class="file" name = "file" data-preview-file-type="any">
						</div>
					</div>
						<div id = "write">
							<div id = "writeC">
								<div class="tab-content">
									<textarea id = "WriteContent" name = "content" style = "height:500px;"></textarea>
								</div>
							</div>
							<div id = "buttonGroup">
								<button type = "submit" class = "btn btn-default">작성 완료</button>
								<button class = "btn btn-default">작성 취소</button>
							</div>
						</div>				
				</div>
			</form>
			</c:if>
		</div>
  	</div>
</div>

<script type = "text/javascript">
CKEDITOR.replace('WriteContent',{
    toolbar: 'Full',
    uiColor: '#F2F5F7',
    height:'300px'
}
);
CKEDITOR.config.removePlugins = 'resize';
CKEDITOR.config.language = 'ko';

$("#file").fileinput({
	showUpload: false,
	showUploadedThumbs: true
	});

var data = '${event.eventTitle}';

CKEDITOR.instances.WriteContent.setData(data);

$("#submit").submit(function(e){
	if(fileCheck(true) == true){
		console.log("성공");
	}else{
		e.preventDefault();
	}
})

$("#modify").submit(function(e){
	if(fileCheck(false) == true){
		console.log("성공");
	}else{
		e.preventDefault();
	}
})

function fileCheck(bl){
	obj = document.getElementById("file");
	if(bl == false){
		if(obj.value == ''){
			return injection(obj);
		}else{
			pathpoint = obj.value.lastIndexOf('.');
			filepoint = obj.value.substring(pathpoint+1,obj.length);
			filetype = filepoint.toLowerCase();
			if(filetype=='jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg' || filetype == 'bmp'){
				
			}else{
				alert("이미지 파일만 선택할 수 있습니다.");
				return false;
			}
			if(filetype == 'bmp'){
				upload=confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n 그래도 계속 사용하시겠습니까?');
				if(!upload) return false;
			}
			return injection(obj);			
		}
	}
	else{
	if(obj.value == ''){
		alert("이미지를 등록해주세요.")
		return false;
	}
	pathpoint = obj.value.lastIndexOf('.');
	filepoint = obj.value.substring(pathpoint+1,obj.length);
	filetype = filepoint.toLowerCase();
	if(filetype=='jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg' || filetype == 'bmp'){
		
	}else{
		alert("이미지 파일만 선택할 수 있습니다.");
		return false;
	}
	if(filetype == 'bmp'){
		upload=confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n 그래도 계속 사용하시겠습니까?');
		if(!upload) return false;
	}
	return injection(obj);
	}
}

function injection(obj){
	if($("#eventTitle").val() == ""){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '제목을 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});
		return false;
	}
	if($("#eventSummary").val() == ""){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '요약 내용을 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});
		return false;
	}else{
		if($.isNumeric($("#viewCnt").val())){
			if($("#viewCnt").val() < 0){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '0이상의 값을 입력하세요!',
					  showConfirmButton: false,
					  timer: 1500
					});
				return false;
			}
			if($("#viewCnt").val() > 99999){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '10만이하의 값을 입력하세요!',
					  showConfirmButton: false,
					  timer: 1500
					});
				return false;
			}
		}
	}
	if($("#input-group #input1 input").val()=="" || $("#input-group #input2 input").val()==""){
		Swal.fire({
			  position: 'top',
			  type: 'warning',
			  title: '날짜를 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});
		return false;
	}
	if($("#viewCnt").val() == ""){
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: '조회수를 입력하세요!',
			  showConfirmButton: false,
			  timer: 1500
			});
		return false;
	}
	return true;	
}

function chkword(obj, maxByte) {
	 
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
		Swal.fire({
			  position: 'top',
			  type: 'error',
			  title: maxByte/2 + '자를 초과할수는 없습니다.',
			  showConfirmButton: false,
			  timer: 1500
			});
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}
</script>

</body>
</html>