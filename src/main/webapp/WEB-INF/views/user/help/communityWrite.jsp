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
<script type="text/javascript" src= "editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<style>	
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
	}
	#adviser{
		width:780px;
		height:120px;
		padding:10px;
		margin-bottom:30px;
		margin-top:20px;
		border:1px solid grey;
	}
	#adviser div{
		display:inline-block;
	}
	#adviser div:first-child{
		width:200px;
		height:100px;
		float:left;
	}
	#adviser div:last-child{
		height:100px;
		padding:10px;
		line-height:25px;
		float:left;
	}
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:200px;
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
	#inquiry,#help{
		margin-top:10px;
		width:160px;
		border:1px solid grey;
		float:left;
		text-align:center;
		line-height:25px;
		padding:10px;
		cursor:pointer;		
	}
	#inquiry{
		height:100px;
	}
	#help{
		height:120px;
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
	a{
		color:black;
	}
	#counselor{
		width:200px;
		height:100px;
	}
	#noticeRead{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
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
	#writeForm{
		margin-top:20px;
	}
</style>
</head>
<body>

	<div class="container" id = "${type}">
	<%@ include file = "../header/userheader.jsp" %>
		<div id = "adviser" class = "center-block">
			<div>
				<img id = "counselor" src = "IMAGE/counselor.jpg">
			</div>
			<div>
				<strong>무엇을 도와 드릴까요?</strong>
				<br>
				<span>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화 주시거나 1:1문의로 남겨주세요.</span>
				<br>
				<span>친절히 안내해 드립니다.</span>
			</div>
		</div>
		<div id="content" class = "${post.posNum}">
		<div id = "navBar">
			<div id="nav">
				<div id="navTitle">
					<span>고객센터</span>
				</div>
			<div id="navContent">
				<div>
					<a href="notice"><span>> 공지사항</span></a>
					<a href="community" class = "activeMenu"><span>> 커뮤니티</span></a> 
					<a href="idSearch"><span>> 아이디 찾기</span></a> 
					<a href="pwdSearch"><span>> 비밀번호 찾기</span></a>
				</div>
			</div>
			</div>
			<div id = "inquiry" onClick = "location.href=mypage/otoqAdd';">
				<div onclick = "location.href = 'mypage/otoqAdd'">
					<strong>1:1 문의</strong>
				</div>
				<div onclick="location.href='mypage/otoqAdd'">
					<span>비공개로 고객님께</span>
					<br>
					<span> 맞춤 답변을 드립니다.</span>
				</div>				
			</div>
			<div id = "help" onClick = "location.href='/shoppingmall/notice';">
				<div>
					<strong>고객센터</strong><br>
					<strong>070-0000-0000</strong>
				</div>
				<div>
					<span> 평일 10시-18시</span><br>
					<span>공휴일,주말 휴무</span>
				</div>	
			</div>
		</div>
		<div id="noticeRead">
			<strong>&#124;&nbsp;공지사항</strong>
			<hr>
			<form id = "writeForm" action = "Cwrite" method = "post">
				<c:if test = "${idx!=null}">
					<input type = "text" name = "posNum" value = "${idx}"  style = "display:none" />
				</c:if>
				<div id = "titleBar">
					<select id = "categorySelect" name = "categorySelect">
						<option>카테고리 선택</option>
						<c:forEach var = "category" items = "${categories}" varStatus = "state">
							<option value = "${category.poscNum}">${category.poscName}</option>
						</c:forEach>
					</select>
					<input id = "writeTitle" type = "text" name = "title" placeholder = "제목을 입력해 주세요!"   onkeyup="chkword(this,60)" />
				</div>
				<div>
					<textarea id = "writeContent" name = "writeContent" style="width:785px; height:475px; display:none;"></textarea>	
				</div>
				<div id = "buttonGroup">
					<button id = "submitButton" class = "btn btn-default">작성 완료</button>
					<button type = "button" class = "btn btn-default" onclick="location.href='community'">작성 취소</button>
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
						sSkinURI: "editor/SmartEditor2Skin.html",	
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