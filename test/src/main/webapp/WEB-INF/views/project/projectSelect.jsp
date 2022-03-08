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
		번호 : ${project.prj_id}<br>
		이름 : ${project.prj_name}<br>
		담당자 아이디 : ${project.master_id}<br>
		시작일 ~ 마감일 : 
		<fmt:formatDate value="${project.prj_str }" pattern="yyyy-MM-dd" /> ~ 
		<fmt:formatDate value="${project.prj_ed }" pattern="yyyy-MM-dd" /><br>
		등록일 : <fmt:formatDate value="${project.prj_reg_date }" pattern="yyyy-MM-dd" /><br>
		조회수 : ${project.prj_hit}<br>
		구인 여부 : ${project.prj_ofr_prop}<br>
		펀딩 여부 : ${project.prj_fnd_prop}<br>
		버전 : ${project.prj_ver}<br>
		상세 내용 : ${project.prj_cnt}<br>
		뷰 여부 : ${project.prj_view_prop}<br>
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