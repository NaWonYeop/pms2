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

<!-- Bootstrap CSS -->

<title>로그인 폼</title>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
	height: 100%;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">MY INFO</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">개인 정보 수정</h4>
						</div>
				</div>
			</div>
		</div>
	</section>

	<div class="card align-middle" style="margin-top: 15%; margin-bottom: 15%; width: 30%">
		<div class="card-title" style="margin-top: 30px;"></div>
		<form action="userUpdate" method="post" onsubmit="return formCheck()">
			<h2 style="text-align: center;">개인정보 수정</h2>
			<div class="card-body">
				<label>비밀번호</label>
				<input type="password" name="user_pwd" id="user_pwd"
					class="form-control" placeholder="8자리부터 16자리까지 특수문자 포함시켜주세요" required="required"><br>
				<label>비밀번호 확인</label>
				<input type="password" name="pw1" id="pw1" class="form-control"
					placeholder="비밀번호 확인"><br>
				<label>이름</label>
				<input type="text"
					name="user_name" id="user_name" class="form-control"
					placeholder="이름" required="required"
					value="${sessionUser.user_name}"><br>
				<label>전화번호</label>
				<input type="text" name="user_tel" id="user_tel"
					class="form-control" placeholder="새로운 전화번호" required="required"
					maxlength="11" value="${sessionUser.user_tel }"><br> 
					<label>이더리움 아이디</label>
					<input type="text" name="ether_id" id="ether_id"
					class="form-control" required="required"
					value="${sessionUser.ether_id }"><br> 
					<input
					id="btn-Yes" class="btn_1" type="submit" style="width: 100%;"
					value="회원수정">
					
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function formCheck() {

			var regPassword = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;

			if ($("#user_pwd").val() != $("#pw1").val()) {
				alert("패스워드가 일치하지 않습니다.");
				$("#user_pwd").val('');
				$("#pw1").val('');
				$("#user_pwd").focus();
				return false;
			}

			if (regPassword.test($("#user_pwd").val()) == false) {
				alert("조건에 맞게 입력해주세요")
				$("#user_pwd").val('');
				$("#user_pwd").focus();
				return false;
			}

		}
	</script>
</body>
</html>