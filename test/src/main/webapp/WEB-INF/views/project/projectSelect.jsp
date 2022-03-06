<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<form action="searchPage" >
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
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'"><c:out value="${result.keyword}" />
							<div class="input-group-append">
								<button class="btn" type="submit" >
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> 
					<input type="hidden" name="amount" value="2">
				</form>
			</aside>
		</div>
	</div>
	<!-- 검색창 끝 -->
	
	<div id="list">내용 들어올곳
	
		번호 : ${project.prj_id}<br>
		이름 : ${project.prj_name}<br>
		담당자 아이디 : ${project.master_id}<br>
		시작일 ~ 마감일 : ${project.prj_str} ~ ${project.prj_ed}<br>
		등록일 : ${project.prj_reg_date}<br>
		조회수 : ${project.prj_hit}<br>
		구인 여부 : ${project.prj_ofr_prop}<br>
		펀딩 여부 : ${project.prj_fnd_prop}<br>
		버전 : ${project.prj_ver}<br>
		상세 내용 : ${project.prj_cnt}<br>
		
	</div>


	
		
		
</body>
</html>