<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<body>
 ${project}<br>
	
	<div id="list">
		(나중에 지울것)번호 : ${project.prj_id}<br>
			조회수 : ${project.prj_hit}<br>
			이름 : ${project.prj_name}<br>
			등록일 : <fmt:formatDate value="${project.prj_reg_date }" pattern="yyyy-MM-dd" /><br>
			담당자 아이디 : ${project.master_id}<br>
			시작일 ~ 마감일 : 
			<fmt:formatDate value="${project.prj_str }" pattern="yyyy-MM-dd" /> ~ 
			<fmt:formatDate value="${project.prj_ed }" pattern="yyyy-MM-dd" /><br>
			(나중에 삭제)구인 여부 : ${project.prj_ofr_prop}<br>
			<c:if test="${project.prj_ofr_prop == 1}">
			<!-- 구인 있을시 -->
			============구인============<br>
			구인 시작일 ~ 구인 마감일 : 
			<fmt:formatDate value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" /> ~ 
			<fmt:formatDate value="${project.prj_ofr_ed }" pattern="yyyy-MM-dd" /><br>	
			프론트 : ${project.prj_frn_prs}<br>
			백 : ${project.prj_bk_prs}<br>
			DB : ${project.prj_db_prs}<br>
			서버 : ${project.prj_ser_prs}<br>
			조건 : ${project.prj_cnd}<br>
			지역 : ${project.prj_ar}<br>
			============구인============<br>
			</c:if>
			(나중에 삭제)펀딩 여부 : ${project.prj_fnd_prop}<br>
			<c:if test="${project.prj_fnd_prop == 1}">
			<!-- 펀딩 있을시 -->
			============펀딩============<br>
			펀딩 시작일 ~ 펀딩 마감일 : 
			<fmt:formatDate value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" /> ~ 
			<fmt:formatDate value="${project.prj_fnd_ed }" pattern="yyyy-MM-dd" /><br>
			<c:forEach items="${rewards }" var="reward">
			===========리워드<br>
			리워드 명 : ${reward.rwd_name}<br>
			리워드 내용 : ${reward.rwd_cnt}<br>
			금액 : ${reward.rwd_prc}<br>
			구입수량 : ${reward.rwd_cot}<br>
			판매수량 : ${reward.rwd_goal}<br>
			판매 여부 : ${reward.rwd_stt}<br>
			===========리워드<br>
			</c:forEach>	
			목표금액 : ${project.prj_gl_prc}<br>
			============펀딩============<br>
			</c:if>
			개발마감 여부 : ${project.prj_devEd_prop}<br>
			뷰 여부 : ${project.prj_view_prop}<br>
			버전 : ${project.prj_ver} 리스트 뿌려야되~~~~~~~~~~~~~~~~<br>
			
			상세 내용 : ${project.prj_cnt}<br>
	</div>
	
	
	<form action="projectVerUp">
		<input type="hidden" id="prj_id" name="prj_id" value="${project.prj_id}">
		<input type="hidden" id="prj_ver" name="prj_ver" value="${project.prj_ver}">
		<input type="submit" value="버전업">
	</form>
	
	
	<form action="projectViewDel">
		<input type="hidden" id="prj_id" name="prj_id" value="${project.prj_id}">
		<input type="submit" value="삭제">
	</form>

	
		
		
</body>
</html>