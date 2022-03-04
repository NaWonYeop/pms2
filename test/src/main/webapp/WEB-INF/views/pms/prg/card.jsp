<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-scroller">
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalCenter">중분류 입력</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">중분류 입력</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- Form -->
								<form action="prgInsert" method="GET">
									<div class="form-group">
										<label for="prg_content">중분류 내용</label> <input type="text"
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
	});
	
	function list() {
		$.ajax({
			url: "prgSelectList",
			type: "GET",
			dataType: "json",
			async: false
		}).done(function (json) {
			for(prg of json) {
				if(prg.level == 1) {
					var li = $(`
							<li id="myLi" data-prg_id="\${prg.prg_id}" class="list-group-item">\${prg.prg_content}
							<button id="insBtn" type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModalCenter">+</button>
							<button class="delBtn" type="button" class="btn btn-danger">x</button>
							</li>`);
					$("#card").append(li);
				} else if(prg.level == 2) {
					var ul = $(`<ul class="list-group list-group-flush"></ul>`);
					li.append(ul);
					var li2 = $(`<li class="list-group-item">\${prg.prg_content}<button type="button" class="btn btn-primary">+</button></li>`);
					ul.append(li2);
				}
			}
		}).fail(function () {
			console.log('실패');
		});
	}
</script>

<script>
	function prgInsert() {
		$("#insBtn").on("click", function() {
			$.ajax({
				url: "prgInsert",
				type: "GET",
				data: {
					
				}
			}).done(function (xhr) {
				list();
			}).fail(function (xhr, status, msg) {
				console.log("상태값 :" + status + " Http에러메시지 :" + msg);
			});	
		});
	}
	
	function prgChainge() {
		$("#submitBtn").on("click" function() {
			$.ajax({
				url: "smlUpdate"
			}).done(function (){
				list();
			}).fail(function (xhr, status, msg) {
				console.log("상태값 :" + status + " Http에러메시지 :" + msg);
			});	
		});
	}

	// 동적 버튼만들기 - 부모태그에 클릭이벤트를 걸고 실제 거는 클래스를 클릭뒤에 적어준다.
	// 클릭했을 때 삭제시키는 함수
	function prgDelete() {
		$("#card").on("click", ".delBtn", function(event) {
			console.log("del");
			var result = confirm("정말로 삭제하시겠습니까?");
			if (!result){
				return;				
			}
			var prg_id = $(this).parent().data("prg_id");
			$.ajax({
				url: "prgDelete",
				type: "GET",
				data: {
					prg_id: prg_id
				},
				dataType: "json"
			}).done(function (json) {
				list();
			}).fail(function (xhr, status, msg) {
				console.log("상태값 :" + status + " Http에러메시지 :" + msg);
			});	
		});
	}
	
	
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
