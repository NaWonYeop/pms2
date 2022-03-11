<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {
	font-family: 'MinSans-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

</style>
</head>
<body>
	<section class="blog_area section_padding" id="name">
		<div class="container">
			<div class="row text-center">
				<!--project-->
				<h2 id="name" style="font-family:'MinSans-Medium';">${idcheck }</h2>&nbsp;&nbsp;&nbsp;&nbsp;
				<h2 style="font-family: 'MinSans-Medium';">비밀번호도 함께 찾고 싶으신가요?</h2>
				<h6>
					<a href="forgotPassword" style="font-family: 'MinSans-Medium';">비밀번호 재설정하기</a>
				</h6>
			</div>
		</div>
	</section>
</body>
</html>