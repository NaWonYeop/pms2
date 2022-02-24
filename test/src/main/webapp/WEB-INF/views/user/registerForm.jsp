<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>로그인 폼</title>
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
	
	.login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
        margin-left: 30px;
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .check{
    	color : red;
    }
	 
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			
		</div>
      <form action="register" onsubmit="return formCheck()" method="post">
       
		<div class="card-body">
  
        <input type="text" name="id" id="id" class="form-control" placeholder="아이디" autofocus required>
        <button type="button" class="button button-contactForm btn_1" id="idCheck"
							onclick="isIdCheck()" value="NO">Check</button><BR>
        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"  required><br>
         <input type="password" name="pw1" id="pw1" class="form-control" placeholder="비밀번호 확인"  required><br>
          <input type="text" name="name" id="name" class="form-control" placeholder="이름"  required><br>
           <input type="text" name="tel" id="tel" class="form-control" placeholder="전화번호"  required><br>
        
         <p id="check" class="check">${login_msg}</p><br/>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="회원가입">
      </form>
		</div>
        <div class="links">
            <a href="memberRegist">회원가입</a>
        </div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		function isIdCheck() {
			if ($("#id").val() != '') {
				$.ajax({
					url : "IsIdCheck",
					type : "post",
					data : {
						"user_email" : $("#id").val()
					},
					dataType : "text",
					success : function(result) {
						if (result === 'false') {
							alert("이미 있는 이메일");
							$("#id").val('');
							$("#id").focus();

						} else {
							alert("사용가능한 이메일 입니다.");
							$("#idCheck").val("Yes");
							$("#idCheck").css('opacity', '0.5');
							//$("#id").css('opacity','0.5');
							$("#pw").focus()
						}
					}
				});

			} else {
				alert("ID 를 입력해 주세요");
				$("#id").focus();
			}
		}

		function formCheck() {
			if ($("idCheck").val() == 'No') {
				alert("이메일 중복 체크를 해주세요.")
				return false;
			}

			if ($("#pw").val() != $("#pw1").val()) {
				alert("패스워드가 일치하지 않습니다.");
				$("#pw").val('');
				$("#pw1").val('');
				$("#pw").focus();
				return false;
			}
			return true;
		}
	</script>
  </body>
</html>