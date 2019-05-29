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
<style>
	a{
		color:black;
	}
	#searchBar{
		text-align:center;
		margin:10px 0px 60px 0px;
	}
	#searchBar input[type="text"]{
		display:inline;
		width:350px;
	}
	#searchBar select{
		display:inline !important;
		width:130px !important;
		position:relative;
		top:1px;		
	}
	#searchBar button{
		width:100px;
		position:relative;
		bottom:2px;
	}
	#detail{
		width:120px !important;
	}
	#detailBox{
		margin:20px 0px 20px 0px;
		padding:10px;
		background-color:#F2F5F7;
		border-radius:20px;
	}
	#input1,#input2{
		display:inline-block;
		width:120px !important;
	}
	#input1 input,#input2 input{
	  border: 1px solid #c4c4c4;
	  border-radius: 5px;
	  background-color: #fff;
	  padding: 3px 5px;
	  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
	  width: 120px !important;
	}
	[type="date"] {
	  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
	}
	[type="date"]::-webkit-inner-spin-button {
	  display: none;
	}
	[type="date"]::-webkit-calendar-picker-indicator {
	  opacity: 0;
	}
	#first div:first-child,
	#first div:last-child,
	#second div:first-child,
	#second div:last-child{
		display:inline-block;
		width:350px;
	}
	#first div:nth-child(2) input{
		display:inline-block;
		margin-right:10px;
		width:100px;
	}
	#first,#second{
		margin:10px;
	}
	#second div .form-control{
		display:inline-block;
	}
	#second div:first-child select{
		width:120px;
		text-align:center;
	}
	#second div:last-child input[type='number']{
		width:100px;
		margin-right:10px;
	}
	#second div:last-child input[type='radio']{
		margin-left:10px;
	}
	#third{
		margin-top:20px;
		text-align:center;
	}
	#third button{
		width:100px;
	}
	#searchNumber{
		margin:50px 0px 10px 10px;
	}
	#searchNumber select{
		display:inline-block;
		width:140px;
		margin-left:10px;
		position:relative;
		top:1px;		
	}
	#searchNumber .btn{
		width:100px;
		position:relative;
		bottom:2px;
	}
	.table-hover{
		margin-top:10px;
		margin-bottom:10px;
	}
	table tr th,
	table tr td{
		text-align:center;
	}
	#table button{
		width:50px;
		height:20px;
		padding:0;
		position:relative;
		left:10px;
	}
	#table tr:nth-child(1) th {
    border-top: 1px solid #878787;
    border-bottom:0;
	}
	#table tr td:not(:nth-child(2)) span,
	.modify,
	input[type='checkbox']{
		position:relative;
		top:10px;
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
	#pagination{
		margin-top:30px;
		text-align:center;
	}
	.pagination li a{
		border:0px;
	}
	#pagination > div > .pagination .active a{
		background-color:#F2F5F7;
		color:black;
		font-weight:bold;
	}
	.pagination .active a:active{
		background-color:grey;
	}
	#pagination .currentPage{
		color:#727272 !important;
		font-weight:bold;
	}
	#pagination a{
		color:#878787;
		margin-right:10px;
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
				</span> <span>상품 관리</span>
				<hr>
			</div>
			<div id="submenu">
				<a href="goodsRegister"><span>상품 등록</span></a> 
				<a href="goodsList" class = "activeMenu"><span>상품 목록</span></a> 
				<a href="categoryManagement"><span>카테고리 관리</span></a>
			</div>
		</div>
		<div id="content">
			<%@ include file = "../header/goodsadminheader.jsp" %>
		<div id = "AllContent">
			<div id = "menuBar">
				<p id = "menuName">Product Managament</p>
				<p id = "currentIdx">&#124; 상품 관리 > 상품 목록 > 스타일 숍</p>
				<hr>
			</div>
			<div id = "searchBox">
				<form action = "goodsListSearch1" method = "post">
				<div id = "searchBar">
						<select name = "SearchBar" class = "form-control">
							<option value = "1">이름</option>
						</select>
						<input type = "text" class = "form-control" name = "title" />
						<button class = "btn btn-default">검색</button>
					<button type = "button" id = "detail" class = "btn btn-default">상세 검색 열기<span class = "glyphicon glyphicon-triangle-bottom"></span></button>
				</div>
				<hr>
				<div id = "detailBox" class = "none">
					<div id = "first">
						<div>
							<span>상품 등록일</span>
							<div id = "input1">
								<input type="date" name="sdate" class="dateInput">
							</div>
							<span>~</span>
							<div id = "input2">
								<input type="date" name="edate" class="dateInput">	
							</div>						
						</div>
						<div>
							<span>판매 가격</span>
							<input class = "form-control" type = "number" name = "minPrice" />원
							<span>&nbsp; ~ &nbsp;</span>
							<input class = "form-control" type = "number" name = "maxPrice" />원
						</div>
					</div>
					<div id = "second">
						<div>
							<span>카테고리 선택</span>
							<select class = "form-control" name = "category">
								<option value = "0">1차 선택</option>
								<c:forEach var = "option" items = "${categories}">
									<option value = "${option.godcNum}">${option.godcName}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<span>진열 여부</span>
							<input type="radio" name="displayType" id="visible" class="custom-control-input" value = "진열">
							<label class="custom-control-label" for="visible">진열</label>
							<input type="radio" name="displayType" id=allsold class="custom-control-input" value = "품절">
							<label class="custom-control-label" for="allsold">품절</label>	
							<input type="radio" name="displayType" id=invisible class="custom-control-input" value = "숨김">
							<label class="custom-control-label" for="invisible">숨김</label>
						</div>
					</div>
					<div id = "third">
						<button class = "btn btn-default">검색</button>
					</div>
				</div>
				</form>
			</div>
			<div id = "searchNumber">
				<span>총 등록 상품 : ${cnt}개 / 검색된 상품 : ${SearchCnt}개</span>
			</div>
				<div>
					<table id = "table" class = "table table-hover">
						<thead>
							<tr>
								<th>
									<span>선택</span>
								</th>
								<th>
									<span>카테고리와 상품명</span>
								</th>
								<th>
									<span>판매 가격</span>
								</th>
								<th>
									<span>상태</span>
								</th>
								<th>
									<span>등록일</span>
								</th>
								<th>
									<span>조회수</span>
								</th>
								<th>
									<span>수정</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "goods" items = "${posts}" varStatus = "state">
							<tr>
								<td>
									<input id = "${goods.godNum}" type = "checkbox" />
								</td>
								<td>
									<span>${goods.godcName}</span>
									<br>
									<a href = "../../USER/GOODS/02.html" target = "_blank">${goods.godName}</a>
								</td>
								<td>
									<span><fmt:formatNumber value="${goods.godSellingPrice}" pattern="#,###" />원</span>
								</td>
								<td>
									<span>${goods.godDisplayType}</span>
								</td>
								<td>
									<span>${goods.godRegDate}</span>
								</td>
								<td>
									<span>${goods.godViewPoint}</span>
								</td>
								<td>
									<button id = "${goods.godNum}" class = "form-control modify">수정</button>
								</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
				<button id = "delete" class = "btn btn-default">삭제</button>
				<button id = "진열" class = "btn btn-default search">진열</button>
				<button id = "숨김" class = "btn btn-default search">숨김</button>
				<button id = "품절" class = "btn btn-default search">품절</button>
			</div>
 			<div id = "pagination">
				<div>
					<ul class = "pagination">
						<c:if test = "${pageMaker.prev}">
							<li><a href = "goodsList${type}${pageMaker.startPage-1}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
						</c:if>
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
							<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href = "goodsList${type}${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test = "${pageMaker.next}">
							<li><a href = "goodsList${type}${pageMaker.endPage+1}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
						</c:if>
					</ul>
				</div>		
			</div>
		</div>
	</div>
