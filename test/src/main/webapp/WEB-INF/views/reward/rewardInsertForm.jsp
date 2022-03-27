<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .name {
        font-weight: bold;
        font-size: large;
    }

    .button {
        margin-right: 2%;
        
    }
</style>
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">REWARD</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">리워드</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<%-- ${sessionScope }<br> 프로젝트명 보여줄까? --%>
	<div class="container">
        <div class="row">
        	<div class="col-5">
                <h2 class="contact-title"> 리워드 등록하기</h2>
            
				<form class="form-contact contact_form" action="rewardInsert">
				<input type="hidden" id="master_id" name="master_id" value="${sessionScope.sessionMId}"> 
				<input type="hidden" id="prj_id" name="prj_id" value="${sessionScope.sessionPId}">
					<div class="row">
						<div class="col-12">
							<div class="form-group">
	                        	<p>리워드 이름 </p>
	                        	<input type="text" class="form-control" id="rwd_name" name="rwd_name" placeholder="이름을 지정해주세요" required="required"> 
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>리워드 정보</p>
								<input type="text" class="form-control" id="rwd_cnt" name="rwd_cnt" placeholder="리워드 구성" required="required">
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>금액</p>
								<p><input type="number" id="rwd_prc" name="rwd_prc" required="required" placeholder="금액"> 원</p>
							</div>	
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>수량</p>
								<p><input type="number" id="rwd_goal" name="rwd_goal" required="required" placeholder="수량"> 개</p>
							</div>
						</div>
						<div class="col-9">
							<div class="form-group mt-3">
								<input type="submit" class="button" value="등록">
								<input type="reset" class="button" value="초기화">
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="col-2">
			<!-- 빈칸 -->  
			</div>
			
			<div class="col-5">
				<h2 class="contact-title"> 리워드 목록</h2>
				<div class="row" id="List">
					<div class="form-group">
						<ul>
							<c:if test="${empty rewards }">
								<li>리워드를 등록해주세요</li>
							</c:if>
							<c:forEach items="${rewards }" var="reward">
								<li>리워드 이름 : ${reward.rwd_name }<br> 
									리워드 정보 : ${reward.rwd_cnt }<br> 
									금액 : ${reward.rwd_prc }원<br> 
									수량 : ${reward.rwd_goal }개<br> 
									
									<c:if test="${reward.rwd_cot == 0 }">
										<form action="rewardDelete">
										<input type="hidden" id="reward_id" name="reward_id" value="${reward.reward_id }">
										<input class="button " style="background-color: #F27457" type="submit" value="삭제">
										</form>
									</c:if>
								</li>
								<br>
							</c:forEach>
						</ul>
						<button class="button" type="button" onClick="location.href='projectSelect?prj_id=${sessionScope.sessionPId}'">PRJ상세</button><br>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>