<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

}
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
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

#btn-Yes {
	background-color: #576EF2;
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

.checkbox {
	margin-right: 20px;
	text-align: right;
}

.card-title {
	margin-left: 30px;
}

.links {
	text-align: center;
	margin-bottom: 10px;
}

a {
	color: #f58b34;
	text-decoration: none;
}

.check {
	color: red;
}
</style>
</head>
<body>


	<div class="card align-middle" style="width: 25rem; margin-top: 5%;">

		<div class="card-title" style="margin-top: 30px;"></div>
		<h2 style="text-align: center;">아이디찾기 결과</h2>
		<div class="card-body">
			<input type="email" name="user_email" id="user_email"
				class="form-control" value="${idcheck}" style="text-align: center; "><BR>
		</div>
	</div>
	<div class="links" style="margin-bottom: 15%;">
		<a href="loginForm" style="font-family: 'TmoneyRoundWindRegular';">로그인</a> | <a href="forgotPassword" style="font-family: 'TmoneyRoundWindRegular';">비밀번호 찾기</a> |

	</div>
	<script>
		
	</script>


</body>
</html>