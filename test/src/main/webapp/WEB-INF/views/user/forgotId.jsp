<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <title>아이디 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #e4932b;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
 
    


    a{ 
    	color: #f58b34; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .checks{
    	color : red;
    }
    </style>
  </head>
   
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem; margin-top: 5%; margin-bottom: 15%;">
		<div class="card-title" style="margin-top:30px;">
		<h2 style="text-align: center;">아이디 찾기</h2>
            
			
		</div>
        
		<div class="card-body">
      <form action="searchId" class="form-signin" method="POST">
        <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름" required><BR>
        <input type="text" pattern="[0-9]+" name="user_tel" id="user_tel" class="form-control" placeholder="연락처" required><br>
        <button id="btn-Yes" class="btn_1" style="width: 100%;" type="submit">아이디 찾기</button>
      </form>
      
		</div>
        <div class="links">
            <a href=forgotPassword style="font-family: 'TmoneyRoundWindRegular';">비밀번호 찾기</a> | <a href="loginForm" style="font-family: 'TmoneyRoundWindRegular';">로그인</a> | <a href="registerForm" style="font-family: 'TmoneyRoundWindRegular';">회원가입</a>
        </div>
	</div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("로그인 결과");
		console.log('${idcheck}');
		if ('${idcheck}' != '') {
			var message = '${idcheck}';
			/* alert(message); */
			toastr.options = {
				"closeButton" : false,
				"debug" : false,
				"newestOnTop" : false,
				"progressBar" : true,
				"positionClass" : "toast-top-center",
				"preventDuplicates" : false,
				"onclick" : null,
				"showDuration" : "100",
				"hideDuration" : "1000",
				"timeOut" : "1500",
				"extendedTimeOut" : "1000",
				"showEasing" : "swing",
				"hideEasing" : "linear",
				"showMethod" : "fadeIn",
				"hideMethod" : "fadeOut"
			}
			toastr.warning('잘못된 정보입니다');
		}
	});
	</script>
  </body>
  
</html>