<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<body>

	<h3>
		리워드 등록
	</h3>


	<form action="rewardInsert">
		${sessionScope}
		프로젝트명, 담당자명 보여주기<br>
		<input type="hidden" id="master_id" name="master_id" value="${sessionScope.sessionMId}"> 
		<input type="hidden" id="prj_id" name="prj_id" value="${sessionScope.sessionPId}">
		리워드 이름 <input type="text" id="rwd_name" name="rwd_name" placeholder="리워드 명을 지정해주세요" required="required"><br> 
		리워드 정보 <input type="text" id="rwd_cnt" name="rwd_cnt" placeholder="리워드 구성" required="required"><br> 
		금액 <input type="number" id="rwd_prc" name="rwd_prc" required="required" placeholder="금액">원<br>
		수량 <input type="number" id="rwd_goal" name="rwd_goal" required="required" placeholder="수량">개<br> 
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
	</form>

	<br>
	<h3>리워드 목록</h3>

	<div id="List">
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
						<input type="submit" value="-">
						</form>
					</c:if>
				</li>
				<br>
			</c:forEach>
		</ul>
		<!-- 쓸지 안쓸지 고민 -->
		<button type="button">완료</button>
	</div>
</body>
</html>