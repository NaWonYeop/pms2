<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Etrain</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<!-- breadcrumb start-->
	<section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>마이페이지</h2>
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

	<!--::review_part start::-->
	<section class="special_cource padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">

						<h2>마이페이지</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-lg-6">
			
				<div class="single_special_cource">
						<div class="special_cource_text">
							<a href="course-details.html" class="btn_4">참여중인 프로젝트 리스트</a>
							<c:forEach items="${MyProject}" var="Project">
							<p>프로젝트명 : ${Project.prj_name} &nbsp; &nbsp;&nbsp; &nbsp; 마감일 : D-${Project.prj_time}</p>
							</c:forEach>
						

							<div class="author_info">
								<div class="author_img">
									<img src="img/author/author_1.png" alt="">

								</div>

							</div>
						</div>

					</div>
				</div>
				
				<div class="col-sm-6 col-lg-6">
					<div class="single_special_cource">
						<img src="img/special_cource_2.png" class="special_img" alt="">
						<div class="special_cource_text">
							<a href="course-details.html" class="btn_4">펀딩리스트</a> 
						
							<c:forEach items="${MyFunding}" var="Funding">
							<p>프로젝트명 : ${Funding.prj_name} &nbsp;&nbsp;&nbsp;&nbsp; 리워드명 : ${Funding.rwd_name}</p>
							</c:forEach>
							
							<div class="author_info">
								<div class="author_img">
									<img src="img/author/author_2.png" alt="">

								</div>

							</div>
						</div>

					</div>
				</div>
				
				<div class="col-sm-6 col-lg-12">
					<div class="single_special_cource">
						<img src="img/special_cource_3.png" class="special_img" alt="">
						<div class="special_cource_text">
							<a href="course-details.html" class="btn_4">알림</a>
							<c:forEach items="${MyApp}" var="app">
							<c:choose>
							<c:when test="${app_clsfc eq 1 }">
							<p><a href="">${app.prj_id}</a>&nbsp;&nbsp;&nbsp;&nbsp;${app.prj_name }에 신청하셨습니다</p>
							</c:when>
							<c:otherwise>
							<p><a href="">${app.prj_id}</a>&nbsp;&nbsp;&nbsp;&nbsp;${app.prj_name}에 협업제의를 받으셨습니다</p>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							
							<div class="author_info">
								<div class="author_img">
									<img src="img/author/author_3.png" alt="">

								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::blog_part end::-->




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