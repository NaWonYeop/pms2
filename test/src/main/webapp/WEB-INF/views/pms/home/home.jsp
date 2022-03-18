<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold">Welcome Aamir</h3>
					<h6 class="font-weight-normal mb-0">
						All systems are running smoothly! You have <span
							class="text-primary">3 unread alerts!</span>
					</h6>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 grid-margin stretch-card">
			<div class="card tale-bg">
				<div class="card-people mt-auto">
					<img src="resources/pms/images/dashboard/people.svg" alt="people">
					<div class="weather-info">
						<div class="d-flex">
							<div>
								<h2 class="mb-0 font-weight-normal">
									<i class="icon-sun mr-2"></i>31<sup>C</sup>
								</h2>
							</div>
							<div class="ml-2">
								<h4 class="location font-weight-normal">Bangalore</h4>
								<h6 class="font-weight-normal">India</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<p class="card-title">Order Details</p>
					<p class="font-weight-500">The total number of sessions within
						the date range. It is the period time a user is actively engaged
						with your website, page or app, etc</p>
					<div class="d-flex flex-wrap mb-5">
						<div class="mr-5 mt-3">
							<p class="text-muted">Order value</p>
							<h3 class="text-primary fs-30 font-weight-medium">12.3k</h3>
						</div>
						<div class="mr-5 mt-3">
							<p class="text-muted">Orders</p>
							<h3 class="text-primary fs-30 font-weight-medium">14k</h3>
						</div>
						<div class="mr-5 mt-3">
							<p class="text-muted">Users</p>
							<h3 class="text-primary fs-30 font-weight-medium">71.56%</h3>
						</div>
						<div class="mt-3">
							<p class="text-muted">Downloads</p>
							<h3 class="text-primary fs-30 font-weight-medium">34040</h3>
						</div>
					</div>
					<canvas id="order-chart"></canvas>
				</div>
			</div>
		</div>

		<!-- team modal -->
		<div class="modal fade" id="teamSelectModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<label>My Project</label>
					</div>
					<div id="selectModal" class="modal-body">
						<select id="teamSelect" class="js-example-basic-single w-80">
							<option selected>프로젝트를 선택하세요</option>
						</select>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button id="insertTeam" type="button" class="btn btn-primary">선택</button>
					</div>
				</div>
			</div>
		</div>
		<!-- team modal end -->
	</div>
</div>

<script>
	$(function() {
		$.ajax({
			url : "myProjectList",
			type : "GET",
			dataType : "json",
			async : false
		}).done(function(json) {
			for(team of json) {
				$("#teamSelect").append(`
				<option id="opt\${team.prj_id}" data-master_id="\${team.master_id}" data-prj_id="\${team.prj_id}">프로젝트명 : \${team.prj_name}</option>
				`);
			};
		}).fail(function(xhr, status, message) {
			alert("프로젝트 리스트 출력 실패");
		});
		if(${sessionScope.myPrj == null}) {
			$('#teamSelectModal').modal('show');
		}
	});
	
	$("#selectModal").on("change", function () { 
		var prj_id = $(this).find("option:selected").data("prj_id");
		var master_id = $(this).find("option:selected").data("master_id");
		console.log(prj_id);
		console.log(master_id);
		debugger
		$.ajax({
			url : "myPrj",
			type : "GET",
			data : {
				prj_id : prj_id,
				master_id : master_id
			}
		}).done(function() {
			$("#right-sidebar").attr("class", "settings-panel");
		}).fail(function(xhr, status, message) {
			alert("프로젝트 선택실패");
		});
		
		
	});
</script>