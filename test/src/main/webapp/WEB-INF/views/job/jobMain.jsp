<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />

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

.search {
	width: 57%;
	text-align: center;
	margin-top: 2%;
	margin-left: 21.5%;
}

.table.dataTable, thead, th, table.dataTable.no-footer, .table-bordered, .table-bordered td, 
	.table-bordered th, .table td, .table th, table.dataTable thead th, table.dataTable thead td {
	border: 0;
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
							<h2 style="float: right;">PROJECT JOB</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">구직 리스트</h4>
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
									<option value="nam"	selected>이름</option>
									<option value="ttl"	>제목</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control" 
								placeholder='' onfocus="this.placeholder = ''"
								onblur="this.placeholder = ''">
							<div class="input-group-append">
								<button class="btn" type="submit" style="padding: 0">
									<img alt="search" src="resources/main/img/search.png" height="37px" >
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> 
					<input type="hidden" name="amount" value="5">
				</form>
				</div>
			
	
	<section class="special_cource padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>JOB</p>
						<h2>구직 리스트</h2>
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
			
			<div class="insertbtn">
				<button type="button" id="insertbtn" class="btn_1"
					onclick="location.href='jobInsertMove'" style="margin-bottom: 2%;">등록 및 수정</button>
			</div>
			
			<div class="textimonial_iner">
				<div class="testimonial_slider">
				<div claas="row">
				
					<c:if test="${!empty inters}">
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
					--------------찜끝
					</c:if>
				</div>
					<div class="row">
					<div id="data_list_wrapper" class="dataTables_wrapper no-footer" style="width: 100%;">
					<table id="data_list" class="table table-bordered">
					<thead><tr><th></th></tr></thead>
					<tbody>
						
				
						<c:forEach items="${jobs }" var="job">
							<c:if test="${!empty job.user_job_ttl  }">
							<tr>
							<td>
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
								</td>
								</tr>
							</c:if>
							
						</c:forEach>
							
						</tbody>
					</table>
					</div>
						<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->

					</div>
				</div>
			</div>
		</div>
	</section>
<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	
		function starAvg(avg) {
			const insertAvg = avg * 20;
			return insertAvg + 1.5;
		}
		
		jQuery(function($) {
			$("#data_list").DataTable({
				lengthChange : false,

				// 검색 기능 숨기기
				searching : false,

				// 정렬 기능 숨기기
				ordering : false,

				// 정보 표시 숨기기
				info : false,

				displayLength : 3
			});
		});
	</script>

</body>
</html>