<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>찾아오시는 길</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ib2ojxbofb"></script>
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

	#content > div:nth-child(3){
		width:700px;
		height:400px;
		border:1px solid black;
	}
	#content > div:nth-child(4){
		margin-top:30px;
		overflow:hidden;
	}
	#content > div:nth-child(5){
		width:700px;
		height:110px;
		line-height:25px;
		margin-top:30px;
	}
	#content > div:nth-child(4) > div:first-child{
		display:inline-block;
		width:150px;
		float:left;
	}
	#content > div:nth-child(4) > div:last-child{
		display:inline-block;
		width:550px;
		float:left;
	}
	#content > div:nth-child(5) > div:first-child{
		display:inline-block;
		height:100px;
		margin-right:30px;
		float:left;
	}
	#content > div:nth-child(5) > div:first-child span{
		font-size:40px;
		position:relative;
		top:15px;
	}
	#content > div:nth-child(5) > div:last-child{
		display:inline-block;
		width:550px;
		float:left;
	}
	#content{
		margin-top:30px;
		margin-left:210px;
		width: 533px;
	}
	#content > strong{
		font-size:20px;
	}
	#nav #navContent div > .activeMenu{
		color:red !important;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<strong>&#124;&nbsp;찾아 오시는길</strong>
			<hr>
			<div id="map" style="width:534px;height:418px;"></div>
			<div>
				<div>
					<p><strong>주소</strong></p>
					<p><strong>자동차</strong></p>
					<p><strong>대중교통</strong></p>
				</div>
				<div>
					<p><span>서울시 영등포구 당산로 41길 11 SK V1 센터 W동 322호</span></p>
					<p><span>네비게이션 '당산 SK V1 센터' 검색</span></p>
					<p><span>지하철 2호선 당산역 11번 출구에서 도보 5분</span></p>
					<p><span>버스 000승강장에서 도보 10분</span></p>
				</div>
			</div>
			<div>
				<div>
					<span class = "glyphicon glyphicon-alert"></span>
				</div>
				<div>
					<span>주차 공간이 협소합니다. 가능한 한 대중교통을 이용해 주세요.</span>
					<br>
					<span>주차가 꼭 필요하신 분은 하루 전에 연락해 주시기 바랍니다.</span>
					<br>	
					<span>(문의: 00-0000-0000)</span>
				</div>
			</div>
		</div>
	</div>
<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.530797, 126.898362),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);


var markerOptions={
		position: new naver.maps.LatLng(37.530797, 126.898362),
		map:map
};
var marker=new naver.maps.Marker(markerOptions);
</script>
</body>
</html>