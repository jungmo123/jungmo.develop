<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>GOODS</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
		*{
			font-family: 'Noto Sans KR', sans-serif;
		}
	   .container{
	      width:1000px;
	      margin-top:30px;
	      }
	 	 .container #header{
			width:800px;
			margin-top:50px;
			text-align:center;
			position:relative;
			left:0px;
		}
      #section > div:first-child{
      	text-align:center;
      }
      #section > div > strong{
      	font-size: 20px;
      	position:relative;
		top:10px;
      }
      #section{
      	margin-top:20px;
      }
      #section hr{
      	margin-top:40px;
      }
	#nav{
      display:inline-block;
      width:160px;
      height:180px;
      border:1px solid grey;
      float:left;
      margin-right:25px;
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
      margin-bottom:20px;
      line-height:25px;
   }
   #nav #navContent div > a{
      display:block;
      padding-left:10px;
      color:black;
   }
   #nav #navContent > p{
      font-weight:bold;
   }
   <!-- -->
   #banner{
   width:800px;
   height:200px;
      border:1px solid black;
   }
   #register{
   width:800px;
   text-align:center;
   white-space:pre;
   } 
   #register p{
  	 line-height:30px;
   }
   #goods-list{
   width:800px;
   padding:10px;
   }
   #goods-list > #listOption{
    margin:30px 13px 30px 0px;
   	float:right;
   }
   #goods-list > #listOption >a{
   	color:black;
   }
   #item-list{
   	margin-top:80px;
   	margin-bottom:50px;
   	width:780px;
   }
   #item-list > .item{
   	cursor:pointer;
   }
   .item{
   margin-left:10px;
   margin-top:5px;
   display:inline-block;
   width:180px;
   height:380px;
   }
   .img{
   width:178px;
   height:250px;
   margin-bottom:20px;
    border:1px solid black;
   }
   .text1{text-decoration:line-thorough;}
	#section{
	width:900px;
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
</style>
<body>
<div class="container">
	<%@ include file = "../header/userheader.jsp" %>
     <div class = "center-block" id="section">
     <div>
     	<strong>${godc.godcName}</strong>
     </div>
   <hr>
     <div class = "center-block" id="register">
		<p>${godc.godcContent}</p>
     </div>
   </div>
   <div class = "center-block" id="goods-list">
   	<div id = "listOption">
     <a href="#">최신순</a> | 
     <a href="#">낮은 가격순</a> |
     <a href="#">높은 가격순</a>
     </div>
     <div id="item-list">
		<div class = "item" onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info1">
			<p>{상품 가격 표기}</p>
			<p>{상품명 표기}</p>
			<p>{상품 특징 100자 (2줄)}</p>
			<p>&nbsp; </p>
			</div>
		</div>
		<div class = "item"onclick="location.href='02.html';">
		<div class="img">
			</div>
			<div id="info2">
			<p>15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>
		</div>
		<div class = "item" onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info3">
			<p>15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info4">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
		<div class = "item"  onclick="location.href='02.html';">
			<div class="img">
			</div>
			<div id="info5">
			<p class="text1">15,000원</p>
			<p>기모 티셔츠</p>
			<p>깃털처럼 가벼운 것에 비해</p>
			<p>최고의 보온 효과!</p>
			</div>			
		</div>
			 <div id = "pagination">
				<div>
					<ul class = "pagination">
							<c:if test = "${pageMaker.prev}">
								<li><a href = "styleshop${godcNum}I${pageMaker.startPage-1}I${type}"><span class = "glyphicon glyphicon-chevron-left"></span></a>
							</c:if>
										
							<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
								<li <c:out value = "${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
									<a href = "styleshop${godcNum}I${idx}I${type}">${idx}</a>
								</li>
							</c:forEach>
				
							<c:if test = "${pageMaker.next}">
								<li><a href = "styleshop${godcNum}I${pageMaker.endPage+1}I${type}"><span class = "glyphicon glyphicon-chevron-right"></span></a>
							</c:if>
					</ul>
				</div>		
			</div>
 	  </div>
   </div>
</div>     
</body>
</html>