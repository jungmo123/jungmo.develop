<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<script type="text/javascript" src= "../editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<style>
	#titleBar{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#titleBar input[type='text']{
		width:605px;
		height:24px;
	}
	#textBox{
		display:inline-block;
		width:780px;
		padding:10px;
	}
	#textBox > div:first-child{
		height:30px;
		background-color:#F2F5F7;
		text-align:center;
		border:1px solid grey;
		border-bottom:0;
	}
	#buttonGroup{
		display:inline-block;
		width:780px;
		text-align:center;
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
				<a href="cic" class="activeMenu"><span>고객센터 공지</span></a> 
				<a href="community"><span>커뮤니티</span></a>
				<a href="goodsQuestion"><span>상품 문의</span></a> 
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a>
				<a href="event"><span>이벤트</span></a>
				<a href="boardCategory"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판 관리 > 공지 사항 > 글쓰기</p>
			</div>
		<form id = "writeForm" action = "write" method = "post">
			<c:if test = "${idx!=null}">
				<input type = "text" name = "posNum" value = "${idx}"  style = "display:none" />
			</c:if>
			<div id = "titleBar">
				<label for = "importance">중요</label>
				<input id = "importance" type= "checkbox" name = "importance">
				<select id = "categorySelect" name = "categorySelect">
					<option>카테고리 선택</option>
					<c:forEach var = "category" items = "${categories}" varStatus = "state">
						<option value = "${category.poscNum}">${category.poscName}</option>
					</c:forEach>
				</select>
				<input id = "writeTitle" type = "text" name = "title" placeholder = "제목을 입력해 주세요!"   onkeyup="chkword(this,60)" />
			</div>
			<div>
				<textarea id = "writeContent" name = "writeContent" style="width:765px; height:475px; display:none;"></textarea>	
			</div>
			<div id = "buttonGroup">
				<button id = "submitButton" class = "btn btn-default">작성 완료</button>
				<button type = "button" class = "btn btn-default" onclick="location.href='cic'">작성 취소</button>
			</div>
		</form>
	</div>
</div>
</div>

<script type="text/javascript">
var oEditors = [];
$(function(){
				var idx = "${idx}"
				var op = "${pos.poscNum}"
				var ck = "${pos.posImportance}"
				var title = "${pos.posTitle}"
				var content = '${pos.posContent}'
					if(idx != ""){
						var soption = $("#categorySelect option");
						$.each(soption,function(index,item){
							if($(item).val() == op){
								$(item).prop("selected",true);
							}
						})
						if(ck == "Y"){
							$("#importance").prop("checked",true);
						}
						$("#writeTitle").val(title)
			
						$("#writeContent").val(content);
					}
	
	
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "writeContent",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "../editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			
							fOnBeforeUnload : function(){
								
							},
							fOnAppLoad : function(){
								oEditors.getById["writeContent"].exec("PASTE_HTML", [content])
							}
						},
						fCreator: "createSEditor2"
					});
					
					$("#submitButton").click(function(e){
						e.preventDefault();
						oEditors.getById["writeContent"].exec("UPDATE_CONTENTS_FIELD",[]);
						if($("#categorySelect option:selected").val() == '카테고리 선택'){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: "카테고리를 선택해주세요!",
								  showConfirmButton: false,
								  timer: 1500
								});			
						}else if($("#writeTitle").val() == ''){
							Swal.fire({
								  position: 'top',
								  type: 'error',
								  title: "제목을 입력하세요!",
								  showConfirmButton: false,
								  timer: 1500
								});										
						}else{
							$("#writeForm").submit();
						}
					})
});

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
			  title: maxByte + '자를 초과할수는 없습니다.',
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