<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table-row {
		font-family: 'TmoneyRoundWindRegular';
	}
</style>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">게시판</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">KEROKERORI~</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact-section section_padding">
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>전체 유저 리스트</h2>
			</div>
		</div>


			<div id="data_list_wrapper" class="dataTables_wrapper no-footer" style="width: 80%; margin-left: 10%">
				<table id="data_list" class="table table-bordered">
					<thead class="table-head">
						<tr>
							<th><div class="visit">이름</div></th>
							<th><div class="country">이메일</div></th>
							<th><div class="visit">가입일</div></th>
							<th><div class="visit">권한</div></th>
							<th><div class="visit">동결여부</div></th>
						</tr>
					</thead>	
					<tbody>
						<c:forEach items="${AdminUser }" var="user">
							<tr>		
								<td><div class="visit ">${user.user_name }</div></td>
								<td><div class="country">${user.user_email }</div></td>
								<td><div class="visit"><fmt:formatDate value="${user.user_j_date }" pattern="yyyy/MM/dd" /></div></td>
								<td><div class="visit" id="ath${user.user_id }">${user.user_ath }</div></td>
								<td>
									<div class="visit">
										<c:choose>
											<c:when test="${user.user_ath eq 'ice'}">
												<button class="button button-contactForm btn_1" id="btn${user.user_id }" onclick="ice(${user.user_id},'${user.user_email }')">해제</button>
											</c:when>
											<c:otherwise>
												<button class="button button-contactForm btn_1" id="btn${user.user_id }" onclick="ice(${user.user_id},'${user.user_email }')">동결</button>
											</c:otherwise>
										</c:choose>
									
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>						
			</div>

	</section>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	function ice(id,email) {
		$.ajax({
    		url: 'adminIce',
    		type: 'post', 
    		data: {
    			user_email: email
    		},
    		success: function(result) {
    			$('#ath'+id).html(result);
    			if(result=='ice')
	    			$('#btn'+id).html('해제');
    			else
    				$('#btn'+id).html('동결');
    			toastr.success('수정되었습니다.');
    		}
    	})
	}
	jQuery(function($) {
		$("#data_list").DataTable({
			lengthChange : false,

			// 정렬 기능 숨기기
			ordering : false,

			// 정보 표시 숨기기
			info : false,

			displayLength : 15
		});
	});
	</script>
</body>
</html>