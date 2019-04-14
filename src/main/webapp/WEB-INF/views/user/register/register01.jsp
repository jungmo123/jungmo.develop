<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>JOIN</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
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
   #button{
   text-align:center;
   margin-bottom:30px;
   }
   
   .circle{
      width:80px;
      height:80px;
      border-radius:100%;
      border:1px solid #CCCCCC;
      text-align:center;
   }
   #circle1{
   background-color:lightgrey;
   }
   .circle span{
      position:relative;
      top:20px;
   }
   .icon{
      height:50px;
      text-align:center;
   }
   .glyphicon-menu-down{
      font-size:50px;
      color:#F2F5F7;
   }
   .agree{
      width:500px;
      height:80px;
      border:1px solid #878787;
   }
   
 #terms{
       margin-top:30px;
       margin-left:100px;
       float:left;
 }

</style>
<script>
$( document ).ready( function() {
    $( '.check-all' ).click( function() {
      $( '.mycheck' ).prop( 'checked', this.checked );
    } );
  } );
</script>
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
 <div id="terms">
   <h4>|라라마켓 서비스 약관 동의</h4>
   <hr>
   <form name='my_form'>
   <p>라라마켓 서비스 이용 약관 동의</p>
   <div class="agree" id="agree1">약관내용</div>
   <input type="checkbox" class="mycheck"/>동의함(필수)
   <br><br>
   <p>개인정보 처리방침 동의</p>
   <div class="agree" id="agree2"></div>
   <input type="checkbox" class="mycheck"/>동의함(필수)
   <br><br>
   <p>개인정보처리 위탁 동의</p>
   <div class="agree" id="agree3"></div>
   <input type="checkbox" class="mycheck"/>동의함(필수)
   <br><br>
   <p>마케팅 정보 제공 동의</p>
   <div class="agree" id="agree4"></div>
   <input type="checkbox" class="mycheck"/>동의함(선택)
   </form>
   
   <br>
   <form><input type="checkbox" class="check-all"/>모두 동의</form>
   <br><br><br>
   <div id="button">
   <button class="btn btn-default" onclick="location.href='register02'"> 다음 </button>
   <button class="btn btn-default"> 취소 </button>
   </div>
</div>
</div>
 
</body>
</html>