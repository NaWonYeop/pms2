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
</head>
<body>
	<section class="contact-section section_padding">
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>전체 프로젝트 리스트</h2>
			</div>
			
		</div>



		<div class="section-top-border">
			<div class="col-11">
				<div class="progress-table">
					<div class="progress-table">
						<div class="table-head ">
							<div class="serial"></div>
							<div class="visit">프로젝트명</div>
							<div class="country">기간</div>
							<div class="visit">총 참여인원</div>
							<div class="visit">상태</div>
							<div class="visit">입금</div>
							<div class="visit">삭제</div>

						</div>
						<c:forEach items="${Project }" var="myp">


							<div class="table-row " id="${myp.prj_id}">
								<div class="serial"></div>
								<div class="visit ">${myp.prj_name }</div>
								<div class="country">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
								<div class="visit">${myp.count }명</div>
								<div class="visit">
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 0 }">
                            		진행중
                            	</c:when>
										<c:otherwise>
                            		종료
                            	</c:otherwise>
									</c:choose>
								</div>
								<div class="visit">
									<button class="button button-contactForm btn_1" onclick="location.href='//=${myp.prj_id}'">입금</button>
								</div>
								<div class="visit">
									<button class="button button-contactForm btn_1" onclick="delproject(${myp.prj_id})">삭제</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</section>
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
	</script>
</body>
</html>