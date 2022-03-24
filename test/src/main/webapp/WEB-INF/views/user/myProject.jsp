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
	
	.finishbtn {
		width: 7%; 
		text-align: center; 
		color: #F20C36;
		border-radius: 10px;
	}
	
	.ingbtn {
		width: 7%;
		text-align: center; 
		color: #03A62C;
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
							<h2 style="float: right;">MY PROJECT</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">나의 프로젝트</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact-section section_padding" style="margin-top: 7%;">
		<div class="container">
		<div class="row col-12" style="margin-bottom: 2%;">
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
							<div class="visit" style="margin-left: 14px;">프로젝트명</div>
							<div class="country" style="margin-right: 14px;">기간</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">총 참여인원</div>
							<div class="visit" style=" text-align: center; display: grid;">상태</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">구인현황</div>
							<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">평가</div>

						</div>
						<c:forEach items="${Myproject }" var="myp">


							<div class="table-row ">
								<!-- <div class="serial"></div> -->
								<div class="visit" style="margin-left: 14px;">${myp.prj_name }</div>
								<div class="country" style="margin-right: 14px;">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
								<div class="visit" style="margin-right: 14px; text-align: center; display: grid;">${myp.count }명</div>
								
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 0 }">
										<div class="visit ingbtn" style=" display: grid; ">
                            			진행중</div>
                            	</c:when>
										<c:otherwise>
										<div class="visit finishbtn" style=" display: grid;">
                            			종료</div>
                            	</c:otherwise>
									</c:choose>
								
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
						<div class="table-head " style="margin-left: 6%">
							<!-- <div class="serial"></div> -->
							<div class="visit"  style="width: 13%">프로젝트명</div>
							<div class="country" style="width: 24%">기간</div>
							<div class="visit" style="width: 11%; text-align: center; display: block; margin-right: 2%;">총 참여인원</div>
							<div class="visit" style="width: 17%">책임자</div>
							<div class="visit" style="width: 15%">연락처</div>
							<div class="visit" style="width: 7%; text-align: center; display: block;">상태</div>
							<div class="visit" style="width: 7%; text-align: center; display: block;">평점</div>

						</div>
						
						<c:forEach items="${enterProject}" var="enter">
							<div class="table-row " style="margin-left: 6%">
								<!-- <div class="serial"></div> -->
								<div class="visit " style="width: 13%">${enter.prj_name }</div>
								<div class="country" style="width: 24%">
									<fmt:formatDate value="${enter.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${enter.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
								<div class="visit" style="width: 11%; text-align: center; display: block; margin-right: 2%;">${enter.count }명</div>
								<div class="visit" style="width: 17%">${enter.user_name }</div>
								<div class="visit" style="width: 15%">0${enter.user_tel }</div>
								
								<c:choose>
									<c:when test="${enter.prj_devEd_prop eq 0 }">
									<div class="visit ingbtn" style="display: block; width: 7%;">
                            		진행중</div>
                            		<div class="visit" style="width: 7%; text-align: center; display: block;">진행중</div>
                            		</c:when>
                            		
									<c:otherwise>
									<div class="visit finishbtn" style="display: block; width: 7%;">
                            		종료</div>
                            		<c:choose>
                            			<c:when test="${enter.master_id eq sessionUser.user_id }">
                            				<div class="visit" style="width: 7%; text-align: center; display: block;">기획자</div>
                            			</c:when>
                            			<c:otherwise>
                            				<div class="visit" style="width: 7%; text-align: center; display: block;">
                            					<c:choose>
                            						<c:when test="${enter.str_avg < 1 }">
                            							미평가
                            						</c:when>
                            						<c:otherwise>
                            							${enter.str_avg }
                            						</c:otherwise>
                            					</c:choose>
                            				</div>
                            			</c:otherwise>
                            		</c:choose>
                            		</c:otherwise>
								</c:choose>
								
								
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