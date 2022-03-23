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
	width : auto;	
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
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">BOARD</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">자유게시판</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--::review_part start::-->
	<section class="special_cource padding_top">
		<div class="container" style="margin-top: 7%; margin-bottom: 15%;">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">

						<h2>자유 게시판</h2>
					</div>
				</div>
			</div>
			
			<div class="insertbtn">
				<button type="button" id="insertbtn" class="btn_1"
					onclick="logincheck()">등록</button>
			</div>
			
			<div class="row section-top-border">
			<div class="col-12">
			<div id="data_list_wrapper" class="dataTables_wrapper no-footer">

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
						<c:forEach var="free" items="${frees }">
							<tr>
										<td class="text-center">${free.brd_id }</td>
								<td>
									<div class="">
										<a href="freeboardSelect?brd_id=${free.brd_id }">${free.brd_ttl }</a>
									</div>
								</td>
								<td>
									<div class="text-center">${free.user_name }</div>
								</td>
								<td>
									<div class="text-center">
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
		</div>
		<div class="row justify-content-center">
			<div class="col-sm-5">
				<form action="boardSearch">
					<div class="form-group">

						<div class="input-group mb-4">


							<div class="form-select" id="default-select" style="width: 25%;">
								<input type="hidden" id="ntc_prop" name="ntc_prop" value="0">
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
										<img alt="search" src="resources/main/img/search.png" height="37px" >
									</button>
								</div>
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
		location.href = "freeboardInsertform";
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