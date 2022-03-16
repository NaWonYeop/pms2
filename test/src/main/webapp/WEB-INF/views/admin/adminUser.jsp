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
				<h2>전체 유저 리스트</h2>
			</div>
		</div>



		<div class="section-top-border">
			<div class="col-11">
				<div class="progress-table">
					<div class="progress-table">
						<div class="table-head ">
							<div class="serial"></div>
							<div class="visit">이름</div>
							<div class="country">이메일</div>
							<div class="visit">가입일</div>
							<div class="visit">권한</div>
							<div class="visit">동결여부</div>

						</div>
						<c:forEach items="${AdminUser }" var="user">


							<div class="table-row ">
								<div class="serial"></div>
								<div class="visit ">${user.user_name }</div>
								<div class="country">
									${user.user_email }
								</div>
								<div class="visit"><fmt:formatDate value="${user.user_j_date }" pattern="yyyy/MM/dd" /></div>
								<div class="visit" id="ath${user.user_id }">
									${user.user_ath }
								</div>
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
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</section>
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
	
	</script>
</body>
</html>