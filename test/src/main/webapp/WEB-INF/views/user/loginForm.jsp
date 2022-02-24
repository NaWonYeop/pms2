<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>
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