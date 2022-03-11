<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>로그인 폼</title>
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

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">

	<div class="card align-middle" style="width: 25rem;">
		<div class="card-title" style="margin-top: 30px;"></div>
		<form action="register" onsubmit="return formCheck()" method="post">

			<div class="card-body">
				<input type="text" name="user_email" id="user_email"
					title="이메일주소에 @가 없습니다" class="form-control col-8 "
					style="display: inline-block;" placeholder="아이디" autofocus required>
				<button type="button" class="button button-contactForm btn_1 col-3"
					id="idCheck" style="margin-left: 20px; margin-bottom: 20px"
					onclick="nomalIdCheck()" value="NO">Check</button>
				<BR> <input type="password" name="user_pwd" id="user_pwd"
					class="form-control" placeholder="비밀번호" required> <br>
					
				<input type="password" name="pw1" id="pw1" class="form-control"
					placeholder="비밀번호 확인" required> <br> <input
					type="text" name="user_name" id="user_name" class="form-control"
					placeholder="이름" required><br> 
					<div class="row">
					<select id="user_tel" name="user_tel" class="form-control col-3">
					<option value="">::선택::</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
					<option value="010">010</option>
				</select>&nbsp;&nbsp;-<input type="text" class="form-control col-3" id="user_tel" name="user_tel" maxlength="4" size="4"
					onkeypress="onlyNumber();" class="1" />
					&nbsp;&nbsp;-<input type="text" id="user_tel" name="user_tel"  
					size="4" maxlength="4" class="form-control col-3" /></div><br><br>
					<input
					id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit"
					value="회원가입">
			</div>
		</form>
	</div>


	<script type="text/javascript">
		function nomalIdCheck() {
			if ($("#user_email").val() != '') {
				$.ajax({
					url : "nomalIdCheck",
					type : "post",
					data : {
						"user_email" : $("#user_email").val()
					},
					dataType : "text",
					success : function(result) {
						if (result === 'false') {
							console.log(result)
							alert("이미 있는 이메일");

							$("#user_email").val('');
							$("#user_email").focus();

						} else if (result === 'Fail') {
							alert("@가 포함되어있지 않습니다")
							$("#idCheck").val('');
							$("#idCheck").focus();
						}

						else {
							alert("사용가능한 이메일 입니다.");
							$("#idCheck").attr("disabled", true);
							$("#user_email").attr("readonly", true);
							$("#idCheck").val("Yes");
							$("#idCheck").css('opacity', '0.5');
							$("#user_pwd").focus()
						}
					}
				});

			} else {
				alert("ID 를 입력해 주세요");
				$("#user_email").focus();
			}
		}

		function formCheck() {
			if ($("idCheck").val() == 'No') {
				alert("이메일 중복 체크를 해주세요.")
				return false;
			}

			if ($("#user_pwd").val() != $("#pw1").val()) {
				alert("패스워드가 일치하지 않습니다.");
				$("#user_pwd").val('');
				$("#pw1").val('');
				$("#user_pwd").focus();
				return false;
			}
			return true;
		}

		// 1. 숫자만 입력받게 하는 방법
		function onlyNumber() {
			if ((event.keyCode < 48) || (event.keyCode > 57))
				event.returnValue = false;
		}

		function CheckForm() {
			if (document.getElementById("txtMobile1").value == "") {
				window.alert("휴대폰 번호를 선택하시오.");
				return false;
			}
			if (document.getElementById("txtMobile2").value.length != 4) {
				window.alert("가운데 번호는 4자리로 입력하세요");
			}
		}
	</script>
</body>
</html>