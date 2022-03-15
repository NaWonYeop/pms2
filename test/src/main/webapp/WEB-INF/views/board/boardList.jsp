<%@page import="co.test.prj.user.service.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />

<title>Insert title here</title>
<style>
.progress-table {
	font-family: 'TmoneyRoundWindRegular';
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
							<h2>Our Courses</h2>
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

						<h2>자유 게시판</h2>
					</div>
				</div>
			</div>

			<div class="section-top-border">
			
				<table id="data_list" class="table table-striped table-bordered" >
					<thead class="table-head">
						<tr>
							<th class="">번호</th>
							<th class=" text-center">제목</th>
							<th class="">작성자</th>
							<th class="">등록일</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="free" items="${frees }">
							<tr>
								<c:choose>
									<c:when test="${fn:contains(free.brd_ntc_prop,'1')}">
									<!-- 	<div class="table-row"
												style="background-color: #deebff"> -->
									</c:when>
									<c:otherwise>
										<!-- <div class="table-row"> -->
									</c:otherwise>
								</c:choose>

								<div class=""></div>
								<div class=" text-center">
									<c:choose>
										<c:when test="${fn:contains(free.brd_ntc_prop,'1')}">
											<td>공지</td>
										</c:when>
										<c:otherwise>
											<td>${free.brd_id }</td>
										</c:otherwise>
									</c:choose>

								</div>

								<td>
									<div class="">
										<a href="freeboardSelect?brd_id=${free.brd_id }">${free.brd_ttl }</a>
									</div>
								</td>
								<td>
									<div class="">${free.user_name }</div>
								</td>
								<td>
									<div class=" text-center">
										<fmt:formatDate value="${free.brd_reg_date }"
											pattern="yyyy-MM-dd" />

									</div>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
</div>
			<div class="row justify-content-center">
				<div class="col-sm-5">
					<form action="#">
						<div class="form-group">

							<div class="input-group mb-4">


								<div class="form-select" id="default-select" style="width: 25%;">
									<select>
										<option value="1">제목</option>
										<option value="1">작성자</option>

									</select>
								</div>
								<input type="text" class="form-control"
									placeholder='Search Keyword' onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Search Keyword'">
								<div class="input-group-append">
									<button class="btn" type="submit" style="padding: 0">
										<img alt="search" src="resources/main/img/search.png" height="37px" >
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="col-12 text-right">
				<button class="button button-contactForm btn_1"
					onclick="logincheck()">등록</button>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	<script>

	function logincheck(){
		
		 location.href="freeboardInsertform"
	<%-- 	<% UserVO user=(UserVO)session.getAttribute("sessionUser");
			if(user==null)
			{%>
				toastr.warning('로그인이 필요합니다.');
			<%}
			else
			{%>
			location.href="freeboardInsertform";
			<%}%>; --%>
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

				displayLength : 5
			});
		});

	</script>
</body>
</html>