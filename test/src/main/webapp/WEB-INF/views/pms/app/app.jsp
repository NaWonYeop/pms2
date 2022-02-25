<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="container-scroller">
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Hoverable Table</h4>
							<p class="card-description">
								Add class
								<code>.table-hover</code>
							</p>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Number</th>
											<th>UserName</th>
											<th>Classification</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody id="myTbody">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function () {
		$.ajax({
			url: "appSelectList",
			type: "GET",
			dataType: "json"
		}).done(function (json) {
			for (app of json) {
				$("#myTbody").append(`
						
				<tr class="myTr" data-master_id="\${app.master_id}">
					<td>\${app.app_id}</td>
					<td>\${app.user_name}</td>
					<td>\${app.app_clsfc}</td>
					<td>
						<div class="btn-group">
							<button id="myBtn" type="button"
								class="btn btn-outline-secondary btn-sm dropdown-toggle"
								data-toggle="dropdown">\${app.app_stt}</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" onclick="chainge(this)" >ing</a> 
								<a class="dropdown-item" onclick="chainge(this)" >ok</a>
								<a class="dropdown-item" onclick="chainge(this)" >no</a>
							</div>
						</div>
					</td>
				</tr>`);
			};

		}).fail(function (xhr, status, message) {
			alert(" status: " + status + " er:" + message);
		});
	});
	
	
	function chainge(ths) {
		var app_id = $(".myTr").children().eq(0).text();
		var master_id = $(".myTr").data("master_id");
		var app_stt = $(ths).text();
		
		console.log(typeof app_id);
		console.log(typeof master_id);
		console.log(typeof app_stt);
		
		$('.dropdown-menu').on('click', '.dropdown-item', function () {
			$.ajax({
				url: "appUpdate",
				type: "GET",
				data : {
					app_id: app_id,
					master_id: master_id,
					app_stt: app_stt
				},
				dataType: "text"
			}).done(function (json) {
				console.log('성공');
			});
		});
	}

	function addClass(e) {
		switch (e) {
			case 'ing':
				$(".myTr").children().eq(3).addClass("badge badge-info");
				break;
			case 'ok':
				$(".myTr").children().eq(3).addClass("badge badge-success");
				break;
			case 'no':
				$(".myTr").children().eq(3).addClass("badge badge-danger");
				break;
		};
	}
	
</script>


<!-- <script>
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function () {
			var userId = $(this).closest('tr').find('#hidden_userId').val();
			var result = confirm(userId + " 사용자를 정말로 삭제하시겠습니까?");
			if (!result)
				return;

			$.ajax({
				url: conPath + '/userDelete',
				data: {
					id: userId
				},
				type: 'get',
				dataType: 'json'
			}).done(function (xhr) {
				console.log(xhr.result);
				userList();
			}).fail(function (xhr, status, msg) {
				console.log("상태값 :" + status + " Http에러메시지 :" + msg);
			});
		}); //삭제 버튼 클릭
	} //userDelete

	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function () {
			var userId = $(event.target).closest('tr').find('#hidden_userId').val();
			//특정 사용자 조회
			$.ajax({
				url: conPath + '/userSelect',
				data: {
					id: userId
				},
				type: 'GET',
				dataType: 'json'
			}).done(
				userSelectResult
			).fail(function (xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			});
		}); //조회 버튼 클릭
	} //userSelect

	//사용자 조회 응답
	function userSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:text[name="password"]').val(user.password);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	} //userSelectResult

	//사용자 수정 요청
	function userUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function () {
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();
			$.ajax({
				url: conPath + '/userUpdate',
				type: 'PUT',
				dataType: 'json',
				data: JSON.stringify({
					id: id,
					name: name,
					password: password,
					role: role
				}),
				contentType: 'application/json'
			}).done(function (data) {
				userList();
			}).fail(function (xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			});
		}); //수정 버튼 클릭
	} //userUpdate

	//사용자 등록 요청
	function userInsert() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function () {
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();
			$.ajax({
				url: conPath + '/userInsert',
				type: 'POST',
				data: {
					id: id,
					name: name,
					password: password,
					role: role
				}
				dataType: 'json',
			}).done(function (response) {
				userList();
			}).fail(function (xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			});
		}); //등록 버튼 클릭
	} //userInsert


	//사용자 등록 요청
	function userInsert2() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function () {

			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var passsword = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();
			$.ajax({
				url: "users",
				type: 'POST',
				dataType: 'json',
				data: {
					id: id,
					name: name,
					password: password,
					role: role
				},
				success: function (response) {
					if (response.result == true) {
						userList();
					}
				},
				error: function (xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		}); //등록 버튼 클릭
	} //userInsert
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url: conPath + '/userSelectAll',
			type: 'GET',
			dataType: 'json'
		}).fail(function (xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		}).done(function (datas) {
			$("tbody").empty();
			$.each(datas, function (idx, item) {
				$('<tr>')
					.append($('<td>').html(item.id))
					.append($('<td>').html(item.name))
					.append($('<td>').html(item.password))
					.append($('<td>').html(item.role))
					.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
					.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
					.appendTo('tbody');
			}); //each
		});
	} //userList
</script> -->