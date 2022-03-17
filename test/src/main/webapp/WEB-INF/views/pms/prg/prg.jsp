<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/main.js'></script>

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script> -->


<div class="content-wrapper">
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div id='calendar-container'>
					<div id='cal'></div>
				</div>

				<!-- 일정 추가 MODAL -->
				<div class="modal fade" id="calModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Calendar</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-12">

										<form id="calForm">
											<div class="form-group">
												<input type="hidden" id="prg_str" name="prg_str"> <input
													type="hidden" id="prg_ed" name="prg_ed"> <input
													type="hidden" id="prg_id" name="prg_id"> <label
													for="prg_content">내용</label> <input type="text"
													class="form-control" id="prg_content" name="prg_content"
													placeholder="할 일">
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button id="calSubmit" type="button" class="btn btn-primary">저장</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


				<!-- 할 일 modal창 -->
				<div class="modal fade" id="todoModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">ToDoList</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div id="infoBody" class="col-xs-12">
										<!-- for문 돌리면서 값 붙여넣기 -->
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$.ajax({
			url : "calSelectList",
			type : "GET",
			dataType : "json"
		}).done(function(json) {
			var events = [];
			console.log(json);
			$.each(json, function(idx, obj) {
				var title = obj.prg_content;
				var start = obj.prg_str;
				var end = obj.prg_ed;
				var id = obj.prg_id;
				events.push({
					id : id,
					title : title,
					start : start,
					end : end
				});
			});
			writeCalendar(events);
			$("[title='Previous month']").attr("class", "fc-next-button fc-button fc-button-primary fc-button-active");
			$("[title='Next month']").attr("class", "fc-next-button fc-button fc-button-primary fc-button-active");
			$("[title='This month']").attr("class", "fc-next-button fc-button fc-button-primary fc-button-active");
		}).fail(function(xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});
	});

	// 달력 일정 클릭하면 모달창 뜨는데 그때 섹션의 할일들을 붙여넣는다.

	// 달력 그리기
	function writeCalendar(events) {
		// calendar element 취득
		var calendarEl = $('#cal')[0];
		// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next,today',
				center : 'title',
				right : 'dayGridMonth'
			},
			initialView : 'dayGridMonth',
			locale : 'ko',
			editable : true,
			selectable : true,
			eventClick : function(event) {
				$("#todoModal").modal('show');
				var prg_manager = event.event._def.publicId;
				console.log(prg_manager);
				$.ajax({
					url : "toDoSelect",
					type : "GET",
					data : {
						prg_manager : prg_manager
					},
					dataType : "json"
				}).done(function(json) {
					$("#infoBody").empty();
					if(json.length != 0){
						for(prg of json) {
							$("#infoBody").append(`
										<div>할일: \${prg.prg_content}</div>
									`);
						}
					} else {
						$("#infoBody").append(`<h4>값이없음</h4>`);
					}
					
					
				}).fail(function(xhr, status, msg) {
					console.log("할일없음");
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				});
			},
			events : events,
			eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				prgUpdate(obj);
			},
			eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},
			select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성
				$('#calModal').modal('show');
				$("#prg_str").val(arg.startStr);
				$("#prg_ed").val(arg.endStr);
			}
		});
		calendar.render();

		$(".modal-footer").on("click", "#calSubmit", function(e) {
			var title = $('input[name=prg_content]').val();
			var start = $('input[name=prg_str]').val();
			var end = $('input[name=prg_ed]').val();
			var seriaData = $("#calForm").serialize();
			$('input[name=prg_content]').val('');
			$('input[name=prg_str]').val('');
			$('input[name=prg_ed]').val('');
			$('input[name=prg_id]').val('');
			if (title) {
				//ajax
				$.ajax({
					url : "prgInsert",
					type : "GET",
					data : seriaData
				}).done(function(result) {
					console.log("insert");
					console.log(result);
					calendar.addEvent({
						title : title,
						start : start,
						end : end
					});
				}).fail(function(xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				});
			}
			calendar.unselect();
			$('#calModal').modal('hide');
		});
	}

	function prgUpdate(obj) {
		$.ajax({
			url : "prgUpdate",
			type : "GET",
			data : {
				prg_content : obj.event.title,
				prg_str : obj.event.startStr,
				prg_ed : obj.event.endStr,
				prg_id : obj.event.id
			}
		}).done(function(result) {
			console.log(result);
		}).fail(function(xhr, status, msg) {
			console.log("상태값 :" + status + " Http에러메시지 :" + msg);
		});

	}
</script>