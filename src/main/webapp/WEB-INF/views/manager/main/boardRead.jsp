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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<script type="text/javascript" src= "../editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<style>
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

			</div>
		</div>
		<div id="content" class = "${post.posNum}">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 커뮤니티 > 커뮤니티 목록 > 상세 보기</p>
			</div>
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
			<button id = "modify" class = "btn btn-default right">수정</button>
			<button id = "delete" class = "btn btn-default right">삭제</button>
		</div>
	</div>
</div>
</div>

<script type = "text/javascript">
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
						var modify = document.createElement("button");
						modify.innerHTML="수정";
						modify.setAttribute("class","btn btn-default modify");
						commentInfo.append(modify);
						var del = document.createElement("button");
						del.innerHTML="삭제";
						del.setAttribute("class","btn btn-default delete");
						commentInfo.append(del);
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
			location.href="/shoppingmall/admin/cicRead${category}I${post.prec}I${post.preNum}";
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
				location.href="/shoppingmall/admin/cicRead${category}I${post.nextc}I${post.nextNum}";
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
		})
</script>

</body>
</html>