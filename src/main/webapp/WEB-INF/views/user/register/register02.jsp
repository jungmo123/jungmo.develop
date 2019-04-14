<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
   .container{
      width:1000px;
   }
   #nav{
      display:inline-block;
      widht:150px;
      margin-top:30px;
      margin-right:30px;
      float:left;
   }
   .circle{
      width:80px;
      height:80px;
      border-radius:100%;
      border:1px solid #878787;
      text-align:center;
   }
   .circle span{
      position:relative;
      top:20px;
   }
   #circle2{
      background-color:#727272;
   }
   .icon{
      height:50px;
      text-align:center;
   }
   .glyphicon-menu-down{
      font-size:50px;
      color:#F2F5F7;
   }
   #content{
      margin-top:30px;
      display:inline-block;
      width:800px;
   }
   table tr td{
      border-top:1px solid grey;
      border-bottom:1px solid grey;
      padding:10px;
   }
   table tr td input[type='text'],
   table tr td input[type='password']{
      display:inline-block;
      width:120px;
      height:30px;
      margin-right:10px;
   }
   table tr td button{
      padding:0 !important;
      width:70px;
      height:30px;
      margin-right:10px;
      position:relative;
      bottom:2px;
   }
   table tr td:first-child{
      width:100px;
      text-align:center;
      border-right:1px solid grey;
   }
   table tr:nth-child(1) td:last-child,
   table tr:nth-child(2) td:last-child,
   table tr:nth-child(3) td:last-child{
      padding:10px 10px 0px 10px;
   }
   table tr td:last-child div{
      display:inline-block;
      font-size:12px;
   }
   #idFormDiv{
      position:relative;
      bottom:8px;
   }
   #passFormDiv{
      position:relative;
      top:8px;
   }
   table tr:nth-child(3) td:last-child{
      padding:0px 10px 10px 10px;
   }
   table tr:nth-child(4) td:last-child select{
      display:inline-block;
      width:120px;
      height:30px;
      font-size:12px;
   }
   table tr:nth-child(4) td:last-child span{
      margin-right:10px;
   }
   table tr:nth-child(5)  td:last-child input[type='number'],
   table tr:nth-child(5)  td:last-child select{
   		display:inline-block;
   		width:100px;
   }
   table tr:nth-child(6) td:last-child button{
   		width:120px;
   		height:30px;
   		position:relative;
   		bottom:3px;
   }
   table tr:nth-child(6) td:last-child div:last-child input{
   	width:255px;
   }
   #mailDiv{
      text-align:center;
      margin-top:10px;
   }
   #mailDiv span{
      color:#878787;
   }
   #qualification{
      margin-top:20px;
   }
   #qualification p{
      color:#878787;
   }
   #buttonGroup{
      text-align:center;
   }
   #buttonGroup button{
      width:90px;
      margin-top:10px;
      font-size:12px;
      padding:5px 5px 5px 5px;   
   }

