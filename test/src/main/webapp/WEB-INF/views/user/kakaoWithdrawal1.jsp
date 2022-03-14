 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- ================ 바디부분 ================= -->
	<section class="contact-section section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">

						<h2>회원탈퇴</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">

				<div class="col-lg-5">
					<form class="form-contact contact_form"
						action="kakaoWithdrawa2" method="post" id="contactForm"
						novalidate="novalidate">
						<div class="row ">

							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control" name="user_email" id="user_email" type="text"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '이메일을 입력해 주세요.'"
										placeholder='이메일을 입력해 주세요.'>
								</div>
							</div>
							<div class="col-sm-6">
								<button type="submit" class="button button-contactForm btn_1">확인</button>

							</div>

						</div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("로그인 결과");
		console.log('${FailPassword}');
		if ('${FailPassword}' != '') {
			var message = '${FailPassword}';
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
			toastr.warning('이메일이 일치하지않습니다');
		}
	});
	</script>
</body>
</html>