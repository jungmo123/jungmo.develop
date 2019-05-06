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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<script type="text/javascript" src= "../editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<style>
	.Dtitle{
		font-weight:bold;
		position:relative;
		left:15px;
	}
	.Dtitle span{
		position:relative;
		bottom:5px;
	}
	#requestContent,#responseContent{
		line-height:25px;
		padding-left:15px;
		margin-bottom:10px;
	}
	#requestTitle hr,#responseTitle hr,#footerDiv hr{
		margin:15px 0px 15px 0px;
	}
	#requestTitle strong,#responseTitle strong{
		font-size:30px;
		color:#FF6F43;
		margin-right:20px;
	}
	#requestTitle div,#responseTitle div{
		display:inline-block;
	}
	.Titleinfo{
		float:right;
		font-weight:bold;
		position:relative;
		right:15px;
		top:10px;
	}
	.buttonBox{
		width:100%;
		height:100px;
	}
	.buttonBox button{
		display:inline-block;
		position:relative;
		top:75px;
		width:50px;
		height:25px;
		padding:0;
		margin-right:5px;
		float:right;
	}
	.buttonBox button:last-child{
		display:inline-block;
		position:relative;
		top:75px;
		width:80px;
		height:25px;
		padding:0;
		margin-right:5px;
		float:right;		
	}
	.glyphicon::before{
		position:relative;
		top:2px;
	}
	#footerDiv button{
		float:right;
	}
	#otom .modal-header{
		border:0;
	}
	#otom .modal-body{
		padding:0px 15px 0px 15px;
	}
	#otom .modal-body textarea{
		resize: none;
	}
	#otom .modal-footer{
		border:0;
		text-align:center;
	}
	#otom .modal-title{
		font-weight:bold;
	}
	#otom hr{
		margin:5px;
	}
	.modal-content{
		width:696px;
	}
	.modal-body div:first-child{
		width:100%;
		height:314px;
		border-top:1px solid lightgrey;
		border-left:1px solid lightgrey;
		border-right:1px solid lightgrey;
		text-align:center;
		line-height:30px;
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
				<a href="oneTwoOne" class="activeMenu"><span>1:1문의</span></a> 
				<a href="11.html"><span>상품평</span></a> 
				<a href="12.html"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판 관리 > 1:1 문의 목록 > 상세 보기</p>
			</div>
		<div id = "requestTitle">
			<hr>
			<span class = "Dtitle"><strong>Q</strong><span>[${oto.otocName}] ${oto.otoqTitle}</span></span>
			<div class = "Titleinfo">
				<span class = "Did">${oto.userId}</span>
				<span>&#124;</span>
				<span class = "Ddate"><fmt:formatDate value = "${oto.otoqWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
			</div>
			<hr>
		</div>
		<div id = "requestContent">
				${oto.otoqContent}
			<div class = "buttonBox">
				<button id = "md" class = "form-control" data-toggle = "modal" data-target = "#otom">수정</button>
				<button class = "form-control">삭제</button>
			</div>
		</div>
		<div id = "responseTitle">
			<hr>
			<c:if test = "${oto.otoa == null}">
			<span class = "Dtitle"><strong>A</strong><span>답변 준비중</span></span>
			<div class = "Titleinfo">
				<span class = "Did"></span>
				<span></span>
				<span class = "Ddate"></span>
			</div>
			</c:if>
			<c:if test = "${oto.otoa != null}">
			<span class = "Dtitle"><strong>A</strong><span>답변 완료</span></span>
			<div class = "Titleinfo">
				<span class = "Did">${oto.otoa.userId}</span>
				<span>&#124;</span>
				<span class = "Ddate"><fmt:formatDate value = "${oto.otoa.otoaWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
			</div>
			</c:if>
			<hr>
		</div>
		<div id = "responseContent">
		<c:if test = "${oto.otoa == null}">
			답변을 준비 중입니다.
			신속한 답변을 원하신다면 고객센터로 문의해 주세요.<br>
			<span class = "glyphicon glyphicon-triangle-right">고객센터 : 070-0000-0000</span>
		</c:if>
		<c:if test = "${oto.otoa != null}">
			${oto.otoa.otoaContent}
		</c:if>
			<div class = "buttonBox">
				<button class = "form-control">수정</button>
				<button class = "form-control">삭제</button>
				<button class = "form-control" data-toggle = "modal" data-target = "#otom">답변하기</button>
			</div>
		</div>
		<div id = "footerDiv">
			<hr>
			<button class = "btn btn-default left" onclick = "location.href = '10.html'">목록 보기</button>
		</div>
	</div>
</div>
</div>

	<div class = "modal fade" id  ="otom">
		<div class = "modal-dialog modal-md">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;상품 문의 답변/수정하기</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div>
						<textarea id = "WriteContent" name = "WriteContent" style="width:660px; height:275px;"></textarea>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성완료</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">작성취소</button>
				</div>
			</div>
		</div>
	</div>

<script type = "text/javascript">
var oEditors = [];
$(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "WriteContent",
		//SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI: "../editor/SmartEditor2Skin.html",	
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,				
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,		
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			
			fOnBeforeUnload : function(){
				
			},
			fOnAppLoad:function(){
				$("iframe").css("width","100%").css("height","399px");
			}
		},
		fCreator: "createSEditor2"
	})
})
</script>

</body>
</html>