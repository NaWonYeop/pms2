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

<c:if test="${result.type == 'fnd'}">
펀딩검색
</c:if>

<c:if test="${result.type == 'ofr'}">
구인검색
</c:if>

<c:if test="${result.type == '' or result.type == null}">
전체검색
</c:if>
<br> 
${sessionScope }<br>
${sessionScope.sessionUser.user_id } <!-- master ID 로 사용할것 -->

	<!-- 검색창 시작 -->
	<div class="row justify-content-center">
		<div class="col-sm-7">
			<aside class="single_sidebar_widget search_widget">
				<form action="projectSearchPage" >
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type" >
									<option value="" 
									<c:if test="${result.type == '' or result.type == null}">
									selected
									</c:if>
									>전체</option>
									<option value="fnd"
									<c:if test="${result.type == 'fnd'}">
									selected
									</c:if>
									>펀딩</option>
									<option value="ofr"
									<c:if test="${result.type == 'ofr'}">
									selected
									</c:if>
									>구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control" 
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" type="submit" >
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> 
					<input type="hidden" name="amount" value="5">
				</form>
			</aside>
		</div>
	</div>
	<!-- 검색창 끝 -->
	
	<button type="button" onClick="location.href='projectInsertForm'">프로젝트 등록</button><br>
	<div id="list">
	<c:if test="${empty result.projects }">
				검색 결과가 없습니다.
	</c:if>
		<c:forEach items="${result.projects }" var="project">
		${result}<br>
		<br>
		${project}<br>
			<div class="card">
			<form action="projectSelect" method="get">
			<input type="hidden" name="prj_id" id="prj_id" value="${project.prj_id}">
			<input type="submit" value="${project.prj_name}"><br>
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
			펀딩사진 들고올 아이디 : ${project.ctf_id}<br>
			펀딩 시작일 ~ 펀딩 마감일 : 
			<fmt:formatDate value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" /> ~ 
			<fmt:formatDate value="${project.prj_fnd_ed }" pattern="yyyy-MM-dd" /><br>	
			목표금액 : ${project.prj_gl_prc}<br>
			============펀딩============<br>
			</c:if>
			개발마감 여부 : ${project.prj_devEd_prop}<br>
			버전 : ${project.prj_ver}<br>
			뷰 여부 : ${project.prj_view_prop}<br>
			</form>
			</div>
		</c:forEach>
	</div>


	
	<div id="more">더보기
		<form id="morePage" onsubmit="return false" onclick="ajaxMorePage()" style="display: inline-block;">
			<input type="submit" value="더보기">
			<input type="hidden" name="pageNum" id="moreKey" value="2">
			<input type="hidden" name="type" value="${result.type}">
			<input type="hidden" name="keyword" value="${result.keyword}">
			<input type="hidden" name="amount"  value="${result.amount}">
		</form>
	</div>
	
	<script type="text/javascript">
	function ajaxMorePage() {
		
		console.log('여기 옴?');
		
		$.ajax({
			type : 'GET',
			url : "/prj/ajaxMorePage",
			data : $("#morePage").serialize(),
			dataTyep: "json",
			success : function (result) {
				console.log("검색 하러감?");
				console.log(result);
				
				for (var a of result.projects){
					console.log(a);
					var ofr='';
					var fnd='';
					if(a.prj_ofr_prop == 1){
						ofr = "============구인============<br>"
							 +"구인 시작일 ~ 구인 마감일 :" 
							 + a.prj_ofr_str +" ~ "+ a.prj_ofr_ed+ "<br>"	
							 +"프론트 : "+ a.prj_frn_prs +"<br>"
							 +"백 : "+ a.prj_bk_prs + "<br>"
							 +"DB : "+ a.prj_db_prs + "<br>"
							 +"서버 : "+ a.prj_ser_prs + "<br>"
							 +"조건 : "+ a.prj_cnd + "<br>"
							 +"지역 : "+ a.prj_ar + "<br>"
							 +"============구인============<br>";
					}
					if(a.prj_fnd_prop == 1){
						fnd = "============펀딩============<br>"
							 +"펀딩사진 들고올 아이디 : "+ a.ctf_id +"<br>"
							 +"펀딩 시작일 ~ 펀딩 마감일 :" 
							 + a.prj_fnd_str +" ~ "+ a.prj_fnd_ed+ "<br>"	
							 +"목표금액 : "+ a.prj_gl_prc + "<br>"
							 +"============펀딩============<br>";
					}
					$("#list").append(`
							
							<div class="card">
							<form action="projectSelect" method="get">
							<input type="hidden" name="prj_id" id="prj_id" value="\${a.prj_id}">
							<input type="submit" value="\${a.prj_name}"><br>
							(나중에 지울것)번호 : \${a.prj_id}<br>
							조회수 : \${a.prj_hit}<br>
							이름 : \${a.prj_name}<br>
							등록일 : \${a.prj_reg_date}<br>
							담당자 아이디 : \${a.master_id}<br>
							시작일 ~ 마감일 : \${a.prj_str} ~ \${a.prj_ed}<br>
							(나중에 삭제)구인 여부 : \${a.prj_ofr_prop}<br>
							\${ofr}		
							
							(나중에 삭제)펀딩 여부 : \${a.prj_fnd_prop}<br>
							\${fnd}		
					
							개발마감 여부 : ${project.prj_devEd_prop}<br>
							버전 : ${project.prj_ver}<br>
							뷰 여부 : ${project.prj_view_prop}<br>
							</form>
							</div>
							
					`);
					
				}
				
				
				$("#moreKey").val(result.page)
				console.log("더보기 값 변경?");
				if(result.projects.length == 0){
					console.log("더볼게없음")
					$("#more").remove()
					//나중에 경고창으로 올리기 버튼 삭제는 하지말것
				}
				
			}
		})

	}
	
	</script>
	
	
		
		
</body>
</html>