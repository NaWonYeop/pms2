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
								Home<span>/</span>${prj_id }
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


			<div class="testimonial_slider">
				<div class="row">
					<!-- for문 start -->
					<c:forEach items="${ofterList }" var="ofterList">
						<c:if test="${ofterList.app_stt == 'ing' }">
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
															<a href="jobDetail?user_id=${ofterList.user_id }">${ofterList.user_name } | 
															<c:if test="${ofterList.user_crr != null}">경력 ${ofterList.user_crr }년</c:if>
															<c:if test="${ofterList.user_crr eq null}">경력없음</c:if> | ${ofterList.user_tel }</a>
															<input type="hidden" id="uId" value="${ofterList.user_id }">
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
													<button type="button" class="joinbtn${ofterList.user_id }"
														onclick="projectOfrAccept(${ofterList.user_id}, ${ofterList.app_id })">수락</button>
													<button type="button" class="nopebtn${ofterList.app_id }" onclick="projectOfrDecline(${ofterList.app_id})">거절</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
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
					<c:forEach items="${interest }" var="interest">
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
														<a href="jobDetail?user_id=${interest.user_id }">${interest.user_name } | 
														<c:if test="${interest.user_crr != null}">경력 ${interest.user_crr }년</c:if>
														<c:if test="${interest.user_crr eq null}">경력없음</c:if> | ${interest.user_tel }</a>
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
												<button type="button" class="joinbtn" onclick="location.href='heartAccept?user_id=${interest.user_id}&prj_id=${prj_id }&user_name=${interest.user_name }'">신청</button>
												<button type="button" class="nopebtn" onclick="heartDelete()">삭제</button>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</c:forEach>
					<!-- for문 end -->


					<!-- ---------------------- -->
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function projectOfrAccept(e, s) {
			console.log($(".joinbtn"+e+"").val());
	            $.ajax({
	                url: 'projectOfrAccept',
	                type: 'get',
					data: {
						user_id: e,
						prj_id: ${prj_id },
						master_id: ${sessionUser.user_id},
						app_id: s
					},
	                success: function() {
	                    console.log('gooood');
	                }
	            })
		}
		
		function projectOfrDecline(e) {
			$.ajax({
				url: 'projectOfrDecline',
				type: 'post',
				data: {
					app_stt: "no",
					app_id: e
				},
				success: function() {
					console.log('success');
				}
			})
		}
		
		/* function heartDelete() {
			$.ajax({
				url: 'heartDelete',
				type: 'post',
				data: {
					user_id: 
					user_id2:
				},
				success: function() {
					console.log("goooodd");
				}
			})
		} */
	</script>
</body>
</html>