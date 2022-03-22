<%@page import="co.test.prj.team.service.MyPrjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Team Member</h4>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>Name</th>
										<th>Position</th>
										<th>Departments</th>
										<th>Email</th>
										<th>Tel</th>
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

<!-- modal -->
<div class="modal fade" id="teamUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">팀 수정</h5>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden"> <label>Position <select
						id="position">
							<option>Master</option>
							<option>Manager</option>
							<option>Employee</option>
					</select>
					</label> <br> <label>Departments <select id="department">
							<option>Database</option>
							<option>FrontEnd</option>
							<option>BackEnd</option>
							<option>Design</option>
					</select>
					</label>
				</form>
			</div>
			<div id="modalFooter" class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button id="teamUpdateBtn" type="button" class="btn btn-primary">저장</button>
			</div>
		</div>
	</div>
</div>
<input id="hiddenMaster" type="hidden" value="${sessionScope.myPrj.master_id}">
<input id="hiddenUser" type="hidden" value="${sessionScope.sessionUser.user_id}">
<script>
	$(function() {
		teamList();
		$("#myTbody").on("click", "#deptUpdate", function(e){
			console.log("클릭클릭");
			$("#teamUpdateModal").modal('show');
			$('input[type=hidden]').val(e.currentTarget.dataset.user_id);
			$("#position").val(e.currentTarget.dataset.tm_pos);
			$("#department").val(e.currentTarget.dataset.tm_dept);
		});
		
		$("#modalFooter").on("click", "#teamUpdateBtn", function(e){
			var tm_pos = $("#position option:selected").text();
			var tm_dept = $("#department option:selected").text();
			var user_id = $('input[type=hidden]').val();
			console.log(tm_pos);
			console.log(tm_dept);
			console.log(user_id);
			$.ajax({
				url: "teamUpdate",
				type: "GET",
				data: {
					user_id: user_id,
					tm_pos: tm_pos,
					tm_dept: tm_dept
				}
			}).done(function() {
				$("#myTbody").empty();
				$("#hiddenMaster").val("${sessionScope.myPrj.master_id}");
				$("#hiddenUser").val("${sessionScope.sessionUser.user_id}");
				teamList();
				$("#teamUpdateModal").modal('hide');
			}).fail(function(){
				
			});
		});
	});
	
	function teamList() {
		$.ajax({
			url : "teamSelect",
			type : "GET",
			dataType : "json",
			async: false
		}).done(function(json) {
			var hiddenMaster = $("#hiddenMaster").val();
			var hiddenUser = $("#hiddenUser").val();
			for(team of json) {
				if(hiddenMaster == hiddenUser) {
					$("#myTbody").append(`<tr id="tr\${team.user_id}" data-user_id="\${team.user_id}">
							<td class="py-1">\${team.user_id}</td>
							<td>\${team.user_name}</td> 
							<td>\${team.tm_pos}</td>
							<td id="dept">\${team.tm_dept}</td>
							<td>\${team.user_email}</td>
							<td>\${team.user_tel}</td>
							<td><button id="deptUpdate" type="button" data-user_id="\${team.user_id}" data-prj_id="\${team.prj_id}" data-tm_pos="\${team.tm_pos}" data-tm_dept="\${team.tm_dept}">부서 수정</button></td>
						</tr>`);
				} else {
					$("#myTbody").append(`<tr id="tr\${team.user_id}" data-user_id="\${team.user_id}">
							<td class="py-1">\${team.user_id}</td>
							<td>\${team.user_name}</td> 
							<td>\${team.tm_pos}</td>
							<td id="dept">\${team.tm_dept}</td>
							<td>\${team.user_email}</td>
							<td>\${team.user_tel}</td>
						</tr>`);
				}
			};
			
		}).fail(function(xhr, status, message) {
			alert(" status: " + status + " er:" + message);
		});
	}
	
</script>