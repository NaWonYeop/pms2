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
		<a href="javascript:void(0)" onclick="kakaoLogin();"
			class="sign__logo"> <img
			src="./resources/images/kakao_login_medium" alt="">
		</a> <span class="sign__text"><a href="userSelect">아이디 찾기</a>
		<span title="비밀번호 찾기" id="find_pw_btn">비밀번호 찾기</span><a href="registerForm">회원가입</a></span>
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
		$(function(){
			$("#find_id_btn").click(function(){
				location.href = '../user/find_id';
			});
			$("#find_pw_btn").click(function(){
				location.href = '../user/find_pw';
			})
		})
	</script>

</body>
</html>