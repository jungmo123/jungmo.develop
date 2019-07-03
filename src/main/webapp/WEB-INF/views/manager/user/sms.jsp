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
<script src = "<c:url value = "/js/AdminNav.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>
	.table-hover{
		margin-top:30px;
		margin-bottom:10px;
	}
	table tr th,
	table tr td{
		text-align:center;
	}
	table tr td:nth-child(3){
		width:165px;
	}
	table tr td:nth-child(4){
		width:130px;
	}
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	table tr{
		border:1px solid #F2F5F7;
	}
	table tr th{
		background-color:#F2F5F7;
	}
	tbody tr:last-child{
		border-bottom:1px solid #878787;
	}
	table tr td input,
	table tr td label{
		float:right;
		position:relative;
		top:50px;
	}
	table tr td input[type=checkbox]{
		margin:4px 0 0 4px;
	}
	#table tr td:nth-child(1){
		width:90px;
		line-height:119px;
	}
	#table tr td:nth-child(2){
		width:95px;
	}
	#table tr td:nth-child(2) span{
		position:relative;
		top:40px;
	}
	#table tr td:nth-child(3){
		width:400px;
	}
	#table tr td:nth-child(4){
		line-height:119px;
	}
	#table tr td:nth-child(5){
		line-height:115px;
	}
	#table tr td:nth-child(5) button{
		width:60px;
		height:25px;
		font-weight:bold;
		padding:0;
	}
	textarea{
		height:100px;
		resize:none;
		position:relative;
		top:10px;
	}
	#buttonBox{
		float:right;
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
				</span> <span>회원 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="userIdx"><span>회원 목록</span></a>
				<a href="leaveUserIdx"><span>탈퇴 회원 목록</span></a>
				<a href="mail"><span>메일 관리</span></a>
				<a href="sms" class = "activeMenu"><span>SMS 관리</span></a>
				<a href="bulkMailSending"><span>대량 메일 발송</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/userheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Member Managament</p>
				<p id = "currentIdx">&#124; 회원 관리 > SMS 관리</p>
			</div>
			<div id = "smsTable">
				<form>
					<table id = "table" class = "table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>발송시점</th>
								<th>발송 문구 및 자동 발송 설정</th>
								<th>수신자
								<th>수정</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</form>	
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	$(function(){
	 	$.ajax({
			url:"getSmsForm",
			method:"post",
			success:function(list){
				console.log(list);
				var tbody = $("tbody");
				for(var i = 0 ; i < list.length ; i++){
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>");
					td1.text(list[i].smsNum);
					tr.append(td1);
					var td2 = $("<td></td>");
					var span = $("<span></span>");
					span.text(list[i].smsSendingPoint);
					td2.append(span);
					tr.append(td2);
					var td3 = $("<td></td>");
					var textarea = $("<textarea></textarea>");
					textarea.attr({
						onkeyup:"chkword(this,80)"
					})
					textarea.text(list[i].smsContent);
					var checkbox = $("<input></input>");
					checkbox.attr({
						"type":"checkbox",
						"name":"auto",
						"id":list[i].smsNum,
					})
					if(list[i].smsAutomaticallySend == "예"){
						checkbox.prop("checked",true);
					}
					var label = $("<label></label>");
					label.attr({
						"for":list[i].smsNum
					})
					label.text("자동 발송 여부");
					td3.append(textarea);
					td3.append(checkbox);
					td3.append(label);
					tr.append(td3);
					var td4 = $("<td></td>");
					td4.text(list[i].smsAddressee);
					tr.append(td4);
					var td5 = $("<td></td>");
					var button = $("<button></button>");
					button.attr({
						"type":"button",
						"class":"btn btn-default",
						"id":"modifyButton"
					})
					button.text("수정완료");
					td5.append(button);
					tr.append(td5);
					tbody.append(tr);
				}
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '실패',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})		
	})
	
	$(document).on("click","#modifyButton",function(event){
		var smsNum = $(this).parents("tr").find("td:nth-child(1)").text();
		var smsContent = $(this).parents("tr").find("td:nth-child(3) textarea").val();
		var smsAutomaticallySend = $(this).parents("tr").find("td:nth-child(3) input[type='checkbox']").is(":checked");
	 	$.ajax({
			url:"modifySmsForm",
			method:"post",
			data: {
				smsNum:smsNum,
				smsContent:smsContent,
				smsAutomaticallySend:smsAutomaticallySend
			},
			success:function(list){
				Swal.fire({
					  position: 'top',
					  type: 'success',
					  title: '저장에 성공했습니다!',
					  showConfirmButton: false,
					  timer: 1500
					});
			},
			error:function(a,b,errMsg){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '저장에 실패했습니다!0',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		})
	})
	
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
			  title: maxByte/2 + '자를 초과할수는 없습니다.',
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