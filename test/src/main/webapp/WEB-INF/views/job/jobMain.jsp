<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

.rating {
	display: inline-block;
	float: right;
	margin-right: 10px;
}

.list {
	margin-bottom: 20px;
}

.btn_4 {
	margin-top: 2.5px;
	margin-bottom: 2.5px;
}
</style>
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>구..직 상..세</h2>
							<p>
								Home<span>/</span>Course Details
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="special_cource padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>Find Project</p>
						<h2>구..직 리스트</h2>
					</div>
				</div>
			</div>
			<div class="textimonial_iner owl-carousel">
				<div class="testimonial_slider">
					<div class="row">
							<div class="col-sm-12 col-lg-12 list">
								<div class="single_special_cource">
									<div class="special_cource_text">
										<p>김고기 | 3년</p>
											<c:forEach items="${techs }" var="tech">
												<span class="btn_4">${techs.tech_name }</span>
											</c:forEach>
										<a href="course-details.html">
											<h3>Web Development</h3>
										</a>
										<p>Which whose darkness saying were life unto fish wherein
											all fish of together called</p>
										<div class="author_info">
											<div class="author_img">
												<div class="author_info_text">
													<p>Conduct by:</p>
													<h5>
														<a href="#">James Well</a>
													</h5>
												</div>
											</div>
											<div class="author_rating">
												<div class="rating avg">
													<div class="star-ratings">
														<div class="star-ratings-fill" style="width: 70%">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
														<div class="star-ratings-base">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
													</div>
													<p>3.8 Ratings</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- swiper js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>
</html>