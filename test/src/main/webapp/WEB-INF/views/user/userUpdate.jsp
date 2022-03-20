<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="2; url=home">
<title>Insert title here</title>
</head>
<body>
	<section class="blog_area section_padding">
		<div class="container">
			<div class="row" align="center">
				<!--project-->
				
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
<script type="text/javascript">
$(document).ready(function() {
	console.log("로그인 결과");
	console.log('${message}');
	if ('${message}' == '') {
		var message = '${message}';
		/* alert(message); */
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
		toastr.success('성공적으로 수정하였습니다');
	}
</script>
</html>