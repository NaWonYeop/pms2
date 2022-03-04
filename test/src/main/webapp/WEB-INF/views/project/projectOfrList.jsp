<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* rating */
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 0.5px;
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
/* rating end */
.list {
	margin-bottom: 15px;
}

.single_special_cource {
	border: 1px solid black;
	border-radius: 15px;
}

button {
	text-align: center;
	background-color: coral;
	border-radius: 30px;
	height: 40px;
	width: 85px;
	border: 1px solid black;
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
							<h2>구..인현..황</h2>
							<p>
								Home<span>/</span>Courses
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="testimonial_part section_padding">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>ang-gimoddi</p>
						<h2>MEMBER</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-md-12">
					<div class="textimonial_iner owl-carousel">
						<div class="testimonial_slider">
							<div class="row">
								<div class="col-lg-12 col-xl-12 col-sm-12 align-self-center">
									<div class="testimonial_slider_text"
										style="background-color: burlywood;">
										<h2>김고기</h2>
										<h4>경력 2년 | 010-3131-2456</h4>
										<h5>Back-end</h5>
									</div>
								</div>
								<!-- <div class="col-xl-4 d-none d-xl-block">
                                    <div class="testimonial_slider_text">
                                        <h4>난워녑</h4>
                                        <h4>25세 | 경력 2년 | 010-8540-1561</h4>
                                        <h5> Front-end</h5>
                                    </div>
                                </div> -->
							</div>
						</div>
						<div class="testimonial_slider">
							<div class="row">
								<div class="col-lg-12 col-xl-12 col-sm-12 align-self-center">
									<div class="testimonial_slider_text"
										style="background-color: burlywood;">
										<h2>나는워녑</h2>
										<h4>경력 2년 | 010-3131-2456</h4>
										<h5>Front-end</h5>
									</div>
								</div>

								<!-- <div class="col-xl-4 d-none d-xl-block">
                                    <div class="testimonial_slider_text">
                                        <h4>난워녑</h4>
                                        <h4>25세 | 경력 2년 | 010-8540-1561</h4>
                                        <h5> Front-end</h5>
                                    </div>
                                </div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ------------------------------------------------------------------- -->
	<section class="special_cource padding_top"
		style="padding-top: 0; margin-bottom: 10%;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>Come On</p>
						<h2>신청목록</h2>
					</div>
				</div>
			</div>
			
			<c:forEach items="" var="">
			
			</c:forEach>
			<div class="testimonial_slider">
				<div class="row">
					<!-- for문 start -->
					<div class="col-sm-12 col-lg-12 list">
						<div class="single_special_cource">
							<div class="special_cource_text" style="border: 0;">
								<div class="col-12 author_info"
									style="border-top: 0; margin-top: 0; padding-top: 0;">
									<div class="col-8">
										<div class="author_img">
											<div class="author_info_text">
												<p>Conduct by:</p>
												<h5>
													<a href="#">무일푼 | 경력 2년 | 010-3131-2456</a>
												</h5>
											</div>
										</div>
										<!-- <div class="author_rating">
                                            <div class="rating avg">
                                                <div class="star-ratings">
                                                    <div 
                                                    class="star-ratings-fill" style=" width: 70% ">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                                <div class="star-ratings-base">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                            </div>
                                                <p>3.8 Ratings</p>
                                            </div>
                                        </div> -->
									</div>
									<div class="col-4">
										<div class="button-contactForm">
											<button type="button" class="joinbtn">수락</button>
											<button type="button" class="nopebtn">거절</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- for문 end -->


					<!-- ---------------------- -->
				</div>
			</div>
		</div>
	</section>

	<section class="special_cource padding_top"
		style="padding-top: 0; margin-bottom: 10%;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>My Love</p>
						<h2>관심개발자</h2>
					</div>
				</div>
			</div>

			<div class="testimonial_slider">
				<div class="row">
					<!-- for문 start -->
					<div class="col-sm-12 col-lg-12 list">
						<div class="single_special_cource">
							<div class="special_cource_text" style="border: 0;">
								<div class="col-12 author_info"
									style="border-top: 0; margin-top: 0; padding-top: 0;">
									<div class="col-8">
										<div class="author_img">
											<div class="author_info_text">
												<p>Conduct by:</p>
												<h5>
													<a href="#">김지갑 | 경력 2년 | 010-3131-2456</a>
												</h5>
											</div>
										</div>
										<!-- <div class="author_rating">
                                            <div class="rating avg">
                                                <div class="star-ratings">
                                                    <div 
                                                    class="star-ratings-fill" style=" width: 70% ">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                                <div class="star-ratings-base">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                            </div>
                                                <p>3.8 Ratings</p>
                                            </div>
                                        </div> -->
									</div>
									<div class="col-4">
										<div class="button-contactForm">
											<button type="button" class="joinbtn">신청</button>
											<button type="button" class="nopebtn">삭제</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- for문 end -->


					<!-- ---------------------- -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>