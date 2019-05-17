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
<style>
	#searchBar{
		margin-top:10px;
	}
	#searchBar select{
		display:inline-block;
		width:140px;
		margin-left:10px;
		position:relative;
		top:1px;		
	}
	#searchBar .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	table tr th:nth-child(1),
	table tr td:nth-child(1),
	table tr th:nth-child(2),
	table tr td:nth-child(2),
	table tr th:nth-child(3),
	table tr td:nth-child(3),
	table tr th:nth-child(4),
	table tr th:nth-child(5),
	table tr td:nth-child(5),
	table tr th:nth-child(6),
	table tr td:nth-child(6),
	table tr th:nth-child(7),
	table tr td:nth-child(7){
		text-align:center;
	}
	#table button{
		width:50px;
		height:20px;
		padding:0;
		position:relative;
		left:20px;
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
	#Cadd{
		float:right;
		width:110px;
	}
	#Cdelete{
		float:left;
		width:80px;
	}
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
	}
	.modal-content{
		width:500px;
	}
	#ctc .modal-header{
		border:0;
	}
	#ctc .modal-body{
		padding:0px 15px 0px 15px;
	}
	#ctc .modal-body #number{
		display:inline-block;
		width:50px;
		margin-right:30px;
	}
	#ctc .modal-body #name{
		display:inline-block;
		width:250px;
	}
	#ctc .modal-footer{
		border:0;
		text-align:center;
	}
	#ctc .modal-title{
		font-weight:bold;
	}
	#ctc hr{
		margin:5px;
	}
	#explain{
		margin-top:10px;
		text-align:center;
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
				<a href="oneTwoOne"><span>1:1문의</span></a> 
				<a href="goodsReview"><span>상품평</span></a> 
				<a href="event"><span>이벤트</span></a>
				<a href="boardCategory" class="activeMenu"><span>게시판카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/boardadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Board Managament</p>
				<p id = "currentIdx">&#124; 게시판 관리 > 게시판 카테고리 관리</p>
			</div>
			<div id = "searchBar">
				<span>게시판 선택</span>
				<select id = "boardCategory" class = "form-control">
					<c:forEach var = "board" items = "${boards}" >
						<option value = "${board.borNum}">
							${board.borTitle}
						</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<table id = "table" class = "table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>순번</th>
							<th>등록일</th>
							<th>카테고리명</th>
							<th>코드</th>
							<th>등록자</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<button type = "button" id = "Cadd" class = "btn btn-default" data-toggle = "modal" data-target = "#ctc" >카테고리 생성</button>
				<button id = "Cdelete" class = "btn btn-default">선택삭제</button>
			</div>
		</div>
	</div>
