<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.util.Map" %>
<%@ page import= "jungmo.shoppingmall.user.register.domain.Clause" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	List<Clause> clauses = (List<Clause>)session.getAttribute("clauses");
	Map<String,String> values;
	
	List<Map<String,String>> names = new ArrayList<>();
	if(clauses != null){
		for(int i = 0 ; i < clauses.size() ; i++){
			String str =(String)request.getParameter(String.valueOf(clauses.get(i).getClsNum()));
			values =  new HashMap<>();
			if(str != null){
				str = "Y";
			}else{
				str = "N";
			}
			values.put(String.valueOf(clauses.get(i).getClsNum()), str);
			names.add(i,values);
		}
		session.setAttribute("names", names);
	}else{
		response.sendRedirect("register01");
	}
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script src = "https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	width: 1000px;
}

#nav {
	display: inline-block;
	widht: 150px;
	margin-top: 30px;
	margin-right: 30px;
	float: left;
}

.circle {
	width: 80px;
	height: 80px;
	border-radius: 100%;
	border: 1px solid #878787;
	text-align: center;
}

.circle span {
	position: relative;
	top: 20px;
}

#circle2 {
	background-color: #727272;
}

.icon {
	height: 50px;
	text-align: center;
}

.glyphicon-menu-down {
	font-size: 50px;
	color: #F2F5F7;
}

#content {
	margin-top: 30px;
	display: inline-block;
	width: 800px;
}

table tr td {
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	padding: 10px;
}

table tr td input[type='text'], table tr td input[type='password'] {
	display: inline-block;
	width: 120px;
	height: 30px;
	margin-right: 10px;
}

table tr td button {
	padding: 0 !important;
	width: 70px;
	height: 30px;
	margin-right: 10px;
	position: relative;
	bottom: 2px;
}

table tr td:first-child {
	width: 100px;
	text-align: center;
	border-right: 1px solid grey;
}

#idFormDiv {
	position: relative;
	bottom: 8px;
}

#passFormDiv {
	position: relative;
	top: 8px;
}
table tr:not(:nth-child(6)) td div{
	display:inline-block;
	float:left;
	font-size:12px;
}
table tr:nth-child(1) td:last-child div:first-child,
table tr:nth-child(2) td:last-child div:first-child,
table tr:nth-child(3) td:last-child div:nth-child(1),
table tr:nth-child(3) td:last-child div:nth-child(2),
table tr:nth-child(4) td:last-child div:nth-child(1),
table tr:nth-child(4) td:last-child div:nth-child(3),
table tr:nth-child(4) td:last-child div:nth-child(4){
	width:130px;
}
table tr:nth-child(1) td:last-child div:last-child{
	width:200px;
}
table tr:nth-child(2) td:last-child div:nth-child(2){
	width:100px;
	position:relative;
	top:2px;
}
table tr:nth-child(2) td:last-child div:nth-child(3){
	width:300px;
	line-height:100%;
}
table tr:nth-child(2) td:last-child div:nth-child(3){
	width:300px;
	line-height:100%;
}
table tr:nth-child(4) td:last-child div:nth-child(2){
	width:23px;
	line-height:25px;
}
table tr:nth-child(4) td:last-child div:nth-child(4) select{
	height:30px;
	padding:0px 0px 0px 10px;
	font-size:12px;
}
table tr:nth-child(5) td:last-child div:nth-child(1) select{
	height:30px;
	padding:0px 0px 0px 10px;
}
table tr:nth-child(5) td:last-child div:nth-child(3) input,
table tr:nth-child(5) td:last-child div:nth-child(5) input{
	width:101px;
	height:30px;
	text-align:center;
}
table tr:nth-child(5) td:last-child div:nth-child(2),
table tr:nth-child(5) td:last-child div:nth-child(4){
	line-height:25px;
}
table tr:nth-child(5) td:last-child div:nth-child(2),
table tr:nth-child(5) td:last-child div:nth-child(4){
	line-height:25px;
}
table tr:nth-child(6) td:last-child div:nth-child(1){
	margin-bottom:3px;
}
table tr:nth-child(6) td:last-child div:nth-child(1) a{
	width:80px;
	padding:0;
	font-size:12px;
	margin-bottom:5px;
}
table tr:nth-child(6) td:last-child div:nth-child(2),
table tr:nth-child(6) td:last-child div:nth-child(3){
	float:left;
	width:255px;
	display:inline-block;
	margin-right:10px;
}
table tr:nth-child(6) td:last-child div:nth-child(2) input,
table tr:nth-child(6) td:last-child div:nth-child(3) input{
	width:255px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#mailDiv {
	text-align: center;
	margin-top: 10px;
}

