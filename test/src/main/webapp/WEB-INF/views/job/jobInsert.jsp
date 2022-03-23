<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.name {
	font-weight: bold;
	font-size: large;
}

.button {
	margin-right: 2%;
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
							<h2 style="float: right;">구직 등록 및 수정</h2>
						</div>
					</div>
					<div>
						<h4 style="float: right; color: #fff">KEROKERORI~</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container" style="margin-top: 5%; margin-bottom: 15%">
		<div class="row">
			<div class="col-12">
				<h2 class="contact-title">${updateLoadCheck eq 'jobMain' ? '등록 및 수정하기' : '수정하기' }</h2>
			</div>
			<div class="col-lg-8">
				<form class="form-contact contact_form" action="jobInsert"
					method="post" id="contactForm">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<p>이름</p>
								<div class="name">${sessionUser.user_name }</div>
							</div>
						</div>
						<input type="hidden" id="user_id" name="user_id"
							value="${sessionUser.user_id }">
						<div class="col-12">
							<div class="form-group">
								<p>제목</p>
								<input class="form-control" name="user_job_ttl"
									id="user_job_ttl" type="text" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter Title'"
									placeholder='Enter Title'
									value="<c:if test="${ttlCheck.user_job_ttl != null}">${ttlCheck.user_job_ttl }</c:if>"
									required="required">
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>내용</p>
								<textarea class="form-control w-100" name="user_job_cnt"
									id="user_job_cnt" cols="30" rows="9"
									placeholder='Enter Content' required="required"><c:if
										test="${ttlCheck.user_job_cnt != null}">${ttlCheck.user_job_cnt }</c:if></textarea>

							</div>


							<div class="col-9">
								<div class="form-group mt-3">
									<input type="submit" class="button"
										value="${updateLoadCheck eq 'jobMain' ? '등록 및 수정하기' : '수정하기' }">
									<c:choose>
										<c:when test="${updateLoadCheck eq 'jobDetail' }">
											<button type="button" class="button"
												onclick="location.href='jobDetail?user_id=${ttlCheck.user_id}'">취소하기</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="button"
												onclick="location.href='jobSelectList'">취소하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>Buttonwood, California.</h3>
						<p>Rosemead, CA 91770</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-tablet"></i></span>
					<div class="media-body">
						<h3>00 (440) 9865 562</h3>
						<p>Mon to Fri 9am to 6pm</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>support@colorlib.com</h3>
						<p>Send us your query anytime!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>