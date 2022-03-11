<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Etrain</title>

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
							<p class="btn_4">참여중인 프로젝트 리스트</p>
							
							<c:choose>
								<c:when test="${empty MyProject}">
									<p>등록된 프로젝트가 없습니다</p>
								</c:when>
								<c:otherwise>
									<c:forEach items="${MyProject}" var="Project">
										<p>프로젝트명 : ${Project.prj_name} &nbsp;&nbsp;&nbsp; &nbsp;
											마감일 : D-${Project.prj_time}</p>
									</c:forEach>
								</c:otherwise>
							</c:choose>



						</div>

					</div>
				</div>

				<div class="col-sm-6 col-lg-6">

					<div class="single_special_cource">
						<div class="special_cource_text">
							<p class="btn_4">펀딩 리스트</p>


							<c:choose>
								<c:when test="${empty MyFunding}">
									<p>구매한 펀딩이 없습니다</p>
								</c:when>
								<c:otherwise>
									<c:forEach items="${MyFunding}" var="Funding">
										<p>프로젝트명 : ${Funding.prj_name} &nbsp;&nbsp;&nbsp;&nbsp;
											리워드명 : ${Funding.rwd_name}</p>
									</c:forEach>
								</c:otherwise>
							</c:choose>



						</div>

					</div>
				</div>

				<div class="col-sm-6 col-lg-12">
					<div class="single_special_cource">

						<div class="special_cource_text">
							<a href="course-details.html" class="btn_4">알림</a>
							<c:forEach items="${MyApp}" var="app">
								<c:choose>
									<c:when test="${app_clsfc eq 1 }">
										<div id="div${app.app_id}">
											<a href="">${app.prj_id}</a>&nbsp;&nbsp;&nbsp;&nbsp;${app.prj_name }에
											신청하셨습니다&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="show" onclick="div(${app.app_id})">-</button>
										</div>
										

									</c:when>
									<c:otherwise>
										<div id="div${app.app_id}">
											<a href="">${app.prj_id}</a>&nbsp;&nbsp;&nbsp;&nbsp;${app.prj_name}에
											협업제의를 받으셨습니다&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" id="show" onclick="div(${app.app_id})">-</button>
										</div>
									

									</c:otherwise>
								</c:choose>
							</c:forEach>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::blog_part end::-->

	<script>
	function div(id) {
		$('#div'+id).hide();
		$.ajax({
			url : "MyAppDown",
			data : {
				"id" : id
			}
		})
		
	}
	</script>
</body>

</html>