<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

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
		<h2 style="text-align: center;">로그인</h2>
		<form action="login" class="login" method="POST">

			<div class="card-body">

				<input type="email" name="user_email" id="user_email"
					class="form-control" placeholder="아이디" autofocus required><BR>
				<input type="password" name="user_pwd" id="user_pwd"
					class="form-control" placeholder="비밀번호" required><br>
				<input id="btn-Yes" class="btn btn-lg btn-primary btn-block"
					type="submit" value="로 그 인" style="margin-bottom: 10px;"> 
					 <a
					href="javascript:void(0)" onclick="kakaoLogin();"
					class="sign__logo"><img
					src="resources/images/kakao.png" alt=""></a>
			</div>
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>

	</div>

	<div class="links" style="margin-bottom: 15%">
		<a href="forgotId" style="font-family: 'TmoneyRoundWindRegular';">아이디 찾기</a> | <a href="forgotPassword" style="font-family: 'TmoneyRoundWindRegular';">비밀번호 찾기</a> |
		<a href="registerForm" style="font-family: 'TmoneyRoundWindRegular';">회원가입</a> |

	</div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('8132efdd09455dfc39e6ea6c32a19c1f'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response.kakao_account.email);	
							addEmail(response.kakao_account.email);
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

		$(document).ready(function() {
			console.log("로그인 결과");
			console.log('${loginFail}');
			if ('${loginFail}' != '') {
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
				toastr.error('로그인이 실패하였습니다');
			}
		});
		function addEmail(email){
			console.log(email+"확인해야함");
			 $.ajax({
					url : "IsIdCheck",
					type : "post",
					data : {
						"user_email" : email
					},
					dataType : "text",
					success:function(result){
						
						location.href = result;
					},
					error:function(reject){
						cosole.log(reject);
					}
						
				});

		}
	</script>


</body>
</html>