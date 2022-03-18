<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-wrapper">
	<!-- 리스트 -->
	<!-- <div class="list-wrapper px-3"> -->
	<div class="list-wrapper">
		<div class="row">
			<!-- 섹션입력 모달 버튼 -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModalCenter">섹션 입력</button>
		</div>
		<ul id="ulForm" class="d-flex flex-column-reverse todo-list">
			<!-- <li>
				<div class="form-check">
					<label class="form-check-label"> <input class="checkbox"
						type="checkbox"> Resolve all the low priority tickets due
						today
					</label>
				</div> <i class="remove ti-close"></i>
			</li>

			<li class="completed">
				<div class="form-check">
					<label class="form-check-label"> <input class="checkbox"
						type="checkbox" checked> Project review
					</label>
				</div> <i class="remove ti-close"></i>
			</li> -->
		</ul>
	</div>
	<!-- 섹션Modal창 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">섹션 입력</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Form -->
					<!-- 섹션 입력 -->
					<form id="insertForm">
						<div class="form-group">
							<label for="prg_content">내용</label> <input type="text"
								class="form-control" id="prg_content" name="prg_content"
								placeholder="할 일"> <label for="prg_str">시작일</label> <input
								type="date" class="form-control" id="prg_str" name="prg_str">
							<label for="prg_ed">종료일</label> <input type="date"
								class="form-control" id="prg_ed" name="prg_ed"> <label
								for="insertTeams">담당</label> <select id="insertTeams"
								class="js-example-basic-single w-100">
							</select>
						</div>
						<!-- <button type="submit" class="btn btn-primary">Submit</button> -->
					</form>
					<!-- Form End -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="submitBtn" type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Card -->
	<div id='calendar-container'>
		<ul id="card" class="list-group list-group-flush"></ul>
	</div>
	<!-- Card End -->


	<!-- 업데이트Modal 창 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="updateForm">
						<div class="form-group">
							<input type="hidden" id="prg_id" name="prg_id"> <label
								for="prg_content">내용</label> <input type="text"
								class="form-control" id="prg_content" name="prg_content"
								placeholder="할 일"> <label for="prg_str">시작일</label> <input
								type="date" class="form-control" id="prg_str" name="prg_str">
							<label for="prg_ed">종료일</label> <input type="date"
								class="form-control" id="prg_ed" name="prg_ed"> <label
								for="updateTeams">담당</label> <select id="updateTeams"
								class="js-example-basic-single w-100">
							</select>
						</div>
						<!-- <button type="submit" class="btn btn-primary">Submit</button> -->
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="updateSumbitBtn" type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		list();
		$('#exampleModalCenter').on('shown.bs.modal', function (e) {
			$('[name="prg_manager"]').remove();
			$('#updateTeams').remove();
			var prg_manager = e.relatedTarget.dataset.prg_id;
			if($(e.relatedTarget).hasClass("todo")){
				$("#insertForm").append(`<input type="hidden" name="prg_manager" value="\${prg_manager}">`);
				$.ajax({
					url : "teamSelect",
					type : "GET",
					dataType : "json"
				}).done(function(json) {
					$("#insertTeams").empty();
					for(team of json) {
						$("#insertTeams").append(`<option id="team" value="\${team.user_id}">\${team.user_id}</option>`);
					};
				}).fail(function(xhr, status, message) {
					console.log("1");
					console.log(" status: " + status + " er:" + message);
				});
			};
		});
		
		$('#exampleModalCenter').on('shown.bs.modal', function (e) {
			$("#prg_content").val('');
			$("#prg_str").val('');
			$("#prg_ed").val('');
		});
		
	});
	
	function list() {
		$.ajax({
			url: "prgSelectList",
			type: "GET",
			dataType: "json",
			async: false
		}).done(function (json) {
			console.log("리스트 출력 성공");
			$("#card").empty();
			for(prg of json) {
				if(prg.level == 1) {
					$("#ulForm").append(`
						
					<li>
						<div class="progress">
							<div id="prgBar\${prg.prg_id}" class="progress-bar" role="progressbar" style="width: 100%"
							aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input class="checkbox"
								type="checkbox">\${prg.prg_content}
							</label>
						</div> 
						<i id="midBtn" data-prg_id="\${prg.prg_id}" class="remove ti-close"></i>
					</li>`);
					
					
					
					
					
					
					var li = $(`
							<div class="col">
							<div class="progress">
								<div id="prgBar\${prg.prg_id}" class="progress-bar" role="progressbar" style="width: 0%"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
							</div>
							<li class="list-group-item">\${prg.prg_content}
							<button data-prg_id="\${prg.prg_id}" type="button" class="btn btn-primary todo" data-toggle="modal"
								data-target="#exampleModalCenter">할 일 입력</button>
								<button id="midUpBtn" data-prg_id="\${prg.prg_id}" data-prg_content="\${prg.prg_content}" data-prg_str="\${prg.prg_str}" data-prg_ed="\${prg.prg_ed}" type="button" class="btn btn-info" data-toggle="modal" data-target="#updateModal">수정</button>
							<button id="midBtn" data-prg_id="\${prg.prg_id}" type="button" class="btn btn-danger" >x</button>
							</li>`);
					$("#card").append(li);
					prgPersent(prg.prg_id);
				} else if(prg.level == 2) {
					var ul = $(`<ul class="list-group list-group-flush"></ul>`);
					var li2 = $(`<li id="myLi\${prg.prg_id}" class="list-group-item">\${prg.prg_content}
							<button id="smlChk" type="button" data-prg_id="\${prg.prg_id}" class="btn btn-success 1">완료</button>
							<button id="smlUpBtn" type="button" data-prg_cmp_prop="\${prg.prg_cmp_prop}" data-prg_id="\${prg.prg_id}" data-prg_content="\${prg.prg_content}" data-prg_str="\${prg.prg_str}" data-prg_ed="\${prg.prg_ed}" data-prg_user="\${prg.prg_user}" class="btn btn-info 2" data-toggle="modal" data-target="#updateModal">수정</button>
							<button id="smlBtn" type="button" data-prg_cmp_prop="\${prg.prg_cmp_prop}" data-prg_id="\${prg.prg_id}" class="btn btn-danger 3">x</button>
							</li></div>`);
					ul.append(li2);
					li.append(ul);
					if(prg.prg_cmp_prop != 0) {
						$("#myLi"+prg.prg_id+' button').attr('disabled', 'disabled');
					}
				}
			}
		}).fail(function () {
			console.log('리스트 출력 실패');
		});
	}
	
	// 완료퍼센트 확인하기
	function prgPersent(prg_id) {
		var prg_manager = prg_id;
		$.ajax({
			url: "prgCheck",
			type : "GET",
			dataType : "json",
			data: {
				prg_manager: prg_manager
			}
		}).done(function (result){
			var iresult = parseInt(result);
			$("#prgBar"+prg_id).attr("aria-valuenow", iresult);
			$("#prgBar"+prg_id).html(iresult+"%");
			$("#prgBar"+prg_id).css("width", iresult+"%");
		}).fail(function(xhr, status, message) {
			console.log(" status: " + status + " er:" + message);
		});
	}
