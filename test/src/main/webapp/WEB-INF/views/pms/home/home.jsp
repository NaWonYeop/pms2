<%@page import="co.test.prj.team.service.MyPrjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@font-face {
    font-family: 'TmoneyRoundWindExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

html {
	font-size: 14px;
}

h5 {
	font-size: 1.28571429em;
	font-weight: 700;
	line-height: 1.2857em;
	margin: 0;
}

.card {
	font-size: 1em;
	overflow: hidden;
	padding: 0;
	border: none;
	border-radius: .28571429rem;
	box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}

.card-block {
	font-size: 1em;
	position: relative;
	margin: 0;
	padding: 1em;
	border: none;
	border-top: 1px solid rgba(34, 36, 38, .1);
	box-shadow: none;
}

.card-img-top {
	margin-bottom: 0px!important;
	height: 120px;
}

.card-title {
	font-size: 1.28571429em;
	font-weight: 700;
	line-height: 1.2857em;
	
}

.card-text {
	clear: both;
	margin-top: .5em;
	color: rgba(0, 0, 0, .68);
}

.card-footer {
	font-size: 1em;
	position: static;
	top: 0;
	left: 0;
	max-width: 100%;
	padding: .75em 1em;
	color: rgba(0, 0, 0, .4);
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	background: #fff;
}

.card-inverse .btn {
	border: 1px solid rgba(0, 0, 0, .05);
}

.profile {
	position: absolute;
	top: -12px;
	display: inline-block;
	overflow: hidden;
	box-sizing: border-box;
	width: 25px;
	height: 25px;
	margin: 0;
	border: 1px solid #fff;
	border-radius: 50%;
}

