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



.introduce {
	display: block;
}

.insertbtn {
	
	text-align: center;
}

.search {
	width: 57%;
	text-align: center;
	margin-top: 2%;
	margin-left: 21.5%;
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
							<h2>구..직 상세</h2>
							<p>
								Home<span>/</span>Course Details
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="search">
			<!-- 검색기능 -->
			<form action="projectSearchPage" >
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type" >
									<option value="" 
									<c:if test="${result.type == '' or result.type == null}">
									selected
									</c:if>
									>전체</option>
									<option value="fnd"
									<c:if test="${result.type == 'fnd'}">
									selected
									</c:if>
									>펀딩</option>
									<option value="ofr"
									<c:if test="${result.type == 'ofr'}">
									selected
									</c:if>
									>구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control" 
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" type="submit" >
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> 
					<input type="hidden" name="amount" value="5">
				</form>
				</div>
			<div class="insertbtn">
			<button type="button" id="insertbtn" class="btn_1"
				onclick="location.href='jobInsertMove'" style="width: 40%;">등록 및 수정</button>
			</div>
	
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
			<%-- <form action="">
				<input type="text" list="ttl" id="list">
				<datalist id="ttl">
					<c:forEach items="${jobs }" var="job">
						<option value="${job.user_job_ttl }" />
					</c:forEach>
				</datalist>
				<button type="submit">검색</button>
			</form> --%>
			
			<div class="textimonial_iner">
				<div class="testimonial_slider">
				<div claas="row">
				
					<c:if test="${!empty inters}">
					<h1>찌이이이이임</h1>
						<c:forEach items="${inters }" var="inter">
							<div class="col-sm-12 col-lg-12 list">
									<div class="single_special_cource">
										<div class="special_cource_text">
											<p class="introduce">${inter.user_name }| ${inter.user_crr }년</p>
											<c:forEach items="${techs }" var="tech">
												<c:if test="${inter.user_id eq tech.user_id2 }">
													<span class="btn_4">${tech.tech_name }</span>
												</c:if>
											</c:forEach>
											<a href="jobDetail?user_id=${inter.user_id }">
												<h3>${inter.user_job_ttl }</h3>
											</a>
											<p>${inter.user_job_cnt }</p>
											<div class="author_info">
												<div class="author_img">
													<div class="author_info_text">
														<p>수행 프로젝트</p>
														<%-- <c:forEach items="" var=""> --%>
														<h5>
															<a href="#">James Well</a>
														</h5>
														<%-- </c:forEach> --%>
													</div>
												</div>
												<div class="author_rating">
													<div class="rating avg">
														<div class="star-ratings">
															<div class="star-ratings-fill"
																style="width: ${inter.avg * 20 }%">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
															<div class="star-ratings-base">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
														</div>
														<p>평균 ${inter.avg } 점</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						
						</c:forEach>
					찜끝
					</c:if>
				</div>
					<div class="row">
						<c:forEach items="${jobs }" var="job">
							<c:if test="${!empty job.user_job_ttl  }">
								<div class="col-sm-12 col-lg-12 list">
									<div class="single_special_cource">
										<div class="special_cource_text">
											<p class="introduce">${job.user_name }| ${job.user_crr }년</p>
											<c:forEach items="${techs }" var="tech">
												<c:if test="${job.user_id eq tech.user_id2 }">
													<span class="btn_4">${tech.tech_name }</span>
												</c:if>
											</c:forEach>
											<a href="jobDetail?user_id=${job.user_id }">
												<h3>${job.user_job_ttl }</h3>
											</a>
											<p>${job.user_job_cnt }</p>
											<div class="author_info">
												<div class="author_img">
													<div class="author_info_text">
														<p>수행 프로젝트</p>
														<%-- <c:forEach items="" var=""> --%>
														<h5>
															<a href="#">James Well</a>
														</h5>
														<%-- </c:forEach> --%>
													</div>
												</div>
												<div class="author_rating">
													<div class="rating avg">
														<div class="star-ratings">
															<div class="star-ratings-fill"
																style="width: ${job.avg * 20 }%">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
															<div class="star-ratings-base">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
														</div>
														<p>평균 ${job.avg } 점</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->

					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function starAvg(avg) {
			const insertAvg = avg * 20;
			return insertAvg + 1.5;
		}
		
		
	</script>

</body>
</html>