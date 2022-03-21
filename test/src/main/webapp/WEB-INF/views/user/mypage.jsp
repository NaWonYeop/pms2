<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
<title>Etrain</title>

</head>

<body>

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
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
							<a class="btn_4" href="myProject">참여중인 프로젝트 리스트</a>


							<table id="mTable" class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">프로젝트명</th>
										<th scope="col">마감일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty MyProject}">
											<tr>
												<td>등록된 프로젝트가 없습니다</td>
												<td></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${MyProject}" var="Project">
												<tr>
													<td>${Project.prj_name}</td>
													<td>D-${Project.prj_time}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 이까지 테이블 -->

				</div>

				<div class="col-sm-6 col-lg-6">

					<div class="single_special_cource">
						<div class="special_cource_text">
							<a class="btn_4" href="myfunding">펀딩 리스트</a>
							
							<table id="mTable2" class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">프로젝트명</th>
										<th scope="col">리워드명</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty MyFunding}">
											<tr>
												<td></td>
												<td>구매한 펀딩이 없습니다</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${MyFunding}" var="Funding">
												<tr>
													<td>${Funding.prj_name}</td>
													<td>${Funding.rwd_name}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

						</div>

					</div>
				</div>


				<div class="col-sm-6 col-lg-12">
					<div class="single_special_cource">

						<div class="special_cource_text">
							<a href="course-details.html" class="btn_4">알림</a>
							<c:forEach items="${MyApp}" var="app">
								<c:choose>
								<c:when test="${fn:contains(app.app_clsfc,'0')}">
										<div id="div${app.app_id}">
											<a href=""></a>&nbsp;&nbsp;&nbsp;&nbsp;${app.prj_name}에
											신청하셨습니다&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" id="show" onclick="div(${app.app_id})">-</button>
										</div>


									</c:when>
									<c:otherwise>
										<div id="div${app.app_id}">
											<a href="conFirmSelect?app_id=${app.app_id }&prj_id=${app.prj_id}">${app.prj_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;에
											협업제의를 받으셨습니다&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" id="show" onclick="div(${app.app_id})">-</button>
										</div>


									</c:otherwise>
								</c:choose>
							</c:forEach>

						</div>

					</div>
				</div>
				<!-- 테이블 -->
			</div>

		</div>

	</section>

	<!--::blog_part end::-->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
	
	  jQuery(function($) {
	      $("#mTable").DataTable({
	         lengthChange: false,

	          // 검색 기능 숨기기
	          searching: false,

	          // 정렬 기능 숨기기
	          ordering: false,

	          // 정보 표시 숨기기
	          info: false,
	         
	          displayLength: 5
	      });
	   });
	  
	  jQuery(function($) {
	      $("#mTable2").DataTable({
	         lengthChange: false,

	          // 검색 기능 숨기기
	          searching: false,

	          // 정렬 기능 숨기기
	          ordering: false,

	          // 정보 표시 숨기기
	          info: false,
	         
	          displayLength: 5
	      });
	   });
	</script>
</body>

</html>