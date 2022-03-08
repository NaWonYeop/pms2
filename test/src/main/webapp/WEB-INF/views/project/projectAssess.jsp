<%@page import="co.test.prj.user.service.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-sm-6, .col-xl-3 {
	margin-top: 30px;
}

.modaldal {
	display: none;
	width: 30%;
	height: 60%;
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
	z-index: 10;
}

.modalcontent {
	margin-top: 10%;
	height: 90%;
}

.prjtitle {
	font-size: xx-large;
}

.prjlist {
	width: 300px;
	text-align: center;
}

.prj {
	text-align: left;
	margin-left: 4%;
	height: 20px;
}

.score {
	width: 50%;
	height: 30px;
	margin-right: 4%;
}

.flexbox {
	margin-left: 8%;
	margin-right: 8%;
	margin-top: 5%;
	border-radius: 15px;
	display: flex;
	-webkit-justify-content: space-between;
	justify-content: space-between;
}

.call {
	background-color: bisque;
	width: 80%;
	height: 10%;
	border-radius: 10px;
	margin-top: 10%;
	text-align: center;
}

.default-select .current{
    -webkit-tap-highlight-color: transparent !important;
    
    border-radius: 5px !important;
    border: #f9f9ff !important;
    box-sizing: border-box !important;
    clear: both !important;
    cursor: pointer !important;
    display: block !important;
    float: left !important;
    font-family: inherit !important;
    font-size: 14px !important;
    font-weight: normal !important;
    height: 38px !important;
    line-height: 40px !important;
    outline: none !important;
    padding-left: 18px !important;
    padding-right: 30px !important;
    position: relative !important;
    text-align: left !important;
    -webkit-transition: all 0.2s ease-in-out !important;
    transition: all 0.2s ease-in-out !important;
    -webkit-user-select: none !important;
    -moz-user-select: none !important;
    -ms-user-select: none !important;
    user-select: none !important;
    white-space: nowrap !important;
    width: auto !important;
    background: #f9f9ff !important;
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
							<h2>평..가</h2>
							<p>
								Home<span>/</span>Course Details
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="feature_part" style="padding-top: 0;">
		<div class="container">
			<div class="row">

				<div class="col-sm-6 col-xl-3 align-self-center">
					<div class="single_feature_text" style="text-align: center;">
						<h2>평가하기</h2>
						<p>${AssessList[0].prj_name }</p>
					</div>
				</div>

				<c:forEach items="${AssessList }" var="Assess" varStatus="status">
					<div class="col-sm-6 col-xl-3">
						<div class="single_feature">
							<div class="single_feature_part">
								<span class="single_feature_icon" style="position: static;">
									<i id="ti-layers${status.index }" class="ti-layers"
									onclick="modalFadeSelect(this);"></i>
									<div class="modaldal content">
										<input type="hidden" id="aId" value="${Assess.user_id }">
										<div class="content modalcontent">
											<div class="justify-content-center">
												<h2 class="content prjtitle" style="text-align: center;">평가하기</h2>
												<div class="flexbox">
													<p class="content prj" style="">전문성</p>
													<div class="default-select" id="default-select">
				                                       <select id="str_prfsn">
				                                          <option value="5">5</option>
				                                          <option value="4">4</option>
				                                          <option value="3">3</option>
				                                          <option value="2">2</option>
				                                          <option value="1">1</option>
				                                       </select>
				                                    </div>
												</div>
												<div class="flexbox">
													<p class="content prj">일정준수</p>
													<div class="default-select" id="default-select">
				                                       <select id="str_obs">
				                                          <option value="5">5</option>
				                                          <option value="4">4</option>
				                                          <option value="3">3</option>
				                                          <option value="2">2</option>
				                                          <option value="1">1</option>
				                                       </select>
				                                    </div>
												</div>
												<div class="flexbox">
													<p class="content prj">적극성</p>
													<div class="default-select" id="default-select">
				                                       <select id="str_pos">
				                                          <option value="5">5</option>
				                                          <option value="4">4</option>
				                                          <option value="3">3</option>
				                                          <option value="2">2</option>
				                                          <option value="1">1</option>
				                                       </select>
				                                    </div>
												</div>
												<div class="flexbox">
													<p class="content prj">의사소통</p>
													<div class="default-select" id="default-select">
				                                       <select id="str_comm">
				                                          <option value="5">5</option>
				                                          <option value="4">4</option>
				                                          <option value="3">3</option>
				                                          <option value="2">2</option>
				                                          <option value="1">1</option>
				                                       </select>
				                                    </div>
												</div>
												<div class="flexbox">
													<p class="content prj">재고용 의사</p>
													<div class="default-select" id="default-select">
				                                       <select id="str_re_empl">
				                                          <option value="5">5</option>
				                                          <option value="4">4</option>
				                                          <option value="3">3</option>
				                                          <option value="2">2</option>
				                                          <option value="1">1</option>
				                                       </select>
				                                    </div>
												</div>
											</div>
											<button type="button" class="call"
												style="line-height: normal;" onclick="Assess()">평가하기</button>
										</div>
									</div>
								</span>
								<h4>${Assess.user_name }</h4>
								<p>${Assess.tm_dept }</p>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>

	<script>
		function check(e) {
			if (!$(e.target).hasClass("content")
					&& !$(e.target).hasClass("default-select")
					&& !$(e.target).hasClass("nice-select")
					&& !$(e.target).hasClass("justify-content-center")
					&& !$(e.target).hasClass("flexbox")
					&& !$(e.target).hasClass("ti-layers")
					&& !$(e.target).hasClass("option")
					&& !$(e.target).hasClass("current")) {
				$('.modaldal').fadeOut();
			}
		}

		$('html').click(function(e) {
			console.log(e.target);
			check(e);
		});

		/* 	$('#ti-layers').click(function(e) {
				$('.modaldal').fadeIn();
			}); */

		function modalFadeSelect(info) {
			$('#' + info.id).next().fadeIn();
		}
		
		//평가 버튼
		function Assess() {
			var aId = $('#aId').val();
			var prfsn = parseInt($('#str_prfsn').val()); 
			var obs = parseInt($('#str_obs').val());
			var pos = parseInt($('#str_pos').val());
			var comm = parseInt($('#str_comm').val());
			var reEmpl = parseInt($('#str_re_empl').val());
			var avg = (prfsn+obs+pos+comm+reEmpl)/5;

			$.ajax({
				url : "projectAssess",
				type: "get",
				data : {
					prj_id: ${AssessList[0].prj_id },
					user_id: aId,
					str_prfsn : prfsn,
					str_obs : obs,
					str_pos : pos,
					str_comm : comm,
					str_re_empl : reEmpl,
					str_avg: avg
				}
			}).done(function(){
				console.log('gooood');
			}) 
		}
	</script>
</body>
</html>