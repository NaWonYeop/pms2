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
						action="contact_process.php" method="post" id="contactForm"
						novalidate="novalidate">
						<div class="row ">

							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control" name="pwd" id="pwd" type="password"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '비밀번호를 입력해 주세요.'"
										placeholder='비밀번호를 입력해 주세요.'>
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
</body>
</html>