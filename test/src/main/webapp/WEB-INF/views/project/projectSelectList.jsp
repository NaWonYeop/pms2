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
	<!-- 검색창 시작 -->
	<div class="row justify-content-center">
		<div class="col-sm-7">
			<aside class="single_sidebar_widget search_widget">
				<form action="projectSearchPage" >
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type" value=" <c:out value="${result.type}" />" >
									<option value="" selected>전체</option>
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
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
	${result }
	<div id="list">
	<c:if test="${empty result.projects }">
				검색 결과가 없습니다.
	</c:if>
	<c:forEach items="${result.projects }" var="project">
		<div class="card">
		<form action="projectSelect" method="post">
		<input type="hidden" name="prj_id" id="prj_id" value="${project.prj_id}">
		<input type="submit" name="prj_name" id="prj_name" value="${project.prj_name}">
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
					$("#list").append(`
							
							<div class="card">
							<form action="projectSelect" method="post">
							<input type="hidden" name="prj_id" id="prj_id" value="\${a.prj_id}">
							<input type="submit" name="prj_name" id="prj_name" value="\${a.prj_name}">
							번호 : \${a.prj_id}<br>
							이름 : \${a.prj_name}<br>
							담당자 아이디 : \${a.master_id}<br>
							시작일 ~ 마감일 : \${a.prj_str} ~ \${a.prj_ed}<br>
							등록일 : \${a.prj_reg_date}<br>
							조회수 : \${a.prj_hit}<br>
							구인 여부 : \${a.prj_ofr_prop}<br>
							펀딩 여부 : \${a.prj_fnd_prop}<br>
							버전 : \${a.prj_ver}<br>
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