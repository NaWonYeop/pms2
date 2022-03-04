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
				<form name="search-form" onclick="getSerchList()">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value="" selected>전체</option>
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" type="submit">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
				</form>
			</aside>
		</div>
	</div>
	<!-- 검색창 끝 -->
	
	
	<!-- 검색창 시작 -->
	<div class="row justify-content-center">
		<div class="col-sm-7">
			<aside class="single_sidebar_widget search_widget">
				<form name="search-form2" onclick="getSerchList2()">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value="" selected>전체</option>
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" type="submit">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
			</aside>
		</div>
	</div>
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
		
		function getSerchList2() {
			$.ajax({
				type : 'GET',
				url : "/prj/projectSerchList2",
				data : $("form[name=search-form2]").serialize(),
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