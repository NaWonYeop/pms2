<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.name {
	font-weight: bold;
	font-size: large;
}

.button {
	margin-right: 2%;
}

input {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'TmoneyRoundWindRegular';
}

.prjInsertbtn {
	text-align: center;
}

.right {
	float: right;
	margin-right: 30px;
	margin-top: 16px;
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
							<h2>
								<c:if test="${result.type == 'fnd'}">
								펀딩 리스트
								</c:if>

								<c:if test="${result.type == 'ofr'}">
								구인 리스트
								</c:if>

								<c:if test="${result.type == '' or result.type == null}">
								전체 리스트
								</c:if>
							</h2>
							<p>
								Home<span>/</span>Course Details
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>



	<!-- 검색창 시작 -->
	<div class="row justify-content-center">
		<div class="col-sm-7">
			<aside class="single_sidebar_widget search_widget">
				<form action="projectSearchPage">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value=""
										<c:if test="${result.type == '' or result.type == null}">
									selected
									</c:if>>전체</option>
									<option value="fnd"
										<c:if test="${result.type == 'fnd'}">
									selected
									</c:if>>펀딩</option>
									<option value="ofr"
										<c:if test="${result.type == 'ofr'}">
									selected
									</c:if>>구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">

								<button class="btn" type="submit" style="padding: 0">
									<img alt="search" src="resources/main/img/search.png"
										height="37px">

								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="amount" value="5">
				</form>
			</aside>
		</div>
	</div>
	<!-- 검색창 끝 -->
	
	<section class="blog_area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-5 mb-lg-0">
					<div class="row justify-content-center">
						<div class="col-xl-5">
							<div class="section_tittle text-center">
								<h2>리스트</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="low">
					<div class="col-12">
					
						<div class="prjInsertbtn">
							<button class="btn_1" type="button"
								onClick="location.href='projectInsertForm'" style="margin-bottom: 2%;">프로젝트
								등록</button>
							<br>
						</div>
					</div>
				</div>
				<!-- 찌이이이임 -->
				<div>
					<c:if test="${!empty result.projects }">
						<c:forEach items="${result.projects }" var="project">
						<%-- ${result}<br>
						<br>
						${project}<br> --%>
							<article class="blog_item">
								<div class="blog_details">
									<form class="form-contact contact_form" action="projectSelect"
										method="get">
										<div class="row">

											<input type="hidden" name="prj_id" id="prj_id"
												value="${project.prj_id}">
											<div class="col-12" style="margin-bottom: 40px;">
												<input type="submit" class="d-inline-block h2"
													style="border: 0px; background-color: #576EF2; color: #ffffff;"
													value="${project.prj_name}">
												<p style="display: inline-block; float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수
													: ${project.prj_hit}</p>
											</div>


											<c:if test="${project.prj_fnd_prop == 1}">
												<div class="col-lg-7">
													<!-- 펀딩 있을시 -->
													<c:forEach items="${result.rwds }" var="rwd">
													<c:if test="${project.prj_id == rwd.prj_id}">
													
													<div class="blog_item_img">
														<h3 style="font-weight: bold;">펀딩</h3>
														<div class="col-12">

															<div class="col-12">
																<img class="card-img rounded-0"
																	src="./resources/upload/images/${project.ctf_st_name }"
																	alt="사진이 없습니다.">
															</div>

														</div>
													</div>
													
													
													
													<a class="d-inline-block" href="single-blog.html"> </a>
													<h3 class="right">
														<fmt:formatNumber value="${rwd.total_sum/(project.prj_gl_prc*1000)*100 }"
															pattern="00" />
														%
													</h3>
													<div class="col-12">
														<div class="col-10">
															<div class="progress">
																<div class="progress-bar color-3" role="progressbar"
																	style="width: <fmt:formatNumber value="${rwd.total_sum/(project.prj_gl_prc*1000)*100 }" pattern="00"/>%;background-color: #f09359"
																	aria-valuenow="80" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>

														</div>
													</div>
													<br>
													<ul class="blog-info-link">
														<li><i class="far fa-comments"></i> 현재 펀딩금액</li>
														<li><i class="far fa-comments"></i> 펀딩 기간 <fmt:formatDate
																value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" />
															~ <fmt:formatDate value="${project.prj_fnd_ed }"
																pattern="yyyy-MM-dd" /></li>

														<li>
															<h3 stlye="font-weight: bold;">
																<div class="single_member_counter">
																	<span class="counter" style="font-size: 25px;">${rwd.total_sum }</span>원
																</div>
															</h3>
														</li>
													</ul>
													<p>(나중에 삭제)목표금액 : ${project.prj_gl_prc}만원</p>
													<br>
													
													</c:if>
													</c:forEach>
												</div>
											</c:if>



											<c:if test="${project.prj_ofr_prop == 1}">
												<div class="col-lg-5">
													<!-- 구인 있을시 -->
													<c:forEach items="${result.apps }" var="app">
													<c:if test="${project.prj_id == app.prj_id}">
													
													<div class="blog_item_img">
														<h3 style="font-weight: bold;">구인</h3>
													</div>


													<p class="btn_4">${project.prj_ar}</p>
													<p class="btn_4">${project.prj_cnd}</p>

													<ul class="blog-info-link">
														<li><i class="far fa-user"></i> 신청인원
															${app.total_count }/${project.prj_frn_prs + project.prj_bk_prs + project.prj_db_prs + project.prj_ser_prs }명</a></li>
														<li><i class="far fa-comments"></i> 신청 기간 <fmt:formatDate
																value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" />
															~ <fmt:formatDate value="${project.prj_ofr_ed }"
																pattern="yyyy-MM-dd" /></li>
													</ul>
													
													</c:if>
													</c:forEach>
												</div>
											</c:if>

											<c:if test="${project.prj_fnd_prop == 0}">
												<div class="col-lg-6">
													<div class="col-12">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</div>
												</div>
											</c:if>
										</div>
									</form>
								</div>


							</article>
						</c:forEach>

					</c:if>

				</div>
				<!-- 찜끝 -->

				<div id="list">
					<c:if test="${empty result.projects }">
						<div class="col-lg-12 form-group">
							<p>검색 결과가 없습니다.</p>
						</div>
					</c:if>

					<c:forEach items="${result.projects }" var="project">
						<%-- ${result}<br>
						<br>
						${project}<br> --%>
						<article class="blog_item">
							<div class="blog_details">
								<form class="form-contact contact_form" action="projectSelect"
									method="get">
									<div class="row">

										<input type="hidden" name="prj_id" id="prj_id"
											value="${project.prj_id}">
										<div class="col-12" style="margin-bottom: 40px;">
											<input type="submit" class="d-inline-block h2"
												style="border: 0px; background-color: #576EF2; color: #ffffff;"
												value="${project.prj_name}">
											<p style="display: inline-block; float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수
												: ${project.prj_hit}</p>
										</div>


										<c:if test="${project.prj_fnd_prop == 1}">
											<div class="col-lg-7">
												<!-- 펀딩 있을시 -->
												<c:forEach items="${result.rwds }" var="rwd">
													<c:if test="${project.prj_id == rwd.prj_id}">
													
													<div class="blog_item_img">
														<h3 style="font-weight: bold;">펀딩</h3>
														<div class="col-12">

															<div class="col-12">
																<img class="card-img rounded-0"
																	src="./resources/upload/images/${project.ctf_st_name }"
																	alt="사진이 없습니다.">
															</div>

														</div>
													</div>
													
													
													
													<a class="d-inline-block" href="single-blog.html"> </a>
													<h3 class="right">
														<fmt:formatNumber value="${rwd.total_sum/(project.prj_gl_prc*1000)*100 }"
															pattern="00" />
														%
													</h3>
													<div class="col-12">
														<div class="col-10">
															<div class="progress">
																<div class="progress-bar color-3" role="progressbar"
																	style="width: <fmt:formatNumber value="${rwd.total_sum/(project.prj_gl_prc*1000)*100 }" pattern="00"/>%;background-color: #f09359"
																	aria-valuenow="80" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>

														</div>
													</div>
													<br>
													<ul class="blog-info-link">
														<li><i class="far fa-comments"></i> 현재 펀딩금액</li>
														<li><i class="far fa-comments"></i> 펀딩 기간 <fmt:formatDate
																value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" />
															~ <fmt:formatDate value="${project.prj_fnd_ed }"
																pattern="yyyy-MM-dd" /></li>

														<li>
															<h3 stlye="font-weight: bold;">
																<div class="single_member_counter">
																	<span class="counter" style="font-size: 25px;">${rwd.total_sum }</span>원
																</div>
															</h3>
														</li>
													</ul>
													<p>(나중에 삭제)목표금액 : ${project.prj_gl_prc}만원</p>
													<br>
													
													</c:if>
													</c:forEach>
												</div>
											</c:if>



											<c:if test="${project.prj_ofr_prop == 1}">
												<div class="col-lg-5">
													<!-- 구인 있을시 -->
													<c:forEach items="${result.apps }" var="app">
													<c:if test="${project.prj_id == app.prj_id}">
													
													<div class="blog_item_img">
														<h3 style="font-weight: bold;">구인</h3>
													</div>


													<p class="btn_4">${project.prj_ar}</p>
													<p class="btn_4">${project.prj_cnd}</p>

													<ul class="blog-info-link">
														<li><i class="far fa-user"></i> 신청인원
															${app.total_count }/${project.prj_frn_prs + project.prj_bk_prs + project.prj_db_prs + project.prj_ser_prs }명</a></li>
														<li><i class="far fa-comments"></i> 신청 기간 <fmt:formatDate
																value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" />
															~ <fmt:formatDate value="${project.prj_ofr_ed }"
																pattern="yyyy-MM-dd" /></li>
													</ul>
													
													</c:if>
													</c:forEach>
												</div>
											</c:if>

										<c:if test="${project.prj_fnd_prop == 0}">
											<div class="col-lg-6">
												<div class="col-12">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</div>
											</div>
										</c:if>
									</div>
								</form>
							</div>


						</article>
					</c:forEach>
				</div>



				<div id="more">
					더보기
					<form id="morePage" onsubmit="return false"
						onclick="ajaxMorePage()" style="display: inline-block;">
						<input type="submit" value="더보기"> <input type="hidden"
							name="pageNum" id="moreKey" value="2"> <input
							type="hidden" name="type" value="${result.type}"> <input
							type="hidden" name="keyword" value="${result.keyword}"> <input
							type="hidden" name="amount" value="${result.amount}">
					</form>
				</div>


			</div>
		</div>
	</section>

	<script type="text/javascript">
	function ajaxMorePage() {
		
		console.log('여기 옴?');
		
		$.ajax({
			type : 'GET',
			url : "/prj/ajaxMorePage",
			data : $("#morePage").serialize(),
			dataTyep: "json",
			success : function (result) {
				console.log("검색 하러감?");
				console.log(result);
				
				for (var a of result.projects){
					console.log(a);
					var ofr='';
					var fnd='';
					if(a.prj_ofr_prop == 1){
						ofr = "============구인============<br>"
							 +"구인 시작일 ~ 구인 마감일 :" 
							 + a.prj_ofr_str +" ~ "+ a.prj_ofr_ed+ "<br>"	
							 +"프론트 : "+ a.prj_frn_prs +"<br>"
							 +"백 : "+ a.prj_bk_prs + "<br>"
							 +"DB : "+ a.prj_db_prs + "<br>"
							 +"서버 : "+ a.prj_ser_prs + "<br>"
							 +"조건 : "+ a.prj_cnd + "<br>"
							 +"지역 : "+ a.prj_ar + "<br>"
							 +"============구인============<br>";
					}
					if(a.prj_fnd_prop == 1){
						fnd = "============펀딩============<br>"
							 +"<img src='./resources/upload/images/"+ a.ctf_st_name +"'><br>"
							 +"펀딩사진 들고올 아이디 : "+ a.ctf_id +"<br>"
							 +"펀딩 시작일 ~ 펀딩 마감일 :" 
							 + a.prj_fnd_str +" ~ "+ a.prj_fnd_ed+ "<br>"	
							 +"목표금액 : "+ a.prj_gl_prc + "<br>"
							 +"============펀딩============<br>";
					}
					$("#list").append(`
							
							<div class="card">
							<form action="projectSelect" method="get">
							<input type="hidden" name="prj_id" id="prj_id" value="\${a.prj_id}">
							<input type="submit" value="\${a.prj_name}"><br>
							(나중에 지울것)번호 : \${a.prj_id}<br>
							조회수 : \${a.prj_hit}<br>
							이름 : \${a.prj_name}<br>
							등록일 : \${a.prj_reg_date}<br>
							담당자 아이디 : \${a.master_id}<br>
							시작일 ~ 마감일 : \${a.prj_str} ~ \${a.prj_ed}<br>
							(나중에 삭제)구인 여부 : \${a.prj_ofr_prop}<br>
							\${ofr}		
							
							(나중에 삭제)펀딩 여부 : \${a.prj_fnd_prop}<br>
							\${fnd}		
					
							개발마감 여부 : ${project.prj_devEd_prop}<br>
							버전 : ${project.prj_ver}<br>
							뷰 여부 : ${project.prj_view_prop}<br>
							</form>
							</div>
							
					`);
					
				}
				
				
				$("#moreKey").val(result.page)
				console.log("더보기 값 변경?");
				if(result.projects.length == 0){
					console.log("더볼게없음")
					$("#more").remove()
					//나중에 경고창으로 올리기 버튼 삭제는 하지말것
				}
				
			},
	        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		    }
		})

	}
	
	</script>




</body>
</html>