</div>

	<div class = "modal fade" id  ="ctc">
		<div class = "modal-dialog modal-sm">
			<div class ="modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title">&#124;&nbsp;카테고리 생성</h4>
					<hr>
				</div>
				<div class = "modal-body">
					<div>
						<input id = "borNum"  name = "borNum" type = "number" style="display:none">
						<input id = "poscNum"  name = "poscNum" type = "number" style="display:none">
						<span>* 순번 : </span>
						<input id = "borcNum" name = "borcNum" type = "number" class = "form-control" />
						<input id = "currentBorcNum" name = "currentBorcNum" type = "number" class = "form-control" style="display:none" />		
						<span>* 카테고리명 : </span>
						<input id = "poscName" name = "poscName" type = "text" class = "form-control" />					
					</div>
					<div id = "explain">
						<span>순번은 숫자만 입력할 수 있으며,오름차순으로 정렬됩니다.</span>
					</div>
				</div>
				<div class ="modal-footer">
					<button type = "button" class = "btn btn-default add" data-dismiss = "modal">생성</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type = "text/javascript">
	var getBorc = function(list){
		$("tbody").text("");
		for(var i = 0 ; i < list.length ; i++){
			var tr = $("<tr></tr>");
			var td = $("<td></td>");
			var td1 = $("<td></td>");
			var td2 = $("<td></td>");
			var td3 = $("<td></td>");
			var td4 = $("<td></td>");
			var td5 = $("<td></td>");
			var td6 = $("<td></td>");
			var checkbox = $("<input></input>");
			var button = $("<button></button>")
			checkbox.attr({
				type:"checkbox",
				"class":list[i].poscNum
			});
			td.append(checkbox);
			tr.append(td);
			td1.text(list[i].borcNum);
			td1.attr({
				"class":"borNum"
			})
			tr.append(td1);
			td2.text(list[i].borcDate);
			tr.append(td2);
			td3.text(list[i].poscName);
			tr.append(td3);
			td4.text(list[i].poscNum);
			tr.append(td4);
			td5.text(list[i].userId);
			tr.append(td5);
			$("tbody").append(tr);
			button.attr({
				'class':"form-control borcModify",
				"id":list[i].poscNum,
				"data-toggle":"modal",
				"data-target":"#ctc"
			})
			button.text("수정");
			td6.append(button);
			tr.append(td6);
		}				
	}
	
		$(function(){
			var borNum = 1;
 			$.ajax({
				url:"getBoard",
				method:"post",
				data: {
					borNum:borNum
				},
				success:function(list){
					getBorc(list);
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
		})
	
		$("#boardCategory").change(function(){
			var borNum = $(this).val();
 			$.ajax({
				url:"getBoard",
				method:"post",
				data: {
					borNum:borNum
				},
				success:function(list){
					getBorc(list);
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
		})
		
		$("#Cadd").click(function(e){	
			$("#borNum").val($("#boardCategory").val());
			$("#borcNum").val("");
			$("#poscName").val("");
			$(".add").attr({
				"id":"add"
			})
		})
		
		$(document).on("click","#add",function(event){
			var borNum = $("#boardCategory").val();
			var borcNum= $("#borcNum").val();
			var poscName = $("#poscName").val();
			if($("tr").length == 21){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '최대 20개까지 생성가능합니다!',
					  showConfirmButton: false,
					  timer: 1500
					});
				return;
			}
 			$.ajax({
				url:"addBorc",
				method:"post",
				data: {
					borNum:borNum,
					borcNum:borcNum,
					poscName:poscName
				},
				success:function(list){
					getBorc(list);
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '모든 값을 입력해주세요.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})			
		})
		
		$("#Cdelete").click(function(){
			var input = $("td input:checked");
			var borNum = $("#boardCategory").val();
			var list = [];
			$.each(input,function(index,item){
				list[index] = $(item).prop("class");
			})
			if(list.length == 0){
				Swal.fire({
					  position: 'top',
					  type: 'error',
					  title: '삭제할 카테고리를 선택하세요!',
					  showConfirmButton: false,
					  timer: 1500
					});				
			}else{
	 			$.ajax({
					url:"deleteBorc",
					method:"post",
					data: {
						borNum:borNum,
						list:list,
					},
					success:function(list){
						getBorc(list);
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
		$(document).on("click",".borcModify",function(event){
			$("#poscNum").val($(this).prop("id"));
			$("#borcNum").val("");
			$("#poscName").val("");
			$("#currentBorcNum").val($(this).parents("tr").find(".borNum").text());
			$(".add").attr({
				"id":"modify"
			})
		})

		$(document).on("click","#modify",function(event){
			var borNum = $("#boardCategory").val();
			var borcNum= $("#borcNum").val();
			var poscNum = $("#poscNum").val();
			var poscName = $("#poscName").val();
			var currentBorcNum = $("#currentBorcNum").val();
  			$.ajax({
				url:"modifyBorc",
				method:"post",
				data: {
					borNum:borNum,
					borcNum:borcNum,
					poscNum:poscNum,
					poscName:poscName,
					currentBorcNum:currentBorcNum
				},
				success:function(list){
					getBorc(list);
				},
				error:function(a,b,errMsg){
					Swal.fire({
						  position: 'top',
						  type: 'error',
						  title: '모든 값을 입력해주세요.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			})
		})
	</script>

</body>
</html>