#mailDiv span {
	color: #878787;
}

#qualification {
	margin-top: 20px;
}

#qualification p {
	color: #878787;
}

#buttonGroup {
	text-align: center;
}

#buttonGroup button {
	width: 90px;
	margin-top: 10px;
	font-size: 12px;
	padding: 5px 5px 5px 5px;
}
#overlabCK{
	display:none;
}
</style>
</head>
<body>

	<div class="container">
		<div id="nav">
			<div class="circle" id="circle1">
				<span>약관<br>동의
				</span>
			</div>
			<div class="icon">
				<span class="glyphicon glyphicon-menu-down"></span>
			</div>
			<div class="circle" id="circle2">
				<span>정보<br>입력
				</span>
			</div>
			<div class="icon">
				<span class="glyphicon glyphicon-menu-down"></span>
			</div>
			<div class="circle" id="circle3">
				<span>가입<br>완료
				</span>
			</div>
		</div>
		<div id="content">
			<strong>&#124;&nbsp; 라라마켓 회원 가입 정보 입력</strong>
			<hr>
			<p>
				제품을 구매할 경우에는 '스타일 숍 회원'으로 가입하고<br> 제품 구매 및 오픈 숍에서 자신의 제품을 판매할
				경우에는 '오픈 숍 회원'으로 가입하세요.
			</p>
			<hr>
			<input id = "overlabCK" type = "checkbox">
			<form id = "registerForm" action = "register03" method = "post">
				<table>
					<tr>
						<td><span>이름</span></td>
						<td>
							<div>
								<input class="form-control" type="text" name="userName" />
							</div>
							<div>
								 <span>한글로 5글자 이내로 입력해 주세요</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><span>아이디</span></td>
						<td>
							<div>
								<input id = "userId" class="form-control" type="text" name="userId" />
							</div>
							<div>
								<button id = "overlap" class="btn btn-default">중복 확인</button>
								<p></p>
							</div>
							<div>
								<span>
									영문 숫자를 조합하여 6~20자 이내로 입력<br>(대소문자 구별.한글/특수문자 사용 불가)
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><span>비밀번호</span></td>
						<td>
							<div>
								<input id = "password" class="form-control" type="password" name="userPwd" placeholder="비밀번호 입력" />
							</div>
							<div>
								<input class="form-control" type="password" name="confirmpassword" placeholder="비밀번호 확인" />								
							</div>
							<div>
								<span>영문,소문자를 조합<br>하여 8~20자 이내로 입력</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><span>이메일</span></td>
						<td>
							<div>
								<input class="form-control" type="text" name="email1" />
							</div>
							<div>
								<span>@</span>			
							</div>
							<div>
								<input id="emailAddress" class="form-control" type="text" name="email2" />
							</div>
							<div>
								<select id="selectEmail" class="form-control">
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
						<td><span>휴대폰 번호</span></td>
						<td>
							<div>
								<select class="form-control" name = "phone1">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
							</div>
							<div>
								<span>&nbsp;-&nbsp;</span>
							</div>
							<div>
								<input id = "phone2" type="number" class="form-control" name="phone2"> 
							</div>
							<div>
								<span>&nbsp;-&nbsp;</span>
							</div>
							<div>
								<input id = "phone3" type="number" class="form-control" name="phone3">
							</div>
						</td>
					</tr>
					<tr>
						<td><span>주소</span></td>
						<td>
							<div>
								<input id="userPostcode" type="text" class="form-control"
									name="userPostcode" readonly>
								<a class="btn btn-default" onclick="showPostcode()">우편번호
									검색</a>
							</div>
							<div>
								<input id="userStreet" type="text" class="form-control" name="userStreet" readonly>
							</div>
							<div>
								<input id="userDetailArea" type="text" class="form-control" name="userDetailArea" >
							</div>
						</td>
					</tr>
				</table>			
				<div id="mailDiv">
					<input type="checkbox" name="userMailAgreement" /> <span>메일 수신(이벤트, 신상품 등
						고객님께 혜택이 되는 소식을 알려드립니다.)</span>
				</div>
			<div id="qualification">
				<p>- 오픈마켓에서 라라마켓을 검색하시면 제품을 구매할 수 있습니다.</p>
			</div>
			<div id="buttonGroup">
				<button class="btn btn-default" type = "submit">확인</button>
				<button id = "cancel" class="btn btn-default">취소</button>
			</div>
			</form>
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
                    document.getElementById("userStreet").value = extraAddr;
                
                } else {
                    document.getElementById("userStreet").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userPostcode').value = data.zonecode;
                document.getElementById("userStreet").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userStreet-error").style.display="none";
                document.getElementById("userDetailArea").focus();
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

	$.validator.addMethod(
		"usernameck",
		function(value,element){
			$("#overLapcheck").prop("checked",false);
			return this.optional(element)
				|| /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(value);
		}
	);

	$(function() {
			$("#registerForm").validate({
				rules : {
					userName : {
						required : true,
						minlength : 2,
						maxlength : 5,
						usernameck : true
					},
					userId : {
						required : true
					},
					userPwd : {
						required : true,
						minlength : 8
					},
					confirmpassword : {
						required : true,
						equalTo : "#password"
					},
					email1 : {
						required : true
					},
					email2 : {
						required : true
					},
					phone2 : {
						required : true,
						maxlength : 4,
					},
					phone3 : {
						required : true,
						maxlength : 4,
					},
					userStreet : {
						required : true
					},
					userDetailArea : {
						required : true
					}
				},
				messages : {					
					userName : {
						required : function(){
							return "이름을 입력하세요";
						},
						minlength : function(){
							return "2글자 이상으로 입력하세요."
						},
						maxlength : function(){
							return "5글자 이하로 입력하세요.";
						},
						usernameck : function(){
							return "한글로 입력하세요";
						}
					},
					userPwd : {
						required : function(){
							
							return "암호를 입력하세요";
						},
						minlength : function(){
							return "8글자 이상으로 입력하세요";
						}
					},
					confirmpassword : {
						required : function(){
							return "암호를 입력하세요.";
						},
						equalTo : function(){
							return "위 암호와 똑같이 입력하세요.";
						}
					},
					userId : {
						required : function(){
							return "아이디를 입력하세요.";
						}
					},		
					email1 : {
						required : function(){
							return "이메일 주소를 입력하세요.";
						}
					},
					email2 : {
						required : function(){
							return "이메일 주소를 입력하세요.";
						}
					},
					phone2 : {
						required : function(){
							return "번호를 입력하세요";
						},
						maxlength : function(){
							return "4자 이하로 입력";
						}
					
					},
					phone3 : {
						required : function(){
							return "번호를 입력하세요";
						},
						maxlength : function(){
							return "4자 이하로 입력";
						}
					},
					userStreet : {
						required : function(){
							return "우편번호를 검색하세요!";
						}
					},
					userDetailArea : {
						required : function(){
							return "상세 주소를 입력하세요 !";
						}
					}
				},
			})		
	});
	$("#userId").keyup(function(){
		$("#overlabCK").prop("checked",false);
		console.log($("#overlabCK").prop("checked"));
	})
	
	$("#selectEmail").change(function(){
		$("#emailAddress-error").css("display","none");
	})
	
	$("#overlap").click(function(e){
		e.preventDefault();
		
		if($("#userId").val() == ""){
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '아이디를 입력한 후 눌러 주세요!',
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}
		
		$.ajax({
			url:"overlap",
			method:"post",
			data: {
				userId:$("#userId").val(),
			},
			success:function(bl){
				if(bl == true){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '중복된 아이디입니다!',
						  showConfirmButton: false,
						  timer: 1500
						});
					$("#overlabCK").prop("checked",false);
				}else{
					Swal.fire({
						  position: 'top',
						  type: 'success',
						  title: '사용가능한 아이디입니다!',
						  showConfirmButton: false,
						  timer: 1500
						});
					$("#overlabCK").prop("checked",true);
				}
			},
			error:function(a,b,errMsg){
				console.log("실패" + errMsg);
			}
		})
	})
	
	$("#registerForm").submit(function(e){
		if($("#overlabCK").prop("checked")){
			
		}else{
			e.preventDefault();
			Swal.fire({
				  position: 'top',
				  type: 'warning',
				  title: '중복 검사를 완료하세요!',
				  showConfirmButton: false,
				  timer: 1500
				});					
		}
	})
	
	$("#cancel").click(function(e){
		e.preventDefault();
		Swal.fire({
			  title: '가입을 취소하시겠습니까?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.value) {
				window.location.href = "/shoppingmall/";
			  }
			})
	})

	
	
</script>

</body>
</html>