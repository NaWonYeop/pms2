<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="right-sidebar" class="settings-panel">
	<div class="card">
		<div class="card-body">
			<div id="selectDiv" class="form-group">
				<label>My Project</label> <select id="mySelect"
					class="js-example-basic-single w-100" size="10">
					<option selected>프로젝트를 선택하세요</option>

				</select>
				<button id="myBtn" class="btn btn-primary" type="button">선택</button>
			</div>
		</div>
	</div>
</div>


<script>
	
	$("#selectDiv").on("change", function () { 
		var prj_id = $(this).find("option:selected").data("prj_id");
		var master_id = $(this).find("option:selected").data("master_id");
		var prj_name = $(this).find("option:selected").data("prj_name");
		console.log(prj_id);
		console.log(master_id);
		console.log(prj_name);
		$.ajax({
			url : "myPrj",
			type : "GET",
			data : {
				prj_id : prj_id,
				master_id : master_id,
				prj_name: prj_name
			}
		}).done(function(result) {
			console.log(result);
			$("#allPrgBar").attr("aria-valuenow", result.percent);
			$("#allPrgBar").html(result.percent+"%");
			$("#allPrgBar").css("width", result.percent+"%");
			$("#right-sidebar").attr("class", "settings-panel");
			
			$("#title").html(" "+prj_name);
		}).fail(function(xhr, status, message) {
			alert("프로젝트 선택실패");
		});
	});

	// rside select id = mySelect, button = myBtn, option id = mst
	$.ajax({
		url : "myProjectList",
		type : "GET",
		dataType : "json"
	}).done(function(json) {
		for(team of json) {
			$("#mySelect").append(`
					<option id="mst\${team.prj_id}" data-master_id="\${team.master_id}" value="\${team.prj_id}"  data-prj_id="\${team.prj_id}" data-prj_name="\${team.prj_name}">\${team.prj_name}</option>
			`);
		};
		if(${sessionScope.myPrj != null}) {
			var a = $("#mySelect").find("[value=${myPrj.prj_id}]").text();
			$("#title").html(a);
		}
		$("#mySelect").val('${myPrj.getPrj_id()}');
		$("#title").html($("#mySelect").text());
	}).fail(function(xhr, status, message) {
		alert("프로젝트 리스트 출력 실패");
	});
	
</script>