</div>

<script type = "text/javascript">
	$(".search").click(function(){
		var form = $("<form action = 'goodsListSearch1' method = 'post' style='display:none'></form>");
		var input1 = $("<input type = 'text' name = 'displayType'></input>");
		var input2 = $("<input type = 'text' name = 'title'></input>");
		var input3 = $("<input type = 'text' name = 'SearchBar'></input>");
		var input4 = $("<input type = 'text' name = 'sdate'></input>");
		var input5 = $("<input type = 'text' name = 'edate'></input>");
		var input6 = $("<input type = 'text' name = 'category'></input>");
		var input7 = $("<input type = 'text' name = 'minPrice'></input>");
		var input8 = $("<input type = 'text' name = 'maxPrice'></input>");
		input1.val($(this).prop("id"));
		input3.val("1");
		form.append(input1);
		form.append(input2);
		form.append(input3);
		form.append(input4);
		form.append(input5);
		form.append(input6);
		form.append(input7);
		form.append(input8);
		$("body").append(form);
		form.submit();
	})
	
	$(".modify").click(function(){
		location.href = 'goodsModify' + $(this).prop("id");
	})
	
	$("#delete").click(function(){
		var input = $("input[type='checkbox']:checked");
		var list = [];
		$.each(input,function(index,item){
			list[index] = $(item).prop("id");
		})
		var form = $("<form></form>");
		form.attr({
			action:"DeleteGoods",
			method:"post",
			style:"display:none"
		})
		var $input = $("<input></input>");
		$input.attr({
			type:"text",
			name:"list"
		})
		$input.val(list);
		form.append($input);
		$("body").append(form);
		form.submit();
	})
</script>

</body>
</html>