<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/main.js'></script>

<div class="container-scroller">
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div id='calendar-container'>
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

				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		writeCalendar();
	});

	
	
	function writeCalendar() {
		// calendar element 취득
		var calendarEl = $('#cal')[0];
		// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth'
			},
			initialView : 'dayGridMonth',
			editable : true,
			selectable : true,
			eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				console.log(obj);
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
			var seriaData = $("#calForm").serialize();
			$('input[name=prg_content]').val('');
			if (title) {
				//ajax
				$.ajax({
					url : "prgInsert",
					type : "GET",
					data : seriaData
				}).done(function(result) {
					console.log(result);
					calendar.addEvent({
						title : title,
						start : $("#prg_str").val(),
						end : $("#prg_ed").val()
					});
				}).fail(function(xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				});
			}
			calendar.unselect();
			$('#calModal').modal('hide');
		});
	}
</script>


<!-- <label class="col-xs-4" for="edit-color">색상</label>
<select class="inputModal" name="color" id="edit-color">
	<option value="#D25565" style="color: #D25565;">빨간색</option>
	<option value="#9775fa" style="color: #9775fa;">보라색</option>
	<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
	<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
	<option value="#f06595" style="color: #f06595;">핑크색</option>
	<option value="#63e6be" style="color: #63e6be;">연두색</option>
	<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
	<option value="#4d638c" style="color: #4d638c;">남색</option>
	<option value="#495057" style="color: #495057;">검정색</option>
</select> -->

<!-- 
<script>
(function(){
	$(function(){
	// calendar element 취득
	var calendarEl = $('#calendar')[0];
	// full-calendar 생성하기
	var calendar = new FullCalendar.Calendar(calendarEl, {
	height: '700px', // calendar 높이 설정
	expandRows: true, // 화면에 맞게 높이 재설정
	slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	// 해더에 표시할 툴바
	headerToolbar: {
	left: 'prev,next today',
	center: 'title',
	right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	},
	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	editable: true, // 수정 가능?
	selectable: true, // 달력 일자 드래그 설정가능
	nowIndicator: true, // 현재 시간 마크
	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	locale: 'ko', // 한국어 설정
	eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	console.log(obj);
	},
	eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	console.log(obj);
	},
	eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	console.log(obj);
	},
	select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	var title = prompt('Event Title:');
	if (title) {
	calendar.addEvent({
	title: title,
	start: arg.start,
	end: arg.end,
	allDay: arg.allDay
	})
	}
	calendar.unselect()
	}
	// 이벤트
	events: [
	{
	title: 'All Day Event',
	start: '2021-07-01',
	},
	{
	title: 'Long Event',
	start: '2021-07-07',
	end: '2021-07-10'
	},
	{
	groupId: 999,
	title: 'Repeating Event',
	start: '2021-07-09T16:00:00'
	},
	{
	groupId: 999,
	title: 'Repeating Event',
	start: '2021-07-16T16:00:00'
	},
	{
	title: 'Conference',
	start: '2021-07-11',
	end: '2021-07-13'
	},
	{
	title: 'Meeting',
	start: '2021-07-12T10:30:00',
	end: '2021-07-12T12:30:00'
	},
	{
	title: 'Lunch',
	start: '2021-07-12T12:00:00'
	},
	{
	title: 'Meeting',
	start: '2021-07-12T14:30:00'
	},
	{
	title: 'Happy Hour',
	start: '2021-07-12T17:30:00'
	},
	{
	title: 'Dinner',
	start: '2021-07-12T20:00:00'
	},
	{
	title: 'Birthday Party',
	start: '2021-07-13T07:00:00'
	},
	{
	title: 'Click for Google',
	url: 'http://google.com/', // 클릭시 해당 url로 이동
	start: '2021-07-28'
	}
	]
	});
	// 캘린더 랜더링
	calendar.render();
	});
	})();
</script> -->