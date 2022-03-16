<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="contact-section section_padding">
		<div class="container">
			<div class="row justify-content-center"></div>
			<div class="row justify-content-center">

				<div class="col-lg-5">
					<form class="form-contact contact_form" action="home" method="post"
						id="contactForm" novalidate="novalidate">
						<div class="row justify-content-center">
							<h4 style="font-family: 'MinSans-Medium';">수정되었습니다. 감사합니다</h4>

						</div>
						<div class="col-sm-12 text-center">
							<button type="submit"
								class="button button-contactForm btn_1 w-50">메인페이지</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
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
	});
	</script>
</body>
</html>