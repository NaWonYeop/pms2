<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div class="card">
		<div class="card-body">
			<div class="form-group">
				<label>My Project</label> <select id="mySelect"
					class="js-example-basic-single w-100">
					<option selected>프로젝트를 선택하세요</option>

				</select>
				<button id="myBtn" type="button">선택</button>
			</div>
		</div>
	</div>
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="team"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">TeamMember</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="application"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Application</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="progress"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Progress</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="card"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Card</span>
		</a></li>
	
	
		<!-- <li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="icon-head menu-icon"></i> <span class="menu-title">User
					Pages</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="team">
							TeamMember </a></li>
					<li class="nav-item"><a class="nav-link" href="application">
							Application </a></li>
				</ul>
			</div></li>
		
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="icon-head menu-icon"></i> <span class="menu-title">User
					Pages</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="progress">
							Progress </a></li>
					<li class="nav-item"><a class="nav-link" href="card"> Card
					</a></li>
				</ul>
			</div></li>


		
		<li class="nav-item"><a class="nav-link" href="progress"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Progress</span>
		</a></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="icon-layout menu-icon"></i> <span class="menu-title">UI
					Elements</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/ui-features/buttons.html">Buttons</a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/ui-features/typography.html">Typography</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i class="icon-columns menu-icon"></i>
				<span class="menu-title">Form elements</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/forms/basic_elements.html">Basic Elements</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#charts" aria-expanded="false" aria-controls="charts"> <i
				class="icon-bar-graph menu-icon"></i> <span class="menu-title">Charts</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/charts/chartjs.html">ChartJs</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#tables" aria-expanded="false" aria-controls="tables"> <i
				class="icon-grid-2 menu-icon"></i> <span class="menu-title">Tables</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/tables/basic-table.html">Basic table</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#icons" aria-expanded="false" aria-controls="icons"> <i
				class="icon-contract menu-icon"></i> <span class="menu-title">Icons</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="icons">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/icons/mdi.html">Mdi icons</a></li>
				</ul>
			</div></li>





		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#error" aria-expanded="false" aria-controls="error"> <i
				class="icon-ban menu-icon"></i> <span class="menu-title">Error
					pages</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="error">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/error-404.html"> 404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/error-500.html"> 500 </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			href="pages/documentation/documentation.html"> <i
				class="icon-paper menu-icon"></i> <span class="menu-title">Documentation</span>
		</a></li> -->
	</ul>
</nav>

<script>
	$(function() {
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
	});
</script>

<script>
	$("#myBtn").on("click", function(event) {
		var prj_id = $("#mySelect").val();
		var master_id = $("#mst").data("master_id");
		
		console.log('prj_id= ' + prj_id);
		console.log('master_id= ' + master_id);
		
		$.ajax({
			url: "myPrj",
			type: "GET",
			data : {
				prj_id: prj_id,
				master_id: master_id
			}
		}).done(function() {
			alert("프로젝트 선택완료");
		}).fail(function (xhr, status, message) {
			alert("프로젝트 선택실패");
		});
	});

</script>