</style>
</head>
<body>

   <div class  = "container">
      <div id = "nav">
         <div class = "circle" id = "circle1">
            <span>약관<br>동의</span>
         </div>
         <div class = "icon">
            <span class= "glyphicon glyphicon-menu-down"></span>
         </div>
         <div class = "circle" id = "circle2">
            <span>정보<br>입력</span>
         </div>
         <div class = "icon">
            <span class= "glyphicon glyphicon-menu-down"></span>
         </div>
         <div class = "circle" id = "circle3">
            <span>가입<br>완료</span>
         </div>
      </div>
      <div id = "content">
         <strong>&#124;&nbsp; 라라마켓 회원 가입 정보 입력</strong>
         <hr>
         <p>제품을 구매할 경우에는 '스타일 숍 회원'으로 가입하고<br>
         제품 구매 및 오픈 숍에서 자신의 제품을 판매할 경우에는 '오픈 숍 회원'으로 가입하세요.
         </p>
         <hr>
         <table>
            <tr>
               <td>
                  <span>이름</span>
               </td>
               <td>
                  <p>
                     <input class = "form-control" type = "text" name = "name" />
                     <span>한글로 5글자 이내로 입력해 주세요</span>
                  </p>
               </td>
            </tr>
            <tr>
               <td>
                  <span>아이디</span>
               </td>
               <td>
                  <div>
                     <div>
                        <input class = "form-control" type = "text" name = "name" />
                        <button class = "btn btn-default">중복 확인</button>
                        <p>{아이디 중복 확인 결과 표기}            
                     </div>
                     <div>
                        <div id = "idFormDiv">영문 숫자를 조합하여 6~20자 이내로 입력<br>(대소문자 구별.한글/특수문자 사용 불가)</div>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>비밀번호</span>
               </td>
               <td>
                  <div>
                     <div>
                        <input class = "form-control" type = "password" name = "password" placeholder = "비밀번호 입력"/>
                        <input class = "form-control" type = "password" name = "passwordC" placeholder = "비밀번호 확인" />
                     </div>
                     <div>
                        <div id = "passFormDiv">영문,소문자를 조합<br>하여 8~20자 이내로 입력</div>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
                  <span>이메일</span>
               </td>
               <td>
                  <div>
                       <input class = "form-control" type = "text" name = "email1" />
                       <span>@</span>
                       <input id = "emailAddress" class = "form-control" type = "text" name = "email2" />
                       <select id = "selectEmail" class = "form-control">
                          <option>직접 입력</option>
                          <option>naver.com</option>
                          <option>daum.net</option>
                          <option>gmail.com</option>
                          <option>nate.com</option>
                          <option>yahoo.com</option>
                       </select>
                  </div>
               </td>
             </tr>
             <tr>
               <td>
              	 	<span>휴대폰 번호</span>
               </td>
               <td>
               	<div>
               		<select class = "form-control">
               			<option>010</option>
               			<option>011</option>
               			<option>016</option>
               			<option>017</option>
               			<option>018</option>
               			<option>019</option>
               		</select>
               		<span>&nbsp;-&nbsp;</span>
               		<input type = "number" class = "form-control" name = "phone2">
               		<span>&nbsp;-&nbsp;</span>
               		<input type = "number" class = "form-control" name = "phone3">
               	</div>
               </td>
             </tr>
             <tr>
             	<td>
             		<span>주소</span>
             	</td>
               <td>
               	<div>
               		<input id = "postcode"  type = "text" class = "form-control" name = "postcode" readonly>
               		<button class = "btn btn-default" onclick = "showPostcode()">우편번호 검색</button>
               	</div>
               	<div>
               		<input id = "homeAddress" type = "text" class = "form-control" name = "homeAddress">
               		<input id = "detailAddress" type = "text" class = "form-control" name = "detailAddress">
               	</div>
               </td>
            </tr>
         </table>
         <div id = "mailDiv">
            <input type = "checkbox" name = "mail" />
            <span>메일 수신(이벤트, 신상품 등 고객님께 혜택이 되는 소식을 알려드립니다.)</span>
         </div>
         <div id = "qualification">
            <p>- 오픈마켓에서 라라마켓을 검색하시면 제품을 구매할 수 있습니다.</p>
         </div>
         <div id = "buttonGroup">
              <button class = "btn btn-default" onclick="location.href='../MAIN/01.html'">확인</button>
              <button class = "btn btn-default" onclick="location.href='../MAIN/01.html'">취소</button>
         </div>
      </div>
   </div>
   
  <script>
    function showPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("homeAddress").value = extraAddr;
                
                } else {
                    document.getElementById("homeAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("homeAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();    
    }
    
	$("#selectEmail").change(function(){
		var selectEmail = $("#selectEmail option:selected").val();
		if(selectEmail != '직접 입력'){
		var emailAddress = $("#emailAddress").val(selectEmail);
		emailAddress.attr("readonly",true);
	}else{
		var emailAddress = $("#emailAddress").val("");
		emailAddress.attr("readonly",false);
	}
})
</script>

</body>
</html>