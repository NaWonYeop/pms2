<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-scroller">
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalCenter">+</button>

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
										<label for="prg_content">Content</label> 
										<input
											type="text" class="form-control" id="prg_content"
											name="prg_content" placeholder="할 일">
										<label
											for="prg_str">시작일</label>
											
										<input
											type="date" class="form-control"
											id="prg_str" name="prg_str">
											
										<label
											for="prg_ed">종료일</label>
											
										<input
											type="date" class="form-control"
											id="prg_ed" name="prg_ed">
									</div>
									<button id="bbb" type="submit" class="btn btn-primary">Submit</button>
								</form>
								<!-- Form End -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">저장</button>
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
			console.log(json);
			for(prg of json) {
				if(prg.level == 1) {
					var li = $(`<li class="list-group-item">\${prg.prg_content}</li>`);
					$("#card").append(li);
				} else if(prg.level == 2) {
					var ul = $(`<ul class="list-group list-group-flush"></ul>`);
					li.append(ul);
					var li2 = $(`<li class="list-group-item">\${prg.prg_content}</li>`);
					ul.append(li2);
				}
			}
		}).fail(function () {
			console.log('실패');
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
