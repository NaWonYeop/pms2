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
	.table-row {
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
	<section class="contact-section section_padding">
		<div class="container">
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>내 프로젝트 리스트</h2>
			</div>
			<div class="col-2">
				<button class="btn_1" onclick="location.href='projectInsertForm'">등록</button>
			</div>
		</div>



		<div class="section-top-border">
			<div class="col-12">
				<div class="progress-table">
					<div class="progress-table">
						<div class="table-head ">
							<!-- <div class="serial"></div> -->
							<div class="visit" style="margin-right: 14px;">프로젝트명</div>
							<div class="country" style="margin-right: 14px;">기간</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">총 참여인원</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">상태</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">구인현황</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">평가</div>

						</div>
						<c:forEach items="${Myproject }" var="myp">


							<div class="table-row ">
								<!-- <div class="serial"></div> -->
								<div class="visit" style="margin-right: 14px;">${myp.prj_name }</div>
								<div class="country" style="margin-right: 14px;">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
								<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">${myp.count }명</div>
								<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 0 }">
                            		진행중
                            	</c:when>
										<c:otherwise>
                            		종료
                            	</c:otherwise>
									</c:choose>
								</div>
								<div class="visit" style="margin-right: 14px; text-align: center; display: inline;">
									<button class="button button-contactForm btn_1" onclick="location.href='projectOfrList?prj_id=${myp.prj_id}'">현황</button>
								</div>
								<div class="visit" style="margin-right: 14px; text-align: center; display: inline;">
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 1 }">
											<button class="button button-contactForm btn_1" onclick="location.href='projectAssessList?prj_id=${myp.prj_id}'">평가</button>
										</c:when>
										<c:otherwise>
											<button class="button button-contactForm btn_1" onclick="notEndProject()">평가</button>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>참여 프로젝트 리스트</h2>
			</div>

		</div>



		<div class="section-top-border">
			<div class="col-12">
				<div class="progress-table">
					<div class="progress-table">
						<div class="table-head ">
							<!-- <div class="serial"></div> -->
							<div class="visit">프로젝트명</div>
							<div class="country">기간</div>
							<div class="visit">총 참여인원</div>
							<div class="visit">책임자</div>
							<div class="visit">연락처</div>
							<div class="visit">상태</div>
							<div class="visit">평점</div>

						</div>
						
						<c:forEach items="${enterProject}" var="enter">
							<div class="table-row ">
								<!-- <div class="serial"></div> -->
								<div class="visit ">${enter.prj_name }</div>
								<div class="country">
									<fmt:formatDate value="${enter.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${enter.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
								<div class="visit">${enter.count }명</div>
								<div class="visit">${enter.user_name }</div>
								<div class="visit">${enter.user_tel }</div>
								<div class="visit">
								<c:choose>
									<c:when test="${enter.prj_devEd_prop eq 0 }">
                            		진행중
                            		</c:when>
									<c:otherwise>
                            		종료
                            		</c:otherwise>
								</c:choose>
								</div>
								<div class="visit">4.0</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript">
			function notEndProject() {
				toastr.warning("진행중인 프로젝트 입니다.")
			}
		</script>
	</section>
</body>
</html>