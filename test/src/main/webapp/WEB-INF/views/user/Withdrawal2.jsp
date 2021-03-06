<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>회원탈퇴</h2>
							<p>
								Home<span>/</span>Courses
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- ================ 바디부분 ================= -->
	<section class="contact-section section_padding">
		<div class="container" style="margin-top: 5%;">



			<div class="row">
				<div class="col-12">
					<h2 class="contact-title ">내 펀딩 리스트</h2>
				</div>
				<c:choose>
					<c:when test="${empty funding}">
						<p style="position: relative; left: 2%;">구매한 펀딩이 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ funding}" var="fun">
							<div class="blog_details col-4" style="display: inline-block;">
								<div class="blog_item_img">

									<img class="card-img rounded-0"
										src="./resources/upload/images/${fun.ctf_st_name }" alt="">

								</div>
								<a class="d-inline-block" href="single-blog.html"> <br>
									<h3 style="font-weight: bold;">${fun.prj_name }</h3>


								</a> <br>
								<div class="col-lg-9"
									style="display: inline-block; padding-left: 0px;">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											style="width: ${fun.total/fun.prj_gl_prc*100 }%;background-color: #009231"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-2" style="display: inline-block;">

									<h3>
										<fmt:formatNumber value="${fun.total/fun.prj_gl_prc*100 }"
											pattern="00" />
										%
									</h3>
								</div>

								<br>
								<ul class="blog-info-link">
									<li><i class="far fa-comments"></i> 현재 펀딩금액</a></li>
									<li>
										<h3 stlye="font-weight: bold;">
											<span class="counter" style="font-size: 20px;">${fun.total }</span>
											원
										</h3>
									</li>

								</ul>
								<div class="col-sm-12 text-center" style="padding-left: 0px;">
									<button type="button" class="button button-contactForm btn_1"
										style="width: 100%;">환불</button>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div class="col-lg-12" id="checkWithdraw">
			<form class="form-contact contact_form" action="myWithdrawa3"
				onsubmit="return checkbox()" method="post" id="contactForm"
				novalidate="novalidate" style="margin-top: 7%; margin-bottom: 15%;">
				<div class="row justify-content-center" style="margin-bottom: 2%;">
					<h4>회원탈퇴에 동의합니다</h4>
					<div class="confirm-checkbox"
						style="border: 1px solid black; margin: 10px;">

						<input type="checkbox" id="confirm-checkbox"> <label
							for="confirm-checkbox"></label>
					</div>
					
				</div>
				<div class="col-sm-12 text-center">
					<button type="submit" class="button button-contactForm btn_1 " style="width: 35%; margin-bottom: 1%; border-radius: 10px;">탈퇴</button><br>
					<input type="reset" id="btn-Yes" value="취 소" class="button button-contactForm btn_1 "
						 onclick="cancel()" style="background-color: #F27457; background-image: none; width: 35%; border-radius: 10px;">
				</div>
				<br>
			</form>
		</div>


	</section>
	<script>
		function checkbox() {
			if ($('input:checkbox').is(':checked') == false) {
				alert("동의가 필요합니다.");
				return false;
			} else
				return true;
		}

		function cancel() {
			location.href = "home";
		}
	</script>
</body>
</html>