
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>아이디 찾기</title>
<style>
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

.card-title {
	margin-left: 30px;
}

a {
	color: #f58b34;
	text-decoration: none;
}

.links {
	text-align: center;
	margin-bottom: 10px;
}

.checks {
	color: red;
}
</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">

	<div class="card align-middle" style="width: 25rem;">
		<div class="card-title" style="margin-top: 30px;"></div>

		<div class="card-body">
			<form action="searchPassword" class="form-signin" method="POST">
				<input type="text" name="user_name" id="user_name" class="form-control"
					placeholder="이름" required><BR> <input type="email"
					name="user_email" id="user_email" class="form-control" placeholder="이메일"
					required><br>
				<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
					type="submit">비밀번호 찾기</button>
			</form>

		</div>
		<div class="links">
			<a href="forgotId">아이디 찾기</a> | <a href="loginForm">로그인</a> | <a
				href="registerForm">회원가입</a>

		</div>
	</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(document).ready(function() {
	console.log("비밀번호 찾기 결과");
	console.log("${passwordFail}");
	if ("${passwordFail}" != '') {
		var message = "${passwordFail}";
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
		toastr.warning('올바른 비밀번호를 입력해주세요');
	}
});

</script>
</html>