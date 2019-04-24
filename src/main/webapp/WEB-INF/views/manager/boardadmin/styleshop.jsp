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
<style>
#AllContent {
	width: 500px;
}

.br {
	margin-top: 10px;
}

table tr td {
	border: 1px solid grey;
}
#newInput {
	padding: 10px 10px 30px 10px;
	border: 0px;
	resize: none;
	width: 100%;
}

.bottomTd {
	border-left: 1px solid grey;
	border-right: 1px solid grey;
	border-bottom: 1px solid grey;
	height: 35px;
}

.br strong {
	position: relative;
	left: 10px;
}

.remit {
	float: right;
	position: relative;
	right: 20px;
	bottom: 40px;
}

.remit span {
	position: relative;
	left: 10px;
	color: lightgrey;
}

.complete {
	float: right;
	width: 70px;
	margin-top: 10px;
}
textarea{
	width:500px !important;
	height:165px;
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
				<a href="styleshop" class="activeMenu"><span>스타일 숍 공지</span></a> 
				<a href="02.html"><span>고객센터 공지</span></a> 
				<a href="05.html"><span>커뮤니티</span></a>
				<a href="08.html"><span>상품 문의</span></a> 
				<a href="09.html"><span>1:1문의</span></a> 
				<a href="11.html"><span>상품평</span></a> 
				<a href="12.html"><span>자주하는 질문</span></a>
				<a href="13.html"><span>이벤트</span></a>
				<a href="16.html"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
			<div id="AllContent">
				<div id="menuBar">
					<p id="menuName">Board Managament</p>
					<p id="currentIdx">&#124; 주문관리 > 스타일 숍 주문</p>
				</div>
				<form>
					<select>
						<option>카테고리 선택</option>
						<c:forEach var = "option" items = "${categories}" varStatus = "state">
							<option>${option.godcName}</option>
						</c:forEach>
					</select> <br>
					<div class="br">
						<strong>신규 등록</strong>
						<div class="br">
							<table>
								<tr>
									<td><textarea id="newInput" onkeyup="chkword(this,100)"
											placeholder="내용을 입력하세요"></textarea></td>
								</tr>
								<tr>
									<td class="bottomTd"><label for="newInputCheck">모든
											카테고리에 동일하게 적용</label> <input id="newInputCheck" type="checkbox"
										name="newInputCheck" />
										<div class="remit">
											<span id = "currentByte">0자</span> <strong>/100자</strong>
										</div></td>
								</tr>
							</table>
							<button class="complete" type="button">완료</button>
						</div>
					</div>
					<br>
					<div class="br">
						<strong>수정</strong>
						<div class="br">
							<table>
								<tr>
									<td><textarea id="newInput" onkeyup="chkword(this,100)"
											placeholder="내용을 입력하세요"></textarea></td>
								</tr>
								<tr>
									<td class="bottomTd"><label for="newInputCheck">모든
											카테고리에 동일하게 적용</label> <input id="newInputCheck" type="checkbox"
										name="newInputCheck" />
										<div class="remit">
											<span id = "currentByte">0자</span> <strong>/100자</strong>
										</div></td>
								</tr>
							</table>
							<button class="complete" type="button">완료</button>
						</div>
					</div>
				</form>
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
    var current =  $(obj).parents("tr").next().find("span");
    console.log(current);
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