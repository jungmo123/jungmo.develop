<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>소개</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
   .container{
      width:1000px;
      margin-top:30px;
      }
   .container > strong{
   		font-size:20px;
   }
   #nav{
      display:inline-block;
      width:160px;
      height:170px;
      border:1px solid grey;
      float:left;
      margin-right:25px;
   }
   #nav hr{
      margin:5px;
   }
   #nav #navTitle{
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
   
   #logo{
   width:180px;
   height:180px;
   margin-top:30px;
   float:left;
   margin-right:30px;
   }
   
   #info1{
   margin-top:30px;
   width:300px;
   float:left;
   }

   #info2{
   margin-left:180px;
   }
   #nav #navContent div > .activeMenu{
   color:red !important;
   }
   img{
   width:180px;
   height:180px;
   }
   
</style>
</head>
<body>
<div class="container">
    <div id = "nav">
         <div id="navTitle">
            <span>회사 소개</span>
         </div>
         <div id="navContent">
            <div>
               <a href = "aboutUs01" class = "activeMenu"><span>> 라라마켓</span></a>
               <a href = "aboutUs02"><span onclick = "location.href = 'aboutUs02'">> 찾아오시는 길</span></a>
               
            </div>
      </div>
   </div>
   
   <strong>&#124;&nbsp;라라마켓을 소개합니다.</strong>
   <hr>
   <h3><strong>"세련된 스타일, 알뜰한 소비! 둘다 포기하지 마세요!"</strong></h3>

     <div id="logo">
     <img src = "<c:url value = "/IMAGE/shp.PNG" />">
     </div>
     <div id="info1">
       <h5><strong>라라마켓이란?</strong></h5>
       <br>
       <p>유행에 따라가지 않는, </p>
       <p>나만의 멋을 연출할 수 있는</p>
       <p>옷들을 판매하는 곳입니다.</p>
     </div>
   </div>
   <div class = "container">
	   <div id="info2">
	      <h5><strong>스타일 숍에서 판매되는 옷들은?</strong></h5>
	      <br>
	      <p>스타일 숍에서 판매되는 옷은 모두 프랑스, 이탈리아에서 직수입한 고급 원단으로 제작했습니다. </p>
	      <p>구매 후 세탁하지 않아도 피부에 이상이 없는 천연 바이오 기술이 적용된 고급 소재입니다. </p>
	      <br>
	      <p>유럽의 패션 디자이너가 직접 디자인하여 착용감이 뛰어나고 관리가 용이합니다.</p>
	      <p>직접 생산하고 유통하여 불필요한 작업 단계를 줄였습니다. 저렴한 가격으로 상품을 구매해 보세요!</p>
	      <br>
	      <div>
	        <button class = "btn btn-default" onclick="location.href='../GOODS/01.html'">스타일 숍 바로가기</button>
	   </div>  
   </div>

</div>

</body>
</html>