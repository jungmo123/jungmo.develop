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
	.commentContent{
		margin:10px 0px 50px 10px;
		line-height:25px;
	}
	.date{
		font-size:12px;
		color:#878787;
		font-weight:bold;
	}
	.commentContent form div button{
		position:relative;
		top:3px;
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
				<a href="community" class="activeMenu"><span>커뮤니티</span></a>
				<a href="08.html"><span>상품 문의</span></a> 
				<a href="09.html"><span>1:1문의</span></a> 
				<a href="11.html"><span>상품평</span></a> 
				<a href="12.html"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
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
		<hr>
		<div id = "commentDiv">
			<hr>
			<strong>작성된 댓글 (1개)</strong>
			<button class = "btn btn-default">작성</button>
			<button class = "btn btn-default">취소</button>
			<hr>
			<form>
				<div>
					<textarea cols = "85" rows ="3" placeholder = "- 최대 000자까지 작성할 수 있습니다(띄어쓰기 포함).
※욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
					<button class = "btn btn-default">등록</button>
				</div>
			</form>
			<div id = "commentDiv">
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
			<a href = "cic" class = "btn btn-default left">목록 보기</a>
			<button id = "pre" class = "btn btn-default left">이전글&nbsp;<span class = "glyphicon glyphicon-chevron-down" ></span></button>
			<button id = "next" class = "btn btn-default left">다음글&nbsp;<span class = "glyphicon glyphicon-chevron-up" ></span></button>
			<button class = "btn btn-default right"onclick="location.href='/shoppingmall/admin/cicWrite'">글쓰기</button>
			<c:if test = "${post.userId== admin}">
				<button id = "modify" class = "btn btn-default right">수정</button>
				<button id = "delete" class = "btn btn-default right">삭제</button>
			</c:if>
		</div>
	</div>
</div>
</div>

<script type = "text/javascript">
	$(function(){
		Date.prototype.format = function (f) {

		    if (!this.valueOf()) return " ";



		    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

		    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

		    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

		    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

		    var d = this;



		    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

		        switch ($1) {

		            case "yyyy": return d.getFullYear(); // 년 (4자리)

		            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

		            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

		            case "dd": return d.getDate().zf(2); // 일 (2자리)

		            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

		            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

		            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

		            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

		            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

		            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

		            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

		            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

		            default: return $1;

		        }

		    });

		};



		String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

		String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

		Number.prototype.zf = function (len) { return this.toString().zf(len); };		

		var posNum = "${post.posNum}"
		$.ajax({
			url:"getComment",
			method:"post",
			data: {
				posNum:posNum,
			},
			success:function(comments){
				$.each(comments,function(index,item){
					console.log(item);
					var div = document.createElement("div")
					div.setAttribute("id",item.cmtNum);
					div.setAttribute("class","cmtNum");
					var hr = document.createElement("hr");
					div.append(hr);
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
					date.innerHTML=item.cmtWritingDate;
					commentInfo.append(date);
					console.log(div);
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
		$(".modify").click(function(){
			var textdiv = $(this).closest("div").next();
			var text = $.trim($(this).closest("div").next().text());
			$(this).closest("div").next().text("");
			var form = $("<form></form>");
			var div = $("<div></div>");
			var textarea = $("<textarea></textarea>");
			var button = $("<button>수정</button>");
			form.attr({
				class:"modifyForm"
			})
			textarea.attr({
				cols:"85",
				rows:"3",
			})
			button.attr({
				class:"btn btn-default modifyButton",
				type:"button"
			})
			console.log(text);
			textarea.val(text);
			$(div).append(button);
			$(div).append(textarea);
			$(form).append(div);
			$(textdiv).append(form);
		})
		
		$(document).on("click",".modifyButton",function(event){
			var cmtNum = $(this).parents(".commentContent").closest(".cmtNum").attr("id");
			var cmtContent = $(this).siblings("textarea").val();
			console.log(cmtContent);
			
			var space = cmtContent.replace(/ /gi,"&nbsp;");
			var lines = space.replace(/\n/gi,"<br>");
			
			$.ajax({
				url:"comemntModify",
				method:"post",
				data: {
					cmtNum:cmtNum,
					cmtContent:lines
				},
				success:function(data){
					alert("성공");
					$("#commentDiv").text("");
					var div = document.createElement("div");
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
		})
</script>

</body>
</html>