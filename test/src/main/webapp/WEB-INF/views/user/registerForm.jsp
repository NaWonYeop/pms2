<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<form action="register" onsubmit="return formCheck()" method="post">
		<div class="form_group">
			<input type="email" id="id" name="id" placeholder="이메일">
			<button type="button" class="idCheckButton" id="idCheck" onclick="isIdCheck()" value="NO">중복체크</button>
		</div>
		
		<div class="form_group_row">
			<input type="password" id="pw" name="pw"
				placeholder="비밀번호">
		</div>
		<div class="form_group_row">
			<input type="password" id="pw1" name="pw1"
				required="required" placeholder="비밀번호 확인">
		</div>
		<div class="form_group">
			<input type="text" id="name" name="name" placeholder="이름">
		</div>
		<div class="form_group">
			<input type="tel" id="tell" name="tell" placeholder="전화번호">
		</div>
		<button type="submit">회원가입</button>
		<div>
			<a class="forgot" href="forgotPassword">비밀번호를 잊어버리셨나요?</a>
		</div>
		<div>
			<a href="loginForm">이미계정이있으신가요?</a>
		</div>
	</form>
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