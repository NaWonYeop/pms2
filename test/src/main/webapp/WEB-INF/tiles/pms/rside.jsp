<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="right-sidebar" class="settings-panel">
	<div class="card">
		<div class="card-body">
			<div class="form-group">
				<label>My Project</label> <select id="mySelect"
					class="js-example-basic-single w-100">
					<option selected>프로젝트를 선택하세요</option>

				</select>
				<button id="myBtn" class="btn btn-primary" type="button">선택</button>
			</div>
		</div>
	</div>
</div>


<script>
	$.ajax({
		url : "myProjectList",
		type : "GET",
		dataType : "json"
	}).done(function(json) {
		for(team of json) {
			$("#mySelect").append(`
			<option id="mst" data-master_id="\${team.master_id}" value="\${team.prj_id}">\${team.prj_id}</option>
			`);
		};
	}).fail(function(xhr, status, message) {
		alert("프로젝트 리스트 출력 실패");
	});
	
	$("#myBtn").on("click", function(event) {
		var prj_id = $("#mySelect").val();
		var master_id = $("#mst").data("master_id");

		console.log('prj_id= ' + prj_id);
		console.log('master_id= ' + master_id);

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