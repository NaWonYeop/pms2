<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Team</h4>
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

<script>
	$(function() {
		$.ajax({
			url : "teamSelect",
			type : "GET",
			dataType : "json"
		}).done(function(json) {
			for(team of json) {
				$("#myTbody").append(`<tr id="tr">
				<td class="py-1">\${team.user_id}</td>
				<td>\${team.user_name}</td> 
				<td>\${team.tm_pos}</td>
				<td>\${team.tm_dept}</td>
				<td>\${team.user_email}</td>
				<td>\${team.user_tel}</td>
				</tr>`);
			};
		}).fail(function(xhr, status, message) {
			alert(" status: " + status + " er:" + message);
		});
	});
</script>