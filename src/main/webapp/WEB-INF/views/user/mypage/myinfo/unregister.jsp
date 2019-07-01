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
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		width:1200px;
		margin-top:30px;
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
	#navBar{
		display:inline-block;
		width:160px;
		height:470px;
		float:left;
	}
	#nav{
		width:160px;
		height:470px;
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
		margin-bottom: 10px;
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
	#tableDiv{
		display: inline-block;
		width:800px;
		margin-left:30px;
	}
	#mWGuide{
		width:600px;
		padding:10px;
		border:2px dotted red;
	}
	#mWGuide div{
		margin:10px 0 10px 0;
		padding:10px;
		line-height:25px;
	}
	#mWGuide div .glyphicon-ok{
		margin-right:5px;
	}
	#mWReason,
	#mWOpinion,
	#passwordInput{
		margin-top:20px;
	}
	#mWReason div,
	#mWOpinion div,
	#passwordInput div{
		margin-top:10px;
	}
	#mWReason div label{
		margin-right:16px;
	}
	#mWOpinion span{
		margin-left:200px;
	}
	#mWOpinion div textarea{
		width:600px;
		height:150px;
		resize:none;
	}
	#passwordInput input{
		width:130px;
	}
	#buttonGroup{
		width:600px;
		margin-top:20px;
		display:inline-block;
		text-align:center;
	}
	#buttonGroup button{
		width:60px;
		height:25px;
		padding:0;
		font-weight:bold;
	}
</style>
</head>
<body>

	<div class="container">
	<%@ include file = "../../header/mypageHeader.jsp" %>
	<div id = "content">
		<div id = "navbar">
			<div id="nav">
				<div id="navTitle">
					<span>마이 페이지</span>
				</div>
				<div id="navContent">
					<p>쇼핑 이용 정보</p>
					<hr>
					<div>
						<a href = "orderHistory1"><span>> 주문 내역</span></a>
						<a href = "cart"><span>> 장바구니</span></a>
						<a href = "pointLogs"><span>> 포인트 이용 내역</span></a>
					</div>
					<p>게시판 이용 내역</p>
					<hr>
					<div>
						<a href = "oneTwoOne"><span>> 1:1 문의</span></a>
						<a href = "goodsReview"><span>> 나의 상품평</span></a>
						<a href = "goodsQuestion"><span>> 나의 상품 문의</span></a>
					</div>
					<p>개인정보 수정</p>
					<hr>
					<div>
						<a href = "personalData"><span>> 개인정보 수정</span></a>
						<a href = "passwordModify"><span>> 비밀번호 변경</span></a>
					</div>
					<a href = "unregister" class= "activeMenu"><span>회원탈퇴</span></a>
				</div>
			</div>		
		</div>
			<div id = "tableDiv">
				<strong>&#124;&nbsp;회원 탈퇴</strong>
				<hr>
				<div id = "mWGuide">
					<strong>회원 탈퇴 안내</strong>
					<div>
						<span>
							${user.userName} 고객님! 지금까지 저희 쇼핑몰을 이용해 주셔서 감사합니다.<br>
							저희 쇼핑몰에 부족한 점이 있었다면 너그러운 양해 바라며, 아래의 사항을 확인하시고,<br>
							개선해야 할 점이 있다면 남겨 주세요!<br>
							더욱 고객님의 의견을 적극 반영하여 이용에 불편이 없도록 개선하겠습니다.
						</span>
					</div>
					<strong>회원 탈퇴 시 꼭 확인해 주세요!</strong>
					<div>
						<span class = "glyphicon glyphicon-ok"></span><span>사용하고 계신 아이디 ${user.userId}는 탈퇴할 경우 3개월 간 재사용이 불가능 합니다.</span>
						<br>
						<span class = "glyphicon glyphicon-ok"></span><span>탈퇴 이후 등록한 게시물,보유 포인트 등 이용기록이 모두 삭제 됩니다.</span>
					</div>
				</div>
				<div id = "mWReason">
					<strong>탈퇴 사유를 선택해 주세요!</strong>
					<div>
						<c:forEach var = "scd" items = "${scd}" varStatus = "state">
						<input type = "radio" name = "reason" id = "reason${scd.scdCode}" value = "${scd.scdCode}"/>
						<label for = "reason${scd.scdCode}">${scd.scdType}</label>	
						<c:if test = "${state.index == 2}">
						<br>
						</c:if>						
						</c:forEach>
					</div>
				</div>
				<div id = "mWOpinion">
					<strong>쇼핑몰 이용에 개선 사항이 있다면 의견을 남겨주세요!</strong>
					<span>0</span>자<strong> / 1,000자</strong>
					<div>
						<textarea id = "text" onkeyup="chkword(this,1000)"></textarea>
					</div>
				</div>
				<div id = "passwordInput">
					<strong>비밀번호 입력</strong>
					<div>
						<input id = "password" class = "form-control" type = "password" name = "password">
					</div>
				</div>
				<div id = "buttonGroup">
					<button class = "btn btn-default" id = "confirm">확인</button>
					<button class = "btn btn-default" onclick="location.href='../../MAIN/01.html'">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
    function chkword(obj, maxByte) {
    	 
        var strValue = obj.value;
        var strLen = strValue.length;
        var totalByte = 0;
        var len = 0;
        var oneChar = "";
        var str2 = "";
        var current =  $(obj).parents("#mWOpinion").find("span");
        if(strValue == ""){
        	$(current).text("0");
        }
 
        for (var i = 0; i < strLen; i++) {
            oneChar = strValue.charAt(i);
            if (escape(oneChar).length > 4) {
                totalByte += 2;
            } else {
                totalByte++;
            }
            $(current).text(totalByte);
            // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
            if (totalByte <= maxByte) {
                len = i + 1;
            }
        }
 
        // 넘어가는 글자는 자른다.
        if (totalByte > maxByte) {
            alert(maxByte + "자를 초과 입력 할 수 없습니다.");
            str2 = strValue.substr(0, len);
            obj.value = str2;
            chkword(obj, 4000);
        }
    }
    
    $("#confirm").click(function(){
    	var scdCode = $("input[name='reason']:checked").val();
    	var scdContent = $("#text").val();
    	var password = $("#password").val();
    	var text = "";
    	
    	if(scdCode == undefined){
    		text = "탈퇴 사유를 선택해 주세요!";
    	}else if(password == ""){
    		text = "비밀번호를 입력해 주세요!"
    	}
    	
    	if(text != ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: text,
				  showConfirmButton: false,
				  timer: 1500
				});	    		
    	}else{
			$.ajax({
				url:"addSecedeUser",
				data: {
					scdCode:scdCode,
					scdContent:scdContent,
					password:password,
				},
				method:"post",
				success:function(data){
					if(data == "true"){
						Swal.fire({
							  position: 'top',
							  type: 'success',
							  title: "탈퇴가 완료되었습니다",
							  showConfirmButton: false,
							  timer: 1500
							});		
						setTimeout(function() {
							location.href = "/shoppingmall/logout"	;
						}, 1600);				
					}else if(data == "false"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: "오류가 발생했습니다!",
							  showConfirmButton: false,
							  timer: 1500
							});							
					}else if(data == "error"){
						Swal.fire({
							  position: 'top',
							  type: 'error',
							  title: "오류가 발생했습니다",
							  showConfirmButton: false,
							  timer: 1500
							});								
					}
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: errMsg,
						  showConfirmButton: false,
						  timer: 1500
						});	
				}
			})   		
    	}
    })
	</script>
</body>
</html>