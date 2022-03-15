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

				<div class="progress-table">
					<div class="progress-table">
						<div class="table-head">
							<div class="serial"></div>
							<div class="visit ">번호</div>
							<div class="percentage text-center">제목</div>
							<div class="visit ">작성자</div>
							<div class="visit ">등록일</div>
						</div>
						<c:forEach var="free" items="${frees }">
							<c:choose>
								<c:when test="${fn:contains(free.brd_ntc_prop,'1')}">
									<div class="table-row" style="background-color: #deebff">
								</c:when>
								<c:otherwise>
									<div class="table-row">
								</c:otherwise>
							</c:choose>

							<div class="serial"></div>
							<div class="visit text-center">
								<c:choose>
									<c:when test="${fn:contains(free.brd_ntc_prop,'1')}">
										공지
									</c:when>
									<c:otherwise>
										${free.brd_id }
									</c:otherwise>
								</c:choose>

							</div>
							<div class="percentage"><a href="freeboardSelect?brd_id=${free.brd_id }">${free.brd_ttl }</a></div>
						
									<div class="visit">${free.user_name }</div>
					

							<div class="visit text-center">
								<fmt:formatDate value="${free.brd_reg_date }"
									pattern="yyyy-MM-dd" />
								</td>
							</div>
					</div>
					</c:forEach>


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
                <button class="button button-contactForm btn_1" onclick="logincheck()"> 등록</button>
            </div>
		</div>

	</section>
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
	</script>
</body>
</html>