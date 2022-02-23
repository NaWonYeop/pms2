<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>이름</label>
					<input class="w3-input" type="text" id="id" name="id" placeholder="본인의 이름을 입력하세요" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="email" name="email" placeholder="이메일주소를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
					<a href="loginForm">로그인</a>
				</p>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/user/findpw",
				type : "POST",
				data : {
					user_name : $("#id").val(),
					user_email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
</body>
</html>