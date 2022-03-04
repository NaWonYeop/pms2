<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<section class="contact-section section_padding">
		<div class="container">
			<div class="row justify-content-center"></div>
			<div class="row justify-content-center">

				<div class="col-lg-5">
					<form class="form-contact contact_form" action="home" method="post"
						id="contactForm" novalidate="novalidate">
						<div class="row justify-content-center">
							<h4>${passwordFail }</h4>
						</div>
						<div class="col-sm-12 text-center">

							<button type="submit"
								class="button button-contactForm btn_1 w-50">확인</button>
						</div>
						</form>
				</div>
			</div>
		</div>
	
	</section>
</body>
</html>