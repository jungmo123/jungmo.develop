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
<script src = "<c:url value = "/js/NavigationGa.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style>
	body{
		color:#878787;
	}
	#deliveryPolicy{
		margin-top:20px;
	}
	#deliveryCharge{
		padding:10px;
	}
	#deliveryCharge input{
		width:80px;
	}
	#deliveryCharge p:nth-child(2) span:first-child{
		margin-right:13px;
	}
	#AddressDiv{
		width:400px;
		height:100px;
		overflow:auto;
	}
	#AddressForm{
		padding:10px;
	}
	#AddressForm p:nth-child(2){
		width:400px;
	}
	#AddressDiv{
		border:1px solid #727272;
		padding:5px;
		overflow:auto;
	}
	#add{
		position:relative;
		bottom:2px;
		float:right;
		padding:0;
		width:60px;
		height:28px;
	}
	#delete{
		margin-top:10px;
	}
	#pointPolicy{
		margin-top:20px;
	}
	#pointPolicy div:nth-child(2){
		padding:10px;
	}
	#pointPolicy div:nth-child(2) p:nth-child(1) input{
		width:80px;
	}
	#pointPolicy div:nth-child(2) p:nth-child(2) input{
		width:40px;
		margin-left:3px;
	}
	p span:first-child{
		font-weight:bold;
	}
	.deliveryGuide{
		margin-top:20px;
	}
	a{
		color:#878787;
	}
	.write{
		margin-top:20px;
		margin-left:10px;
	}
	.writeC{
		margin-top:20px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	.writeC ul{
		display:block;
		border-color:#878787;
	}
	.writeC ul .active{
		border-color:color:#878787;
	}
	.nav-tabs > li.active > a,
	.nav-tabs > li.active > a:focus,
	.nav-tabs > li.active > a:hover{
		border-left:1px solid #878787;
		border-top:1px solid #878787;
		border-right:1px solid #878787;
	}
	.nav-tabs > li > a:hover{
	  background-color: white !important;
  	  border-radius: 5px 5px 0px 0px;
  	  border-left:1px solid white;
	  border-top:1px solid white;
	  border-right:1px solid white;
	  border-bottom:1px solid #878787;
      color:#000;
	} 
	textarea:focus {
		outline:none;
	}
	.tab-content{
		width:100%;
	}
	.tab-content textarea{
		border-top:0px;
		border-left:1px solid #878787;
	  	border-right:1px solid #878787;
	 	border-bottom:1px solid #878787;
	 	border-bottom-right-radius:10px;
	 	border-bottom-left-radius:10px;
	 	padding:10px;
		width:100%;
		height:100%;
		resize: none;
	}
	#buttonGroup{
		margin:25px;
		text-align:center;
	}
	#buttonGroup button{
		width:100px;
		margin:5px;
	}
	.aditorDiv{
		width:100%;
		height:40px;
		border-left:1px solid #878787;
		border-right:1px solid #878787;
		background-color:#F2F5F7;
		text-align:center;
		line-height:40px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
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
				</span> <span>상품 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="clause"><span>약관</span></a> 
				<a href="policy" class = "activeMenu"><span>정책</span></a> 
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/policyheader.jsp" %>
			<div id = "AllContent">
				<div id = "menuBar">
					<p id = "menuName">Policy Managament</p>
					<p id = "currentIdx">&#124; 기본 정책 관리> 정책 관리</p>
				</div>
				<form id = "registerForm">
				<div id = "deliveryPolicy">
					<strong>배송 정책</strong>
					<div id = "deliveryCharge">
						<p>
							<span>기본 배송료 : </span>
							<input type = "number" name = "basicFee" value = "${delivery.basicFee}"/><span>원</span>
						</p>
						<p>
							<span>무료 배송 : </span>
							<input type = "number" name = "freeDeliveryMp" value = "${delivery.freeDeliveryMp}" /><span>원 이상 구매시 무료 배송</span>
						</p>
					</div>
					<div id = "AddressForm">
						<p>
							<span>배송 불가지역</span>
						</p>
						<p>
							<input id = "ndaContent" type = "text" name = "address"  readonly/>
							<button type = "button" onclick="showPostcode()">우편번호 검색</button>
							<button id = "add" type = "button" class = " btn btn-default">추가</button>
							<input id="userPostcode" type="text" class="form-control" name="userPostcode" style='display:none'>
							<input id="userStreet" type="text" class="form-control" name="userStreet" style='display:none'>
							<input id="userDetailArea" type="text" class="form-control" name="userDetailArea" style='display:none'>
						</p>
						<div id = "AddressDiv">
								<c:forEach var = "nda" items = "${nda}">
									<p>
										<input type = "checkbox" />
										<span>[${nda.ndaPostCode}] ${nda.ndaStreet}</span>
									</p>
								</c:forEach>
						</div>
						<button id = "delete" type = "button" class = "btn btn-default">선택삭제</button>				
					</div>
				</div>
				<div id = "pointPolicy">
					<strong>포인트 정책</strong>
					<div>
						<p>
							<span>가입 포인트 :</span>
							<span>회원 가입 시 <input type = "number" name = "joinP" value = "${pp.joinPoint}" />원 적립</span>
						</p>
						<p>
							<span>구매 포인트 :</span>
							<span>구매 금액의 <input type = "number" name = "saveP" value = "${pp.savePointPercent}" />% 적립</span>
						</p>
					</div>
				</div>
			<div class = "deliveryGuide ">
				<strong>공통 배송 안내 등록</strong>
					<div class = "write">
						<div class = "writeC">
							<div class="tab-content">
								<textarea id = "deliveryInfo" name = "deliveryInfo"></textarea>
							</div>
						</div>
					</div>
			</div>
			<div class = "deliveryGuide ">
				<strong>공통 교환 및 반품 안내 등록</strong>
					<div class = "write">
						<div class = "writeC">
							<div class="tab-content">
								<textarea id = "serviceInfo" name = "serviceInfo"></textarea>
							</div>
						</div>
					</div>
			</div>
			</form>
			<div id = "buttonGroup">
				<button id = "save" class = "btn btn-default">저장</button>
				<button class = "btn btn-default">취소</button>
			</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	CKEDITOR.replace('deliveryInfo',{
	    toolbar: 'Full',
	    uiColor: '#F2F5F7',
	    height:'200px'
	});
	CKEDITOR.replace('serviceInfo',{
	    toolbar: 'Full',
	    uiColor: '#F2F5F7',
	    height:'200px'
	});
	CKEDITOR.config.language = 'ko';	
	
	var delivery = '${cmp.cmpDeliveryGuide}';
	CKEDITOR.instances.deliveryInfo.setData(delivery);	
	
	var exchange = '${cmp.cmpExchangeGuide}';
	CKEDITOR.instances.serviceInfo.setData(exchange);	

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
                document.getElementById("userDetailArea").focus();
                var postcode = $("#userPostcode").val();
                var street = $("#userStreet").val();
                $("input[name='address']").val("[" + postcode + "]" + " " + street);
            }
        }).open();
        if($("#userStreet-error").length > 0){
        	$(this).addClass("display","none");
        }
    }
    
    $("input[type='number']").change(function() { 
        var num = $(this).val() - 1; 
        if(typeof num !== "number" || num < 0) { 
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '음수는 입력할 수 없습니다!',
				  showConfirmButton: false,
				  timer: 1500
				});    		
            $(this).focus();
            $(this).val("");
            return false; 
        } 
    }); 
    
    $("#delete").click(function(){
    	$("#AddressDiv").find("input[type='checkbox']:checked").parents("p").remove();
    })
    
    $("#add").click(function(){
    	var content = $("#ndaContent").val();
    	if(content != ""){
    		var p = $("<p></p>");
			var input = "<input type = 'checkbox' />";
			var span = $("<span></span>");
			span.text(content);
			p.append(input);
			p.append(span);
			$("#AddressDiv").append(p);
			$("#ndaContent").val("");
    	}else{
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: '우편번호를 검색해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				});    		
    	}
    })
    
   $("#save").click(function(){
	   var text = "";
	   var basicFee = $("input[name='basicFee']").val();
	   var freeDeliveryMp = $("input[name='freeDeliveryMp']").val();
	   var nda = $("#AddressDiv").find("span");
	   var ndaList = [];
	   var joinP = $("input[name='joinP']").val();
	   var saveP = $("input[name='saveP']").val();
	   var delivery = CKEDITOR.instances.deliveryInfo.getData();
	   var service = CKEDITOR.instances.serviceInfo.getData();
		if(basicFee == ""){
			text = "기본 배송료를 입력하세요!";
		}else if(freeDeliveryMp == ""){
			text = "무료 배송기준을 입력하세요!";
		}else if(joinP == ""){
			text = "가입 포인트를 입력하세요!";
		}else if(saveP == ""){
			text = "적립 포인트를 입력하세요!";
		}else if(delivery == ""){
			text = "공통 배송 안내문을 작성하세요!";
		}else if(service == ""){
			text = "공통 교환 및 반품 안내문을 작성하세요!";
		}
		
		if(nda.length != 0){
			$.each(nda,function(index,item){
				ndaList.push($(item).text());
			})
		}
		
		if(text != ""){
			Swal.fire({
				  position: 'top',
				  type: 'error',
				  title: text,
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}else{
			var formData = new FormData($("#registerForm")[0]);
			formData.append('ndaList',ndaList);
			formData.append('delivery',delivery);
			formData.append('service',service);
			$.ajax({
				url:"ModifyPolicy",
				data: formData,
				processData:false,
				contentType:false,
				type:'POST',   
				success:function(data){
					console.log("성공");
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '실패하였습니다.',
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