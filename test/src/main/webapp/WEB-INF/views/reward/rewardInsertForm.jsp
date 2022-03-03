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
		<!-- <button type="button" onclick="rewardPlus()">+</button> -->
	</h3>


	<form action="rewardInsert" >
		<%-- master_id = ${sessionScope.sessionMId}<br>
		prj_id = ${sessionScope.sessionPId}<br> --%>
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
	<div>
		<ul>
			<c:if test="${empty rewards }">
				<li>리워드를 등록해주세요</li>
			</c:if>
			<c:forEach items="${rewards }" var="reward">
				<li>리워드 이름 : ${reward.rwd_name }<br> 
					리워드 정보 : ${reward.rwd_cnt }<br> 
					금액 : ${reward.rwd_prc }원<br> 
					수량 : ${reward.rwd_goal }개<br>
					<!-- 뭐가 좋은지? 1-->
					<%-- <input type="hidden" value="${reward.reward_id }">  --%>
					<c:if test="${reward.rwd_cot == 0 }">
						<!-- 뭐가 좋은지? 1-->
						<!-- <button type="button" onclick="ajaxRewardMinus()">-</button> -->
							
						<!-- 뭐가 좋은지? 2-->
						<form action="rewardDelete">
							<input type="hidden" id="reward_id" name="reward_id" value="${reward.reward_id }">
							<input type="submit" value="-">
						</form>
					</c:if>
				</li>
				<br>
			</c:forEach>
		</ul>
	</div>
	
	<!-- 이동버튼 -->
	<button type="button" >완료</button>
	<button type="button" >이전 페이지</button>
	
	<script type="text/javascript">

		//function rewardPlus() {
		//	console.log("모달로 할려면 쓰고 아니면 지울것");
		//
		//}

		function ajaxRewardMinus() {
			console.log("삭제하러가자")
			//리워드 등록은 재활용 할꺼니깐 구입한 사람있으면 마이너스 못하게 하기
			//아니면 - 다 보이게 하고 구입한사람이 있다고 알려주는걸로 바꾸기
			var num = event.path[1].childNodes[9].value;
			console.log(num);
			
			//아작스 호출할꺼?
			
			
		}
		
		
	</script>

</body>
</html>