.profile-avatar {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

.profile-inline {
	position: relative;
	top: 0;
	display: inline-block;
}

.profile-inline ~ .card-title {
	display: inline-block;
	margin-left: 4px;
	vertical-align: top;
}

.text-bold {
	font-weight: 700;
}

.meta {
	font-size: 1em;
	color: rgba(0, 0, 0, .4);
}

.meta a {
	text-decoration: none;
	color: rgba(0, 0, 0, .4);
}

.meta a:hover {
	color: rgba(0, 0, 0, .87);
}
</style>

<div class="content-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="row">
					<div class="col-12 col-xl-8 mb-4 mb-xl-0">
						<h3 class="font-weight-bold" style="font-family: 'TmoneyRoundWindExtraBold';">전체 진행율</h3>
						<!-- <h6 class="font-weight-normal mb-0">
						All systems are running smoothly! You have <span
							class="text-primary">3 unread alerts!</span>
					</h6> -->
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="progress">
						<div id="allPrgBar" class="progress-bar" role="progressbar"
							style="width: 0%" aria-valuenow="0" aria-valuemin="0"
							aria-valuemax="100">0%</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- chart -->
	<div class="container">
		<div id="chartContainer" class="row">
			<canvas id="barChart"></canvas>
			<div id="price" class="row"></div>
		</div>
	</div>
	<!-- chart End-->

	<!-- team -->
	<div class="container">
		<div id="row" class="row">

			<!-- <div class="col-sm-6 col-md-4 col-lg-3 mt-4">
				<div class="card">
					<img class="card-img-top"
						src="https://picsum.photos/200/150/?random
">
					<div class="card-block">
						<h4 class="card-title">Tawshif Ahsan Khan</h4>
						<div class="meta">
							<a href="#">Friends</a>
						</div>
						<div class="card-text">Tawshif is a web designer living in
							Bangladesh.</div>
					</div>
					<div class="card-footer">
						<span class="float-right">Joined in 2013</span> <span><i
							class=""></i>75 Friends</span>
					</div>
				</div>
			</div> -->


		</div>
	</div>
	<!-- team End -->

</div>


<!-- team modal -->
<div class="modal fade" id="teamSelectModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label>My Project</label>
			</div>
			<div id="selectModal" class="modal-body">
				<select id="teamSelect" class="js-example-basic-single w-80">
					<option selected>&lt;프로젝트를 선택하세요&gt;</option>
				</select>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<!-- <button id="insertTeam" type="button" class="btn btn-primary">선택</button> -->
			</div>
		</div>
	</div>
</div>
<!-- team modal end -->

<input id="homeSession" type="hidden" value="${sessionScope.myPrj}">
<input id="prj_id" type="hidden" value="${sessionScope.myPrj.prj_id}">
<script>
	// 시작하면 자신이 속한 프로젝트를 가져와서 뿌려줌
	$(function() {
		$.ajax({
			url : "myProjectList",
			type : "GET",
			dataType : "json",
			async : false
		}).done(function(json) {
			for(team of json) {
				$("#teamSelect").append(`
				<option id="opt\${team.prj_id}" data-master_id="\${team.master_id}" value="\${team.prj_id}"  data-prj_id="\${team.prj_id}" data-prj_name="\${team.prj_name}">\${team.prj_name}</option>
				`);
			};
			var homeSession = $("#homeSession").val();
			if(!$("#homeSession").val()) {
				$("#nav").css("display", "none");
			}
		}).fail(function(xhr, status, message) {
			alert("프로젝트 리스트 출력 실패");
		});
		
		if(${sessionScope.myPrj == null}) {
			$('#teamSelectModal').modal('show');
		} else {
			var prj_id = $("#prj_id").val();
			writeChart();
			pmsTeamList();
			progress();
		}
		
		
	});
	
	function progress() {
		$.ajax({
			url : "allCheck",
			type : "GET",
			dataType : "json"
		}).done(function(result) {
			$("#allPrgBar").attr("aria-valuenow", result);
			$("#allPrgBar").html(result+"%");
			$("#allPrgBar").css("width", result+"%");
			$("#teamSelectModal").modal('hide');
			console.log("progress실행");
		}).fail(function(xhr, status, message) {
			console.log("프로젝트 리스트 출력 실패");
		});
	}
	
	function writeChart() {
		//bar
		$("#price").empty();
		$("#barChart").remove();
		var canvas = $('<canvas id="barChart"></canvas>')
		$("#chartContainer").append(canvas);
		
		
		var barChart = document.getElementById("barChart");
		var ctxB = barChart.getContext("2d");
		ctxB.clearRect(0, 0, barChart.width, barChart.height);
		
		
		var prj_id = $("#prj_id").val();
		
		$.ajax({
			url : "buyList",
			type : "GET",
			dataType : "json",
			data : {
				prj_id : prj_id,
			}
		}).done(function(json) {
			var labels = [];
			var data = [];
			var total = 0;
			var totalPrice = 0;
			if(json.length != 0) {
				for(var i = 0; i < json.length; i++) {
					labels[i] = json[i].buy_date;
					data[i] = json[i].buy_won;
					total += json[i].buy_won;
				}
				totalPrice = json[0].rwd_goal;
				
				$("#price").append(`<h4 style="text-align: center; font-family: 'TmoneyRoundWindExtraBold';">총 펀딩금액 : \${totalPrice} / 현재 펀딩금액 : \${total}</h4`);
				
				var ctxB = document.getElementById("barChart").getContext("2d");
				var myBarChart = new Chart(ctxB, {
				  type: 'bar',
				  data: {
				    labels: labels,
				    datasets: [{
				      label: '펀딩금액',
				      data: data,
				      backgroundColor: [
				        'rgba(255, 99, 132, 0.2)',
				        'rgba(54, 162, 235, 0.2)',
				        'rgba(255, 206, 86, 0.2)',
				        'rgba(75, 192, 192, 0.2)',
				        'rgba(153, 102, 255, 0.2)',
				        'rgba(255, 159, 64, 0.2)'
				      ],
				      borderColor: [
				        'rgba(255,99,132,1)',
				        'rgba(54, 162, 235, 1)',
				        'rgba(255, 206, 86, 1)',
				        'rgba(75, 192, 192, 1)',
				        'rgba(153, 102, 255, 1)',
				        'rgba(255, 159, 64, 1)'
				      ],
				      borderWidth: 3
				    }]
				  },
				  options: {
				    scales: {
				      yAxes: [{
				        ticks: {
				          beginAtZero: true
				        }
				      }]
				    }
				  }
				});
				
			} else {
				$("#price").append(`<h3 style="text-align: center;">모금중인 펀딩이 없습니다.</h3>`);
			}
		}).fail(function() {
			console.log("호출실패");
		});
		
		
	}
	
	
	// 팀 멤버 카드로 나타내기
	function pmsTeamList() {
		var prj_id = $("#prj_id").val();
		$.ajax({
			url : "pmsTeamList",
			type : "GET",
			dataType : "json",
			data : {
				prj_id : prj_id,
			}
		}).done(function(json) {
	
			$("#row").empty();
			for (pms of json) {
				<c:set var="tos" value="pms.tm_pos"/>
				var str=''
				if(${tos} =='Master')
				{
					str='<div class="card-img-top" style="background-color:#F28705;"><img style="object-fit: contain;width: 50%;height: 100%;display: inline-block;"class="card-img-top" src="resources/images/master.png"><h2 style="font-weight:bold;width: 50%;margin: 0;display:inline-block;">Master</h2></div>'
				}
				else if(${tos} =='Manager')
				{
					str='<div class="card-img-top" style="background-color:#22A2F2;"><img style="object-fit: contain;width: 50%;height: 100%;display: inline-block;"class="card-img-top" src="resources/images/manager.png"><h3 style="font-weight:bold;width: 50%;margin: 0;display:inline-block;">Manager</h3></div>'
				}
				else
				{
					str='<div class="card-img-top" style="background-color:#F2CB05;"><img style="object-fit: contain;width: 50%;height: 100%;display: inline-block;"class="card-img-top" src="resources/images/employee.png"><h3 style="font-weight:bold;width: 50%;margin: 0;display:inline-block;">Employee</h3></div>'
				}

				
				$("#row").append(`
						<div class="col-sm-6 col-md-4 col-lg-3 mt-4">
								<div class="card">`+
								str
								+`<div class="card-block">
										<h4 class="card-title">\${pms.user_name}</h4>
										<div class="meta">
											<a href="#">\${pms.tm_pos}</a>
										</div>
								
									<div class="card-text">\${pms.tm_dept}</div>
								</div>
								
								<div class="card-footer">
									<span><i class=""></i>\${pms.user_email}</span>
									<span class="float-right">0\${pms.user_tel}</span> 
								</div>
							</div>
						</div>`);
			}
		}).fail(function(xhr, status, message) {
			console.log("실패");
		});
	}
	// home select id = teamSelect, button = insertTeam, option id = opt
	
	// 모달에서 프로젝트 변경할 때 session이 없을 때 1번 실행됨
	$("#selectModal").on("change", function () {
		var prj_id = $(this).find("option:selected").data("prj_id");
		var master_id = $(this).find("option:selected").data("master_id");
		var prj_name = $(this).find("option:selected").data("prj_name");
		$("#prj_id").val(prj_id);
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
			$("#teamSelectModal").modal('hide');
			$("#title").html(" "+prj_name);
			$("#nav").css("display", "block");
			pmsTeamList();
			writeChart();
		}).fail(function(xhr, status, message) {
			alert("프로젝트 선택실패");
		});
	});
	
</script>