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
				<form name="search-form">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value="all" selected>전체</option>
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" onclick="getSerchList()" type="button">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
				</form>
			</aside>
		</div>
	</div>


	<form name="form1" method="post" action="projectSerchList">

		<select name="search_option">
			<option value="all"
				<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>

			<option value="fnd"
				<c:if test="${map.search_option == 'fnd'}">selected</c:if>>펀딩</option>

			<option value="ofr"
				<c:if test="${map.search_option == 'ofr'}">selected</c:if>>구인</option>


		</select> 
		<input name="keyword" value="${map.keyword}"> 
		<button type="submit"><i class="ti-search"></i></button>
		<input type="submit" value="조회">
	</form>





	<!-- 검색창 끝 -->
	<div>내용 들어올곳</div>


	<script type="text/javascript">
		function getSerchList() {
			$.ajax({
				type : 'GET',
				url : "/prj/projectSerchList",
				data : $("form[name=search-form]").serialize(),
				success : function (result) {
					console.log("검색 하러감?")
				}
			
			})
			/* .done(console.log("갔다옴?"))
			.fail(function(data){
                console.log("에러남");
                callback(data);
            }); */
			
			
			

		}
	</script>
</body>
</html>