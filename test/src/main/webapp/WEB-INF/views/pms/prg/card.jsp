<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-scroller">
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalCenter">섹션 입력</button>

				<!-- Modal -->
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
											class="form-control" id="prg_ed" name="prg_ed">
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
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		list();
		$('#exampleModalCenter').on('shown.bs.modal', function (e) {
			$('[name="prg_manager"]').remove();
			var prg_manager = e.relatedTarget.dataset.prg_id;
			if($(e.relatedTarget).hasClass("todo")){
				$("#insertForm").append(`<input type="hidden" name="prg_manager" value="\${prg_manager}">`);
			}
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
					var li = $(`
							<li class="list-group-item">\${prg.prg_content}
							<button data-prg_id="\${prg.prg_id}" type="button" class="btn btn-primary todo" data-toggle="modal"
								data-target="#exampleModalCenter">할 일 입력</button>
							<button id="midBtn" data-prg_id="\${prg.prg_id}" type="button" class="btn btn-danger" >x</button>
							</li>`);
					$("#card").append(li);
				} else if(prg.level == 2) {
					var ul = $(`<ul class="list-group list-group-flush"></ul>`);
					var li2 = $(`<li class="list-group-item">\${prg.prg_content}<button id="smlBtn" data-prg_id="\${prg.prg_id}" type="button" class="btn btn-danger">x</button></li>`);
					ul.append(li2);
					li.append(ul);
				}
			}
		}).fail(function () {
			console.log('실패');
		});
	}
</script>

<script>
	// 섹션 추가, 할 일 추가
	$(".modal-footer").on("click", "#submitBtn", function() {
		var seriaData = $("#insertForm").serialize();
		console.log("섹션추가 문구: " + seriaData);
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
	
	
	// 동적 버튼만들기 - 부모태그에 클릭이벤트를 걸고 실제 거는 클래스를 클릭뒤에 적어준다.
	// 클릭했을 때 삭제시키는 함수
	 
	$("#card").on("click", "#midBtn", function(e) {
		console.log("del");
		var result = confirm("정말로 삭제하시겠습니까?");
		if (!result){
			return;				
		}
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
				alert("삭제할 수 없습니다.")
			}
			list();
		}).fail(function (xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});
	
	$("#card").on("click", "#smlBtn", function(e) {
		console.log("del");
		var result = confirm("정말로 삭제하시겠습니까?");
		if (!result){
			return;				
		}
		var prg_id = e.currentTarget.dataset.prg_id;
		console.log(prg_id);
		$.ajax({
			url: "smlDelete",
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
</script>

<!-- <script>

	$.ajax({
	    type    : "POST",
	    url        : "/sample.do",
	    contentType: "application/json",
	    dataType:"json",
	    data     : JSON.stringify(params)    
	})
	.done(function (data, textStatus, xhr) {
	    console.log(xhr);
	    if(data.result_cd == "1"){
	        alert("success!");
	    } else {
	        alert("에러발생["+data.result_cd+"]");
	        console.log(data.result_msg);
	        callback(data);
	    }
	})
	.fail(function(data, textStatus, errorThrown){
	    console.log("fail in get addr");
	    callback(data);
	});
</script> -->
