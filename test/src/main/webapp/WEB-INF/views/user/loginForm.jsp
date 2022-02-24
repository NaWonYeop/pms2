<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
>>>>>>> refs/remotes/origin/0223-lsh
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
header {
	display: flex;
	justify-content: center;
}

form {
	padding: 10px;
}

.input-box {
	position: relative;
	margin: 10px 0;
}

.input-box>input {
	background: transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 100%;
}

input::placeholder {
	color: transparent;
}

input:placeholder-shown+label {
	color: #aaa;
	font-size: 14pt;
	top: 15px;
}

input:focus+label, label {
	color: #8aa1a1;
	font-size: 10pt;
	pointer-events: none;
	position: absolute;
	left: 0px;
	top: 0px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown) {
	border-bottom: solid 1px #8aa1a1;
	outline: none;
}

input[type=submit] {
	background-color: #8aa1a1;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 35px;
	font-size: 14pt;
	margin-top: 100px;
}

#forgot {
	text-align: right;
	font-size: 12pt;
	color: rgb(164, 164, 164);
	margin: 10px 0px;
}
</style>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<body>
<<<<<<< HEAD
	<header>
		<h2>Login</h2>
	</header>

	<form action="login" method="POST">


		<div class="input-box">
			<input id="username" type="text" name="username" placeholder="아이디">
			<label for="username">아이디</label>
		</div>

		<div class="input-box">
			<input id="pw" type="password" name="pw" placeholder="비밀번호">
			<label for="password">비밀번호</label>
		</div>
		<div id="forgot">비밀번호 찾기</div>
		<input type="submit" value="로그인"> <a href="javascript:void(0)"
			onclick="kakaoLogin();" class="sign__logo"> <img
			src="./resources/images/kakao_login_medium" alt="">
		</a>
		<a href="registerForm">회원가입</a>
	</form>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('89e07434a014632318c7cd9c2821e0a4'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>

	<form action="login" method="post">
		<div class="sign_group">
			<input type="email" class="sign_input" placeholder="이메일" id="email"
				name="email">
		</div>
		<div class="sign_group">
			<input type="password" class="sign_input" placeholder="비밀번호" id="pw"
				name="pw">
		</div>
		<button type="submit" class="sign_btn">로그인</button>
		<span class="sign__text">계정이 없으신가요? <a href="registerForm">회원가입</a></span>
	</form>

</body>
</html>