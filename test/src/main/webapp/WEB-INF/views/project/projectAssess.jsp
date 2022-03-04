<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.single_feature_part {
	position: static;
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
						<p>프로젝트명</p>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="single_feature">
						<div class="single_feature_part">
							<span class="single_feature_icon"> <i id="ti-layers"
								class="ti-layers"></i>

								<div class="modaldal content">
									<div class="content modalcontent">
										<div class="justify-content-center">
											<h2 class="content prjtitle" style="text-align: center;">평가하기</h2>
											<div class="flexbox">
												<p class="content prj" style="">전문성</p>
												<input type="text" class="score">
											</div>
											<div class="flexbox">
												<p class="content prj">일정준수</p>
												<input type="text" class="score">
											</div>
											<div class="flexbox">
												<p class="content prj">적극성</p>
												<input type="text" class="score">
											</div>
											<div class="flexbox">
												<p class="content prj">의사소통</p>
												<input type="text" class="score">
											</div>
											<div class="flexbox">
												<p class="content prj">재고용 의사</p>
												<input type="text" class="score">
											</div>

										</div>
										<button type="button" class="call"
											style="line-height: normal;">신청하기</button>
									</div>

								</div>
							</span>
							<h4>김고기</h4>
							<p>Front-end</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="single_feature">
						<div class="single_feature_part">
							<span class="single_feature_icon"><i
								onclick="location.href='#'" class="ti-new-window"></i></span>
							<h4>나는1엽</h4>
							<p>Back-end</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="single_feature">
						<div class="single_feature_part single_feature_part_2">
							<span class="single_service_icon style_icon"><i
								onclick="location.href='#'" class="ti-light-bulb"></i></span>
							<h4>실버덕</h4>
							<p>DB</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="single_feature">
						<div class="single_feature_part">
							<span class="single_feature_icon"><i
								onclick="location.href='#'" class="ti-new-window"></i></span>
							<h4>나는1엽</h4>
							<p>Back-end</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="single_feature">
						<div class="single_feature_part single_feature_part_2">
							<span class="single_service_icon style_icon"><i
								onclick="location.href='#'" class="ti-light-bulb"></i></span>
							<h4>실버덕</h4>
							<p>DB</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		function check(e) {
			if (!$(e.target).hasClass("content")
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

		$('#ti-layers').click(function(e) {
			$('.modaldal').fadeIn();
		});
	</script>
</body>
</html>