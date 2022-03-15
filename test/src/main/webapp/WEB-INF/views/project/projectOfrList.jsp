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

.memberList {
	border-radius: 10px;
	
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

	<section class="special_cource padding_top"
		style="padding-top: 0; margin-bottom: 10%;">
		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>ang-gimoddi</p>
						<h2>MEMBER</h2>
					</div>
				</div>
			</div>
			
			<div class="testimonial_slider">
				<div class="row">
					<!-- for문 start -->
					<c:forEach items="${memberList }" var="memberList">
							<div class="col-sm-12 col-lg-12 list">
								<div class="single_special_cource">
									<div class="special_cource_text memberList" style="border: 0; background-color: #F27457; padding: 10px;">
										<div class="col-12 author_info"
											style="border-top: 0; margin-top: 0; padding-top: 0;">
											<div class="col-8">
												<div class="author_img" style="padding-left: 30%; padding-top: 5%;">
													<div class="author_info_text">
														<h5>${memberList.tm_dept }</h5>
														<h5>
															<a href="jobDetail?user_id=${memberList.user_id }" style="font-size:x-large; ">${memberList.user_name } | 
															<c:if test="${memberList.user_crr != null}">경력 ${memberList.user_crr }년</c:if>
															<c:if test="${memberList.user_crr eq null}">경력없음</c:if> | 0${memberList.user_tel }</a>
															
															<input type="hidden" id="uId" value="${memberList.user_id }">
														</h5>
														
													</div>
														
												</div>
											</div>
											<div class="col-4">
												<img alt="member" src="resources/main/img/member.png">
											</div>
										</div>
									</div>
								</div>
							</div>
					</c:forEach>


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
															<c:if test="${ofterList.user_crr eq null}">경력없음</c:if> | 0${ofterList.user_tel }</a>
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
													<button type="button" class="joinbtn${ofterList.user_id } btn_4"
														onclick="projectOfrAccept(${ofterList.user_id}, ${ofterList.app_id })">수락</button>
													<button type="button" class="nopebtn${ofterList.app_id } btn_4" onclick="projectOfrDecline(${ofterList.app_id})">거절</button>
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
														<c:if test="${interest.user_crr eq null}">경력없음</c:if> | 0${interest.user_tel }</a>
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
												<button type="button" class="joinbtn btn_4" onclick="heartAccept(${interest.user_id})">신청</button>
												<button type="button" class="nopebtn btn_4" onclick="heartDelete(${interest.user_id})">삭제</button>
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
		toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-top-right",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "1500",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
		} 
		
		function projectOfrAccept(e, s) {
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
                    toastr.success("수락 성공!")
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
					toastr.success("거절되었습니다.")
				}
			})
		}
		function heartAccept(e) {
			$.ajax({
				url: 'heartAccept',
				type: 'post',
				data: {
					prj_id: ${prj_id},
					master_id: ${sessionUser.user_id},
					user_id: e
				},
				success: function(){
					toastr.success("신청 완료!");
				}
			})
		}
		
		function heartDelete(e) {
			$.ajax({
				url: 'heartDelete',
				type: 'post',
				data: {
					user_id: ${sessionUser.user_id},
					user_id2: e
				},
				success: function() {
					toastr.success("관심목록에서 삭제되었습니다.");
				}
			})
		} 
	</script>
</body>
</html>