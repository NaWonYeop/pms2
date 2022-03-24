<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Propose</h4>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Number</th>
										<th>Name</th>
										<th>Email</th>
										<th>Tel</th>
										<th>Propose</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody id="myTbody">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<input id="hiddenAppMaster" type="hidden" value="${sessionScope.myPrj.master_id}">
<input id="hiddenAppUser" type="hidden" value="${sessionScope.sessionUser.user_id}">
<script>
	$(function () {
		getList();
	});
	
	function getList() {
		$.ajax({
			url: "appSelect",
			type: "GET",
			dataType: "json",
			async : false
		}).done(function (json) {
			if(json.length == 0) {
				$(".table-responsive").append(`<div style="text-align: center;">신청한 유저가 없습니다.</div>`);
			}
			var hiddenAppMaster = $("#hiddenAppMaster").val();
			var hiddenAppUser = $("#hiddenAppUser").val();
			for (app of json) {
				if(hiddenAppMaster == hiddenAppUser) {
					$("#myTbody").append(`
							<tr id="myTr\${app.app_id}" data-app_id="\${app.app_id}" data-master_id="\${app.master_id}" data-prj_id="\${app.prj_id}">
								<td>\${app.app_id}</td>
								<td>\${app.user_name}</td>
								<td>\${app.user_email}</td>
								<td>\${app.user_tel}</td>
								<td>\${app.app_clsfc == "0" ? "구인" : "구직"}</td>
								<td>
									<div class="btn-group">
										<button id="btn\${app.app_id}" type="button"
											class="btn btn-outline-secondary btn-sm dropdown-toggle"
											data-toggle="dropdown">\${app.app_stt}</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" data-user_id="\${app.user_id}" data-prj_id="\${app.prj_id}" data-app_id="\${app.app_id}" data-master_id="\${app.master_id}" data-app_stt="ing" onclick="appUpdate(this)" >ing</a> 
											<a class="dropdown-item" data-user_id="\${app.user_id}" data-prj_id="\${app.prj_id}" data-app_id="\${app.app_id}" data-master_id="\${app.master_id}" data-app_stt="ok" onclick="appUpdate(this)" >ok</a>
											<a class="dropdown-item" data-user_id="\${app.user_id}" data-prj_id="\${app.prj_id}" data-app_id="\${app.app_id}" data-master_id="\${app.master_id}" data-app_stt="no" onclick="appUpdate(this)" >no</a>
										</div>
									</div>
								</td>
							</tr>`);
				} else {
					$("#myTbody").append(`
							<tr id="myTr\${app.app_id}" data-app_id="\${app.app_id}" data-master_id="\${app.master_id}" data-prj_id="\${app.prj_id}">
								<td>\${app.app_id}</td>
								<td>\${app.user_name}</td>
								<td>\${app.user_email}</td>
								<td>\${app.user_tel}</td>
								<td>\${app.app_clsfc == "0" ? "구인" : "구직"}</td>
								<td>권한없음</td>
							</tr>`);
				}
				
				chaingeClass();
			};
		}).fail(function (xhr, status, message) {
			alert(" status: " + status + " er:" + message);
		});
	}
	
	function appUpdate(app) {
		var app_id = $(app).data('app_id');
		var app_stt = $(app).data('app_stt');
		var user_id = $(app).data('user_id');
		var master_id = $(app).data('master_id');
		var prj_id = $(app).data('prj_id');
		console.log(app_id);
		console.log(app_stt);
		console.log(user_id);
		console.log(master_id);
		console.log(prj_id);
		$.ajax({
			url: "appUpdate",
			type: "GET",
			data : {
				app_id: app_id,
				app_stt: app_stt,
				user_id: user_id,
				master_id: master_id
			},
			dataType: "text"
		}).done(function (text) {
			$("#myTbody").empty();
			getList();
			console.log("체인지 성공!!");
			console.log(app_stt);
			if(app_stt == 'ok') {
				$.ajax({
					url: "teamInsert",
					type: "GET",
					data: {
						prj_id: prj_id,
						user_id: user_id,
						master_id: master_id
					},
					dataType: "text"
				}).done(function (text){
					console.log("팀추가 성공");
				}).fail(function (xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				});
			}
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});

	}

	function chaingeClass() {
		var btn = $("#btn"+app.app_id).text();
		if(btn != "ing") {
			$("#btn"+app.app_id).attr('disabled', 'disabled');
		}
	}
	
</script>