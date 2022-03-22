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

<title>로그인 폼</title>
<style>


html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 200px;
	padding-bottom: 40px;

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
.row {
	position: relative;
	left: 15px;
}
</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">

	<div class="card align-middle" style="width: 25rem;">
		<div class="card-title" style="margin-top: 30px;"></div>
		<h2 style="text-align: center;">일반 회원가입</h2>
		<form action="register" onsubmit="return formCheck()" method="post">

			<div class="card-body">
				<input type="email" name="user_email" id="user_email"
					class="form-control col-8"
					style="display: inline-block;" placeholder="아이디">
				<button type="button" class="button button-contactForm btn_1 col-3"
					id="idCheck" style="margin-left: 20px; margin-bottom: 20px"
					onclick="nomalIdCheck()" value="NO">Check</button>
				<BR><input type="password" name="user_pwd" id="user_pwd"
					class="form-control" placeholder="8자리부터 16자리까지 특수문자 포함시켜주세요" required><br>
				<input type="password" name="pw1" id="pw1" class="form-control"
					placeholder="비밀번호 확인"><br>
					<input type="text" name="user_name" id="user_name" class="form-control"
					placeholder="이름" required autocomplete="off"><br> 
					<div class="row">
					<select id="user_tel1" name="user_tel1" class="form-control col-3" required="required">
					<option value="">::선택::</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
					<option value="010">010</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control col-3"  pattern="^[0-9]+$" id="user_tel2" name="user_tel2" maxlength="4" size="4"
					required="required"/>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="user_tel3" name="user_tel3"  
					size="4" maxlength="4" class="form-control col-3"  pattern="^[0-9]+$" required="required" /></div><br>
					
					<input type="hidden" id="user_tel" name="user_tel" value="NO">
					<input type="hidden" id="user_type" name="user_type" value="0" >
					<input type="text" id="ether_id" name="ether_id" placeholder="이더리움아이디" class="form-control"><br>
					<input
					id="btn-Yes" class="btn_1" style="width: 100%;" type="submit"
					value="회원가입">
			</div>
		</form>
	</div>


	<script type="text/javascript">
	
		function nomalIdCheck() {
			
			var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			  
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

						} else if (regEmail.test($("#user_email").val()) == false) {
							alert("이메일을 올바르게 입력해주세요")
							$("#user_email").val('');
							$("#user_email").focus();
						}
						else {	
							alert("사용가능한 이메일 입니다.");
							$("#idCheck").attr("disabled", true);
							$("#idCheck").val("Yes");
							$("#user_pwd").focus()
						}
					}
				});

			} else {
				alert("ID 를 입력해 주세요");
				$("#user_email").focus();
			}
		}
		user_email.oninput = function(){
			$("#idCheck").attr("disabled", false);
			$("#idCheck").val("NO");
		}
		
		function formCheck() {
						
			var regPassword = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;

			if ($("#idCheck").val() == 'NO') {
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
			
			if(regPassword.test($("#user_pwd").val()) == false){
				alert("조건에 맞게 입력해주세요")
				$("#user_pwd").val('');
				$("#user_pwd").focus();
				return false;
			}
			
			
			var check1 = document.getElementById('user_tel1').value;
			var check2 = document.getElementById('user_tel2').value;
			var check3 = document.getElementById('user_tel3').value;
			document.getElementById('user_tel').value = check1 + check2 + check3;
			return true;
		
		}
		
	</script>
</body>
</html>