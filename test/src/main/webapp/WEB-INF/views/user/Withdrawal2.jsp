<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

						<h2>내 펀딩목록</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="blog_right_sidebar">
					<article class="blog_item">
						<h3 style="font-weight: bold;">펀딩 제목</h3>
						<div class="blog_item_img">
							<img class="card-img rounded-0"
								src="resources/main/img/blog/single_blog_1.png" alt="">

						</div>

						<div class="blog_details">
							<a class="d-inline-block" href="single-blog.html"> </a>
							<h3 class="right">80%</h3>
							<div class="progress">
								<div class="progress-bar color-3" role="progressbar"
									style="width: 80%; background-color: #f09359"
									aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<c:forEach items="${MyFunding }" var="funding">
							<br><p>${funding.rwd_name}</p>
							</c:forEach>
							<br>
							<ul class="blog-info-link">
								<li><i class="far fa-comments"></i> 현재 펀딩금액</a></li>
								<li><i class="far fa-comments"></i> xxxxxxxxx원</a></li>
							</ul>
						</div>
					</article>
				</div>
				<div class="col-lg-5">
					<form class="form-contact contact_form" action="Withdrawa3"
						onsubmit="return checkbox()" method="post" id="contactForm"
						novalidate="novalidate">
						<div class="row justify-content-center">
							<h4>회원탈퇴에 동의합니다</h4>
							<div class="confirm-checkbox"
								style="border: 1px solid black; margin-right: 0px;">

								<input type="checkbox" id="confirm-checkbox"> <label
									for="confirm-checkbox"></label>
							</div>
						</div>
						<div class="col-sm-12 text-center">
							<button type="submit"
								class="button button-contactForm btn_1 w-50">탈퇴</button>
						</div>
				</div>
				</form>
			</div>

		</div>
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
	</script>
</body>
</html>