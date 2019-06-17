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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style>	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
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
		height:210px;
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
		margin-bottom:20px;
		line-height:25px;
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
	#Dtitle,#DuserId,#Dposc{
		font-weight:bold;
		position:relative;
		left:15px;
	}
	#Dposc{
		color:#878787;
	}
	#Ddate{
		float:right;
	}
	#content{
		margin-bottom:50px;
	}
	#contentDiv{
		line-height:25px;
		padding:40px;
		margin-bottom:50px;
	}
	#contentDiv hr{
		width:780px !important;
		position:relative;
		right:10px;
	}
	.left{
		float:left;
		margin-right:5px;
	}
	.right{
		float:right;
		margin-right:5px;
	}
	button{
		width:80px;
	}
	#AllContent hr{
		width:100%;
		height:2px;
		margin:10px;
		border-color:grey;
	}
	#commentDiv  button{
		width:42px;
		height:22px;
		padding:0;
		font-size:12px;
		font-weight:bold;
	}
	#commentDiv hr{
		margin:10px;	
	}
	#commentDiv strong{
		margin-right:20px;
	}
	#commentDiv textarea{
		resize: none;
		padding:5px;
		border-radius:5px;
		height:76px;
	}
	#commentDiv form div button{
		width:130px;
		height:70px;
		float:right;
		margin-right:10px;
		position:relative;
		top:4px;
	}
	.commentInfo{
		margin:10px;
	}
	.commentInfo span{
		position:relative;
		bottom:4px;
		margin-left:5px;
	}
	.commentInfo button{
		float:right;
		margin-right:5px;
	}
	.fa-comment-dots{
		font-size:25px;
	}
	.commentContent,.commentModify{
		margin:10px 0px 50px 10px;
		line-height:25px;
	}
	.date{
		font-size:12px;
		color:#878787;
		font-weight:bold;
	}
	.commentContent form div button,
	.commentModify form div button{
		position:relative;
		top:3px;
	}
	.none{
		display:none;
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
					<a href=""><span onclick = "location.href = '06.html'">> 자주 하는 질문</span></a>
					<a href=""><span onclick = "location.href = '07.html'">> 상품 문의</span></a>
					<a href=""><span onclick = "location.href = '08.html'">> 아이디 찾기</span></a> 
					<a href=""><span onclick = "location.href = '09.html'">> 비밀번호 찾기</span></a>
				</div>
			</div>
			</div>
			<div id = "inquiry" onClick = "location.href='../MYPAGE/BOARD/01.html';">
				<div onclick = "location.href = '../MYPAGE/BOARD/01.html'">
					<strong>1:1 문의</strong>
				</div>
				<div onclick="location.href='../MYPAGE/BOARD/03.html'">
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
		<div id = "titleDiv">
			<hr>
			<span id = "Dposc">${post.poscName} &#124; </span>
			<span id = "Dtitle">${post.posTitle}</span>
			<span id = "Ddate"><fmt:formatDate value = "${post.posWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
		</div>
		<hr>
		<div>
			<span id = "DuserId">${post.userId}</span>
		</div>
		<div id = "contentDiv">
			${post.posContent}
		</div>
		<div id = "commentDiv">
			<hr>
			<strong>작성된 댓글 (${fn:length(comments)}개)</strong>
			<button id = "writeComment"  class = "btn btn-default">작성</button>
			<button id = "writeCancel" class = "btn btn-default">취소</button>
			<hr id = "HR">
			<form id = "writeArea">
				<div>
					<textarea cols = "84" rows ="3" placeholder = "- 최대 000자까지 작성할 수 있습니다(띄어쓰기 포함).
※욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
					<button id = "registration" class = "btn btn-default" type = "button">등록</button>
				</div>
			</form>
			<div id = "cmt">
				<c:forEach var = "comment" items = "${comments}" varStatus = "state">
				<div id = "${comment.cmtNum}" class = "cmtNum">
					<hr>
					<div class = "commentInfo">
						<i class="far fa-comment-dots"></i>
						<span>${comment.userId}</span>
						<span>&#124;</span>
						<span class = "date"><fmt:formatDate value = "${comment.cmtWritingDate}" pattern = "YYYY-MM-dd HH:mm:ss" /></span>
						<button class = "btn btn-default modify">수정</button>
						<button class = "btn btn-default delete">삭제</button>
						<input type = "text" name = "cmtNum" value = "${comment.cmtNum}" style = "display:none" />
					</div>
					<div class = "commentContent" >
						${comment.cmtContent}
					</div>
				</div>
				</c:forEach>
			</div>
			<hr>
		</div>
		<div id = "footerDiv">
			<a href = "community0I1" class = "btn btn-default left">목록 보기</a>
			<button id = "pre" class = "btn btn-default left">이전글&nbsp;<span class = "glyphicon glyphicon-chevron-down" ></span></button>
			<button id = "next" class = "btn btn-default left">다음글&nbsp;<span class = "glyphicon glyphicon-chevron-up" ></span></button>
			<button class = "btn btn-default right"onclick="location.href='/shoppingmall/admin/cicWrite'">글쓰기</button>
			<c:if test = "${post.userId == user}">
			<button id = "modify" class = "btn btn-default right">수정</button>
			<button id = "delete" class = "btn btn-default right">삭제</button>
			</c:if>
		</div>
		</div>
	</div>
	</div>

<script type = "text/javascript">
	var userId = "${user}"
	var getComment = function(){
		var posNum = "${post.posNum}"
			$.ajax({
				url:"getComment",
				method:"post",
				data: {
					posNum:posNum,
				},
				success:function(comments){
					$("#cmt").text("");
					$.each(comments,function(index,item){
						var div = document.createElement("div")
						div.setAttribute("id",item.cmtNum);
						div.setAttribute("class","cmtNum");
						var hr = document.createElement("hr");
						div.append(hr);
						
						// commentInfo
						var commentInfo = document.createElement("div");
						div.append(commentInfo);
						commentInfo.setAttribute("class","commentInfo");
						var icon = document.createElement("i");
						icon.setAttribute("class","far fa-comment-dots");
						commentInfo.append(icon);
						var id = document.createElement("span");
						id.innerHTML=item.userId;
						commentInfo.append(id);
						var span = document.createElement("span");
						span.innerHTML='&#124';
						commentInfo.append(span);
						var date = document.createElement("span");
						date.innerHTML=new Date(item.cmtWritingDate).yyyymmddhhmmss();
						date.setAttribute("class","date");
						commentInfo.append(date);
						if(item.userId == userId){
							var modify = document.createElement("button");
							modify.innerHTML="수정";
							modify.setAttribute("class","btn btn-default modify");
							commentInfo.append(modify);
							var del = document.createElement("button");
							del.innerHTML="삭제";
							del.setAttribute("class","btn btn-default delete");
							commentInfo.append(del);							
						}
						var cmtNum = document.createElement("input");
						cmtNum.setAttribute("type","text");
						cmtNum.setAttribute("name","cmtNum");
						cmtNum.setAttribute("value",item.cmtNum);
						cmtNum.setAttribute("style","display:none");
						commentInfo.append(cmtNum);
						
						//commentContent
						var commentContent = document.createElement("div");
						commentContent.setAttribute("class","commentContent");
						commentContent.innerHTML=item.cmtContent;
						div.append(commentContent);
						
						//commentModify
						var commentModify = document.createElement("div");
						commentModify.setAttribute("class","commentModify none");
						var modifyForm = document.createElement("form");
						modifyForm.setAttribute("class","modifyForm");
						var formdiv = document.createElement("div");
						var modifyButton = document.createElement("button");
						modifyButton.innerHTML="완료";
						modifyButton.setAttribute("class","btn btn-default modifyButton");
						modifyButton.setAttribute("type","button");
						formdiv.append(modifyButton);
						var modifyArea = document.createElement("textarea");
						modifyArea.setAttribute("cols","82");
						modifyArea.setAttribute("rows","3");
						formdiv.append(modifyArea);
						modifyForm.append(formdiv);
						commentModify.append(modifyForm);
						div.append(commentModify);
						$("#cmt").append(div);
					})
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '저장을 실패하였습니다.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})			
	};
	
	$(function(){
		Date.prototype.yyyymmdd = function() {
			  var mm = this.getMonth() + 1;
			  var dd = this.getDate();

			  return [this.getFullYear(),
			          (mm>9 ? '' : '0') + mm,
			          (dd>9 ? '' : '0') + dd
			         ].join('-');
			};
			
			Date.prototype.hhmmss = function() {
				  var hh = this.getHours();
				  var mm = this.getMinutes();
				  var ss = this.getSeconds();

				  return [(hh>9 ? '' : '0') + hh,
				          (mm>9 ? '' : '0') + mm,
				          (ss>9 ? '' : '0') + ss,
				         ].join(':');
				};

				Date.prototype.yyyymmddhhmmss = function() {
					  return this.yyyymmdd() + " "+ this.hhmmss();
					};
					
				getComment();
	})

	var idx = ${post.posNum};
	$("#pre").click(function(){
		if("${post.preNum}"==0){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '이전글이 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
			location.href="/shoppingmall/communityRead${category}I${post.prec}I${post.preNum}";
		}
	})
	
		$("#next").click(function(){
			if("${post.nextNum}"==0){
				Swal.fire({
					  position: 'top',
					  type: 'warning',
					  title: '다음글이 없습니다!',
					  showConfirmButton: false,
					  timer: 1500
					});
			}else{
				location.href="/shoppingmall/communityRead${category}I${post.nextc}I${post.nextNum}";
			}
		})
		
		$("#delete").click(function(){
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
					window.location.href = "/shoppingmall/admin/cicDelete"+idx;
				  }
				})			
		})
		$("#modify").click(function(){
			location.href = "/shoppingmall/admin/cicModify"+idx;
		})
		$(document).on("click",".modify",function(event){
			var cmtNum = $(this).parents(".cmtNum").attr("id");
			var cmtContent = $(this).parents(".cmtNum").children(".commentContent").html();
			console.log(cmtNum)
			$(".commentModify").addClass("none");
			$(".commentContent").removeClass("none");
			$(this).parents(".cmtNum").children(".commentContent").addClass("none");
			$(this).parents(".cmtNum").children(".commentModify").removeClass("none");
			var cmtModify = $(this).parents(".cmtNum").find(".commentModify form div textarea");
			var space = cmtContent.replace(/&nbsp;/gi," ");
			var result = space.split('<br>').join("\r\n");
			cmtModify.val(result);
		})
		
		$(document).on("click",".modifyButton",function(event){
			var cmtNum = $(this).parents(".cmtNum").attr("id");
			var cmtContent = $(this).parents(".cmtNum").find(".commentModify form div textarea").val();
			
			var space = cmtContent.replace(/ /gi,"&nbsp;");
			var lines = space.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			$.ajax({
				url:"comemntModify",
				method:"post",
				data: {
					cmtNum:cmtNum,
					cmtContent:lines
				},
				success:function(data){
						getComment();
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '수정을 실패하였습니다.',
						  showConfirmButton: false,
						  timer: 1500
							});
						}
				})		
		})
		
		$(document).on("click",".delete",function(event){
			var cmtNum = $(this).parents(".cmtNum").attr("id");
			Swal.fire({
				  title: '댓글을 삭제하시겠습니까?',
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네',
				  cancelButtonText: '아니요'
				}).then((result) => {
				  if (result.value) {
						$.ajax({
							url:"comemntDelete",
							method:"post",
							data: {
								cmtNum:cmtNum,
							},
							success:function(data){
								getComment();
							},
							error:function(a,b,errMsg){
								Swal.fire({
									  position: 'top',
									  type: 'error',
									  title: '삭제를 실패하였습니다.',
									  showConfirmButton: false,
									  timer: 1500
									});
							}
						})
				  }
				})						
		})
		
		$("#writeComment").click(function(){
			$("#writeArea").removeClass("none");
			$("#HR").removeClass("none");
		})
		
		$("#writeCancel").click(function(){
			$("#writeArea").addClass("none");
			$("#HR").addClass("none");
		})
		
		$("#registration").click(function(){
			if(userId != ""){
				var content = $(this).siblings("textarea").val();
				var posNum = $("#content").attr("class");
				var space = content.replace(/ /gi,"&nbsp;");
				var lines = space.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$.ajax({
					url:"comemntAdd",
					method:"post",
					data: {
						posNum:posNum,
						content:lines
					},
					success:function(data){
							getComment();
							$("#writeArea div textarea").val("");
					},
					error:function(a,b,errMsg){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: '수정을 실패하였습니다.',
							  showConfirmButton: false,
							  timer: 1500
								});
							}
					})					
			}else{
				Swal.fire({
					  title: '로그인 이후 작성가능합니다.\n로그인하시겠습니까?',
					  type: 'info',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '네',
					  cancelButtonText: '아니요'
					}).then((result) => {
					  if (result.value) {
						window.location.href = "/shoppingmall/login";
					  }
					})		
			}
		})
</script>

</body>
</html>