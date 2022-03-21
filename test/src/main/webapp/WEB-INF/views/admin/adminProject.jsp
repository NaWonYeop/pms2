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
					<div>
						<h4 style="float: right; color: #fff">KEROKERORI~</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact-section section_padding">
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>전체 프로젝트 리스트</h2>
			</div>

		</div>
		<div id="data_list_wrapper" class="dataTables_wrapper no-footer"
			style="width: 80%; margin-left: 10%">
			<table id="data_list" class="table table-bordered">
				<thead class="table-head">
					<tr>
						<th><div class="visit">프로젝트명</div></th>
						<th><div class="country">기간</div></th>
						<th><div class="visit">총 참여인원</div></th>
						<th><div class="visit">상태</div></th>
						<th><div class="visit">입금</div></th>
						<th><div class="visit">삭제</div></th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Project }" var="myp">
						<tr  id="${myp.prj_id}">
							<td><div class="visit ">${myp.prj_name }</div></td>
							<td>
								<div class="country">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
							</td>
							<td><div class="visit">${myp.count }명</div></td>
							<td>
							<div class="visit">
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 0 }">
                            		진행중
                            	</c:when>
										<c:otherwise>
                            		종료
                            	</c:otherwise>
									</c:choose>
								</div></td>
							<td><div class="visit">
									<button class="button button-contactForm btn_1"
										onclick="location.href='//=${myp.prj_id}'">입금</button>
								</div></td>
							<td><div class="visit">
									<button class="button button-contactForm btn_1"
										onclick="delproject(${myp.prj_id})">삭제</button>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


	</section>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	  toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-top-right",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "1500",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}    
		function delproject(id) {
			$.ajax({
        		url: 'adminPrjDelete',
        		type: 'post', 
        		data: {
           			prj_id: id,
        		},
        		success: function() {
        			$('#'+id).remove();
        			toastr.success('삭제 되었습니다.');
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