</script>

<script>
	$.ajax({
		url : "teamSelect",
		type : "GET",
		dataType : "json"
	}).done(function(json) {
		for(team of json) {
			$("#teams").append(`
					<option id="team" data-master_id="\${team.master_id}" value="\${team.prj_id}">\${team.prj_id}</option>
					`);
		};
	}).fail(function(xhr, status, message) {
		console.log(" status: " + status + " er:" + message);
	});

	// 완료버튼 만들기
	$("#card").on("click", "#smlChk", function(e) {
		var result = confirm("완료 하시겠습니까?");
		if (!result){
			return;				
		}
		
		var prg_id = e.currentTarget.dataset.prg_id;
		$.ajax({
			url: "smlCheck",
			type: "GET",
			dataType: "text",
			data: {
				prg_id: prg_id
			}
		}).done(function(result) {
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	
	// 동적 버튼만들기 - 부모태그에 클릭이벤트를 걸고 실제 거는 클래스를 클릭뒤에 적어준다.
	// 클릭했을 때 삭제시키는 함수
	$(".modal-footer").on("click", "#submitBtn", function() {
		var seriaData = $("#insertForm").serialize();
		$.ajax({
			url: "prgInsert",
			type: "GET",
			data: seriaData
		}).done(function (result) {
			console.log(result);
			$('#exampleModalCenter').modal('hide');
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	// 섹션 삭제 -> 해당 섹션의 할 일은 가장빠른 번호의 섹션으로 옮겨짐
	/* $("#card") */
	$("#ulForm").on("click", "#midBtn", function(e) {
		var result = confirm("정말로 삭제하시겠습니까?");
		if (!result){
			return;				
		}
		debugger
		var prg_id = e.currentTarget.dataset.prg_id;
		console.log(prg_id);
		$.ajax({
			url: "midDelete",
			type: "GET",
			data: {
				prg_id: prg_id
			},
			dataType: "text"
		}).done(function (result) {
			if(result == 'fail') {
				console.log("삭제할 수 없습니다.");
			}
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	
	// 할 일 삭제
	$("#card").on("click", "#smlBtn", function(e) {
		var result = confirm("정말로 삭제하시겠습니까?");
		if (!result){
			return;				
		}
		var prg_id = e.currentTarget.dataset.prg_id;
		console.log(prg_id);
		$.ajax({
			url: "prgDelete",
			type: "GET",
			data: {
				prg_id: prg_id
			},
			dataType: "text"
		}).done(function (result) {
			console.log(result);
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	
	// 섹션 수정 모달 띄우기
	$("#card").on("click", "#midUpBtn", function(e) {
		var prg_id = e.currentTarget.dataset.prg_id;
		var prg_str = e.currentTarget.dataset.prg_str;
		var prg_ed = e.currentTarget.dataset.prg_ed;
		var prg_content = e.currentTarget.dataset.prg_content;
		$('input[name=prg_id]').attr('value', prg_id);
		$('input[name=prg_str]').attr('value', prg_str);
		$('input[name=prg_ed]').attr('value', prg_ed);
		$('input[name=prg_content]').attr('value', prg_content);
	});
	
	
	// 할 일 수정 모달 띄우기
	$("#card").on("click", "#smlUpBtn", function(e) {
		$("#updateTeams").empty();
		var prg_id = e.currentTarget.dataset.prg_id;
		var prg_str = e.currentTarget.dataset.prg_str;
		var prg_ed = e.currentTarget.dataset.prg_ed;
		var prg_content = e.currentTarget.dataset.prg_content;
		
		$('input[name=prg_id]').attr('value', prg_id);
		$('input[name=prg_str]').attr('value', prg_str);
		$('input[name=prg_ed]').attr('value', prg_ed);
		$('input[name=prg_content]').attr('value', prg_content);
		$.ajax({
			url : "teamSelect",
			type : "GET",
			dataType : "json"
		}).done(function(json) {
			for(team of json) {
				$("#updateTeams").append(`<option id="team" value="\${team.user_id}">\${team.user_id}</option>`);
			};
		}).fail(function(xhr, status, message) {
			console.log(" status: " + status + " er:" + message);
		});
	});
	
	
	// 수정 실행하기
	$(".modal-footer").on("click", "#updateSumbitBtn", function() {
		console.log("수정 실행");
		var seriaData = $("#updateForm").serialize();
		console.log(seriaData);
		$.ajax({
			url: "prgUpdate",
			type: "GET",
			data: seriaData
		}).done(function (result) {
			console.log(result);
			$('#updateModal').modal('hide');
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	
	
</script>
