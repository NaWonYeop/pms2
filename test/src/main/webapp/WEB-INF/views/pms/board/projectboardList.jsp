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
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />

<title>Insert title here</title>
<style>
.progress-table {
	font-family: 'TmoneyRoundWindRegular';
}

table {
	width: auto;
}

thead {
	background-color: #F5F7FF;
}

#data_list_paginate {
	margin-top: 1%;
}

.section-top-border {
	border-top: 0;
}

.table.dataTable.no-footer {
	border-bottom: 0;
}
</style>
</head>
<body>
	<!--::review_part start::-->
	<div class="content-wrapper">
		<section class="special_cource padding_top">
			<div class="row">
				<div class="container">
					<div class="row justify-content-center">

						<div class="col-xl-5">
							<div class="section_tittle text-center">

								<h2>자유 게시판</h2>
							</div>
						</div>
					</div>

					<div class="insertbtn">
						<button type="button" id="insertbtn" class="btn btn-primary todo"
							onclick="logincheck()">등록</button>
					</div>

					<div class="row section-top-border">
						<div id="data_list_wrapper" class="dataTables_wrapper no-footer"
							style="width: 100%;">

							<table id="data_list" class="table table-bordered">
								<thead class="table-head">
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">등록일</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="bord" items="${border }">
										<tr>
											<c:choose>
												<c:when test="${fn:contains(bord.brd_ntc_prop,'1')}">
													<!-- 	<div class="table-row"
												style="background-color: #deebff"> -->
												</c:when>
												<c:otherwise>
													<!-- <div class="table-row"> -->
												</c:otherwise>
											</c:choose>


											<c:choose>
												<c:when test="${fn:contains(bord.brd_ntc_prop,'1')}">
													<td class="text-center"></td>
												</c:when>
												<c:otherwise>
													<td class="text-center">${bord.brd_id }</td>
												</c:otherwise>
											</c:choose>



											<td>
												<div class="">
													<a href="msprojectBoardSelect?brd_id=${bord.brd_id }">${bord.brd_ttl }</a>
												</div>
											</td>
											<td>
												<div class="text-center">${bord.user_name }</div>
											</td>
											<td>
												<div class="text-center">
													<fmt:formatDate value="${bord.brd_reg_date }"
														pattern="yyyy-MM-dd" />

												</div>
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-sm-5">
			<form action="pmsBoardSearch">
				<div class="form-group">

					<div class="input-group mb-4">
						<input type="hidden" id="prj_id" name="prj_id" value="${sessionScope.myPrj.prj_id}">
						<input type="hidden" id="ntc_prop" name="ntc_prop" value="0">
						<div class="form-select" id="default-select" style="width: 25%; height: 30%">
							<select name="type">
								<option value="ttl">제목</option>
								<option value="nam">작성자</option>

							</select>
						</div>
						<input type="text" class="form-control" name="keyword"
							placeholder='Search Keyword' onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Search Keyword'">
						<div class="input-group-append">
							<button class="btn" type="submit" style="padding: 0">
								<img alt="search" src="resources/main/img/search.png"
									height="37px">
							</button>
						</div>

					</div>
				</div>
			</form>
		</div>

	</div>



	</section>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script>
	function logincheck() {
		location.href = "msprojectBoardInsertForm";
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