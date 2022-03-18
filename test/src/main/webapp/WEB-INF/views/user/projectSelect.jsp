<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 페이지 새로고침 명령어 -->
<!-- <META HTTP-EQUIV="refresh" CONTENT="3"> -->
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script>
	
</script>

<style>
.Tname {
	margin-bottom: 60px;
}

.btn_4 {
	margin-top: 4px;
	margin-bottom: 4px;
	margin-left: 5px;
}

.prjtitle {
	font-size: large;
	font-weight: bold;
}

.btn_4 {
	border-radius: 10px;
	margin-bottom: 10px;
}

.prjcontent {
	margin-top: 10px;
	margin-bottom: 10px;
}

.btn_1 {
	margin-top: 20px;
	text-align: center;
}

/* modal css*/
.modaldal {
	display: none;
	width: 40%;
	height: 40%;
	border-radius: 30px;
	background-color: tomato;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	z-index: 3;
}

.modalcontent {
	margin-top: 50px;
}

.prjtitle {
	font-size: xx-large;
}

.prjlist {
	width: 300px;
	text-align: center;
}
/* modal end */

/* rating */
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

.rating {
	display: inline-block;
}
/* rating end */
.callbtn, .heartbtn, .updatebtn {
	width: 300px;
	height: 45px;
	border-radius: 30px;
	background-color: rgb(209, 130, 84);
	border: bisque;
	margin-top: 10px;
	margin-bottom: 10px;
}

.call {
	background-color: bisque;
	width: 80%;
	height: 10%;
	border-radius: 10px;
	margin-top: 10%;
	text-align: center;
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
							<h2 style="float: right;">프로젝트 상세페이지</h2>
						</div>
					</div>
					<div>
						<h4 style="float: right; color: #fff">KEROKERORI~</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	${project}
	<br> ${sessionScope }
	<section class="course_details_area section_padding">
		<div class="container">
			<input type="hidden" id="prj_id" name="prj_id"
				value="${project.prj_id}">
			<div class="col-12 Tname">
				<h4 class="title_top" style="font-size: 50px;">${project.prj_name}</h4>
				조회수 : ${project.prj_hit}<br> 등록일 :
				<fmt:formatDate value="${project.prj_reg_date }"
					pattern="yyyy-MM-dd" />
				<br> 담당자 아이디 : ${project.master_id}<br> 시작일 ~ 마감일 :
				<fmt:formatDate value="${project.prj_str }" pattern="yyyy-MM-dd" />
				~
				<fmt:formatDate value="${project.prj_ed }" pattern="yyyy-MM-dd" />
				<br>
			</div>
			<c:if test="${project.prj_fnd_prop == 1}">
				<!-- 펀딩 있을시 -->
				<div id="sise">
					현금구입 달러시세 : 가져오는중<br> 1이더 달러시세 : 가져오는중<br> 1이더 원화시세 :
					가져오는중<br>
				</div>
				<input type="hidden" id="dol">
				<input type="hidden" id="etherDol">
				<input type="hidden" id="etherWon">
			</c:if>
			<div class="row">
				<div class="col-lg-8 course_details_left">
					<div class="content_wrapper">

						<c:if test="${project.prj_fnd_prop == 1}">
							<!-- 펀딩 있을시 -->
							<h3 style="font-weight: bold;">펀딩</h3>
							<a class="d-inline-block" href="single-blog.html"> </a>
							<h3 class="right">
								<fmt:formatNumber
									value="${project.total_sum/(project.prj_gl_prc*1000)*100 }"
									pattern="00" />
								%
							</h3>
							<div class="col-12">
								<div
									<c:if test="${project.prj_ofr_prop == 0}">
		                        class="col-6"
		                        </c:if>>
									<div class="progress">
										<div class="progress-bar color-3" role="progressbar"
											style="width: <fmt:formatNumber value="${project.total_sum/(project.prj_gl_prc*1000)*100 }" pattern="00"/>%;background-color: #f09359"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
										</div>
									</div>
								</div>
							</div>
							<br>
							<ul class="blog-info-link">
								<li><i class="far fa-comments"></i> 현재 펀딩금액</li>
								<li><i class="far fa-comments"></i> 펀딩 기간 <fmt:formatDate
										value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
										value="${project.prj_fnd_ed }" pattern="yyyy-MM-dd" /></li>

								<li>
									<h3 stlye="font-weight: bold;">
										<div class="single_member_counter">
											<span class="counter" style="font-size: 25px;">${project.total_sum }</span>원
										</div>
									</h3>
								</li>
							</ul>	
							(나중에 삭제)목표금액 : ${project.prj_gl_prc}만원<br>

						</c:if>

						<br>
						<c:if test="${project.prj_ofr_prop == 1}">
							<!-- 구인 있을시 -->
							<h3 style="font-weight: bold;">구인</h3>
							<p class="btn_4">${project.prj_ar}</p>
							<p class="btn_4">${project.prj_cnd}</p>
							<br>

							<ul class="blog-info-link">
								<li><i class="far fa-user"></i> 프론트 ${ofr.total_team_prs }/
									${project.prj_frn_prs }명</a></li>
								<li><i class="far fa-user"></i> 백 ${ofr.total_team_prs }/
									${project.prj_bk_prs }명</a></li>
								<li><i class="far fa-user"></i> DB ${ofr.total_team_prs }/
									${project.prj_db_prs }명</a></li>
								<li><i class="far fa-user"></i> 서버 ${ofr.total_team_prs }/
									${project.prj_ser_prs }명</a></li>
								<li><i class="far fa-comments"></i> 모집 기간 <fmt:formatDate
										value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
										value="${project.prj_ofr_ed }" pattern="yyyy-MM-dd" /></li>
							</ul>
							<form action="conFirm">
								<input type="hidden" id="app_id" name="app_id" value="${app_id}">
								<button type="submit" class="rfnd btn_4" value="수락"></button>
								</form>
								<form action="refuse">
								<input type="hidden" id="app_id" name="app_id" value="${app_id}">
								<button type="submit"class="rfnd btn_4" value="거절"></button>
								</form>
						</c:if>

					</div>
					<br>
					<div id="list">
						<h3 style="font-weight: bold;">기획안</h3>

						${project.prj_cnt}
					</div>
					<c:if
						test="${sessionScope.sessionUser.user_id == project.master_id }">

						<form action="projectVerUpForm">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="submit" class="rfnd btn_4" value="수정">
						</form>

						<form action="rewardInsertForm">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="hidden" id="master_id" name="master_id"
								value="${project.master_id}"> <input type="hidden"
								id="go" name="go" value="selectPage"> 
						</form>

						<form action="projectViewDel">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="submit" class="rfnd btn_4" value="삭제">
						</form>

					</c:if>

				</div>


				<input type="hidden" id="user_id" name="user_id"
					value="${sessionScope.sessionUser.user_id }"> <input
					type="hidden" id="user_name" name="user_name"
					value="${sessionScope.sessionUser.user_name }"> <input
					type="hidden" id="user_email" name="user_email"
					value="${sessionScope.sessionUser.user_email }"> <input
					type="hidden" id="user_tel" name="user_tel"
					value="${sessionScope.sessionUser.user_tel }"> <input
					type="hidden" id="cash" name="buy_way" value="cash"> <input
					type="hidden" id="coin" name="buy_way" value="coin">

			</div>
		</div>
	</section>

	

	<script type="text/javascript">
	</script>

</body>
</html>